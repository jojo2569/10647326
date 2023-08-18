#!/bin/bash

# Purpose      : Sub-Menu to Display Data Tables.
# Filename     : menuData.sh
# Date Created : 13-Aug-2023
# Date Modified: 15-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"
source "../core/functions.sh"


#Enter Search Criteria to Display Detail.
displayDataDetail() {

	while true
	do

		displayBanner

		#Navigation. Search Detail.
		echo -e  "\n${GREEN}  View PWNED Website Data. Enter Search Criteria.${NORMAL}"
		echo     "  -------------------------------------------------"

		read -rp "  Search for Breached Website Content (min. 3 Chars): " searchCriteria

		if [ ${#searchCriteria} -lt 3 ]; then
			#Does Not Meet Minimum Search Criteria.
			echo -e "\n\n${RED}  Please Enter 3 or More Characters in the Search Field.${NORMAL}\n"
			promptPressEnter
		else
			# Search For Results.
			searchResult=$(grep $searchCriteria $dataCleansed)

			if [ "$searchResult" = "" ]; then
				#No Results Found.
				echo -e "\n${RED}  No Results Were Found.${NORMAL}\n"

				read -rp "  Press Enter to Continue, or Type 'exit' to Quit: " option

				isExit=$(echo "$option" | tr '[:upper:]' '[:lower:]')
				if [ "$isExit" == "exit" ]; then break; fi

			else
				#Display Results.
				echo -e "$searchResult" | awk -f "displayDetail.awk" | more
				break
			fi
		fi

	done

}


#Display List in Tabular Format.
displayDataList() {

	displayBanner

	case $1 in
		[1] )
			#Display Full Lists.
			cat $2 | awk -v header="$3" -f $4 | more  ;;

		[2] )
			#Display Top Lists.
			cat $2 | sort  --field-separator="$DELIM" $5 $6 > $dataScratch
			head -20 $dataScratch | awk -v header="$3" -f $4 ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}  An ERROR Has Occurred. Try Again ...${NORMAL}\n"

	esac

	promptPressEnter

}


#Local Variables.
menuItem1="Full List: Breached Website Data"
menuItem2="Top 20: Most Recent Breached Websites"
menuItem3="Top 20: Most Compromised Breaches"
menuItem4="Top 20: Least Compromised Breaches"
menuItem5="Full List: Breaches by Category"
menuItem6="Top 20: Most Compromised Categories"
menuItem7="Top 20: Least Compromised Categories"
menuItem8="Search Breached Website Detail"


#Loop Through Menu.
while [ $? -eq 0 ]
do

	displayBanner

	#Navigation. Enter Menu Option.
	echo -e  "\n${GREEN}  View Breached Website Data. Enter an Option.${BLUE}"
	echo     "  -------------------------------------------------"
	echo     "  1. $menuItem1"
	echo     "  2. $menuItem2"
	echo     "  3. $menuItem3"
    echo     "  4. $menuItem4"
	echo     "  -------------------------------------------------"
    echo     "  5. $menuItem5"
	echo     "  6. $menuItem6"
	echo     "  7. $menuItem7"
	echo     "  -------------------------------------------------"
	echo     "  8. $menuItem8"
	echo     "  -------------------------------------------------"
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
			displayDataDetail ;;

		[9] )
			break ;;

		* )
			#Invalid Entry.
			promptInvalidEntry

	esac

	if [ "$isExit" != "exit" ]; then promptPressEnter; fi

done