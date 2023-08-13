#!/bin/bash

# Purpose      : Sub-Menu to Display Data Tables.
# Filename     : menuData.sh
# Date Created : 13-Aug-2023
# Date Modified: 13-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"

#Loop Through Menu.
while [ $? -eq 0 ]
do

	clear

	#Navigation. Enter Menu Option.
	echo -e  "\n${GREEN}View PWNED Data. Enter an Option.${BLUE}"
	echo     "  1. Display Full PWNED Data"
	echo     "  2. Top 20 - by Most Recent PWNED Websites"
	echo     "  3. Top 20 - by Most Compromised Users"
    echo     "  4. Top 20 - by Least Compromised Users"
    echo     "  5. Search PWNED Website Detail"
	echo -e  "  9. Back${NORMAL}"

	read -rp "Option [1-5, or 9]: " option

    clear

	case $option in
		[1]* )
			cat $dataCleansed | awk -f displayList.awk ;;

		[2]* )
			cat $dataCleansed | sort  --field-separator="$DELIM" -k3 -r > $dataScratch
            head -20 $dataScratch | awk -f displayList.awk ;;

		[3]* )
			cat $dataCleansed | sort  --field-separator="$DELIM" -nk4 -r > $dataScratch
            head -20 $dataScratch | awk -f displayList.awk ;;

		[4]* )
			cat $dataCleansed | sort  --field-separator="$DELIM" -nk4 > $dataScratch
            head -20 $dataScratch | awk -f displayList.awk ;;

		[5]* )
			echo "5" ;;

		[9]* )
			#Exit.
			clear
			break ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}Invalid Entry. ${NORMAL}\n\n"
			sleep 1

	esac

    read -rp "Press Any Key to Continue ..."

done


#grep . ../files/cleansedData.txt | awk -f displayList.awk

#sort by date desc
#cat ../files/cleansedData.txt | sort  --field-separator="|" -k3 -r > ../files/test.txt
#grep . ../files/test.txt | awk -f  displayList.awk

#sort by date desc
#cat $dataCleansed | sort  --field-separator="$DELIM" -nk4 -r > $dataScratch
#head -10 $dataScratch | awk -f displayList.awk