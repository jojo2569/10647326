#!/bin/bash

# Purpose      : Sub-Menu to Display Admin Tasks..
# Filename     : menuAdmin.sh
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
	echo -e  "\n${GREEN}ADMIN Tasks. Enter an Option.${BLUE}"
	echo     "  1. Download & Cleanse Data"
	echo     "  2. Change Password"
	echo     "  3. Reset to Default Password"
	echo -e  "  9. Back${NORMAL}"

	read -rp "Option [1-3, or 9]: " option

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