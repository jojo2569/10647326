#!/bin/bash

# Purpose      : Sub-Menu to Display Data Tables.
# Filename     : menuData.sh
# Date Created : 13-Aug-2023
# Date Modified: 13-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"


#Local Variables.
menuItem1="Full List: PWNED Website Data"
menuItem2="Top 20: Most Recent PWNED Websites"
menuItem3="Top 20: Most Compromised Users"
menuItem4="Top 20: Least Compromised Users"
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

	read -rp "Option [1-9]: " option

    clear

	case $option in
		[1]* )
			cat $dataCleansed | awk -v header="$menuItem1" -f displayList.awk | more ;;

		[2]* )
			cat $dataCleansed | sort  --field-separator="$DELIM" -k3 -r > $dataScratch
            head -20 $dataScratch | awk -v header="$menuItem2" -f displayList.awk ;;

		[3]* )
			cat $dataCleansed | sort  --field-separator="$DELIM" -nk4 -r > $dataScratch
            head -20 $dataScratch | awk -v header="$menuItem3" -f displayList.awk ;;

		[4]* )
			cat $dataCleansed | sort  --field-separator="$DELIM" -nk4 > $dataScratch
            head -20 $dataScratch | awk -v header="$menuItem4" -f displayList.awk ;;

		[5]* )
			cat $dataCategory | awk -v header="$menuItem5" -f displayCategory.awk | more ;;

		[6]* )
			cat $dataCategory | sort  --field-separator="$DELIM" -nk1 -r > $dataScratch
            head -20 $dataScratch | awk -v header="$menuItem6" -f displayCategory.awk ;;

		[7]* )
			cat $dataCategory | sort  --field-separator="$DELIM" -nk1 > $dataScratch
            head -20 $dataScratch | awk -v header="$menuItem7" -f displayCategory.awk ;;

		[8]* )
			echo "Hello" ;;

		[9]* )
			#Exit.
			clear
			break ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}Invalid Entry. ${NORMAL}\n\n"
			sleep 1

	esac

    read -rp "Press the Enter Key to Continue ..."

done