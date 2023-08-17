#!/bin/bash

# Purpose      : Sub-Menu to Display Data Tables.
# Filename     : menuData.sh
# Date Created : 13-Aug-2023
# Date Modified: 15-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"

#Local Variables.
resultSet="-20"


#Enter Search Criteria to Display Detail.
searchPwnedData() {

	#Navigation. Search Detail.
	echo -e  "\n${GREEN}  View PWNED Data. Enter earch Criteria.${NORMAL}"
	echo     "  -----------------------------------------"

	read -rp "  Enter PWNED Website name: " searchCriteria

	searchResult=$(grep "^${searchCriteria}[^|]*" $dataCleansed | grep $searchCriteria)

	entries=$(echo "$searchResult" | wc -l)

	clear

	if [ $entries = 1 ]; then
		echo -e "$searchResult" | awk -f "displayDetail.awk"
		read
	else
		displayDataList 3 "$searchResult" "$menuItem8" "displayList.awk"
	fi

}


#Display List in Tabular Format.
displayDataList() {

	clear

	case $1 in
		[1] )
			cat $2 | awk -v header="$3" -f $4 | more 
				read -rp "Press Enter to Continue ..." ;;

		[2] )
			cat $2 | sort  --field-separator="$DELIM" $5 $6 > $dataScratch
			head -20 $dataScratch | awk -v header="$3" -f $4 
				read -rp "Press Enter to Continue ...";;

		[3] )
			echo -e "$2" | head -20 | awk -v header="$3" -f $4 ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}  An ERROR Has Occurred. Try Again ...${NORMAL}\n"
			sleep 1

	esac

}


#Local Variables.
menuItem1="Full List: PWNED Website Data"
menuItem2="Top 20: Most Recent PWNED Websites"
menuItem3="Top 20: Most Compromised Breaches"
menuItem4="Top 20: Least Compromised Breaches"
menuItem5="Full List: Breaches by Category"
menuItem6="Top 20: Most Compromised Categories"
menuItem7="Top 20: Least Compromised Categories"
menuItem8="Search PWNED Website Detail"


#Loop Through Menu.
while [ $? -eq 0 ]
do

	clear

	#Navigation. Enter Menu Option.
	echo -e  "\n${GREEN}  View PWNED Data. Enter an Option.${BLUE}"
	echo     "  -----------------------------------------"
	echo     "  1. $menuItem1"
	echo     "  2. $menuItem2"
	echo     "  3. $menuItem3"
    echo     "  4. $menuItem4"
	echo     "  -----------------------------------------"
    echo     "  5. $menuItem5"
	echo     "  6. $menuItem6"
	echo     "  7. $menuItem7"
	echo     "  -----------------------------------------"
	echo     "  8. $menuItem8"
	echo     "  -----------------------------------------"
	echo -e  "  9. Back${NORMAL}\n"

	read -rp "  Option [1-9]: " option

	case $option in
		[1] )
			displayDataList 1 "$dataCleansed" "$menuItem1" "displayList.awk" ;;

		[2] )
			displayDataList 2 "$dataCleansed" "$menuItem2" "displayList.awk" "-k3" "-r" ;;

		[3] )
			displayDataList 2 "$dataCleansed" "$menuItem3" "displayList.awk" "-nk4" "-r" ;;

		[4] )
			displayDataList 2 "$dataCleansed" "$menuItem4" "displayList.awk" "-nk4" ;;

		[5] )
			displayDataList 1 "$dataCategory" "$menuItem5" "displayCategory.awk" ;;

		[6] )
			displayDataList 2 "$dataCategory" "$menuItem6" "displayCategory.awk" "-nk1" "-r" ;;

		[7] )
			displayDataList 2 "$dataCategory" "$menuItem7" "displayCategory.awk" "-nk1" ;;

		[8] )
			searchPwnedData ;;

		[9] )
			clear
			break ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}  Invalid Entry. Try Again ...${NORMAL}"
			sleep 1

	esac

done