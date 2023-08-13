#!/bin/bash

# Purpose      : Assessment #4. Main Entry.
# Filename     : main.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"


#Enter Valid Password to Commence.
./passwordChecker.sh


#Loop Through Menu.
while [ $? -eq 0 ]
do

	clear

	#Navigation. Enter Menu Option.
	echo -e  "\n${GREEN}MAIN Menu. Enter an Option.${BLUE}"
	echo     "  1. View PWNED Data"
	echo     "  2. View PWNED Graphs"
	echo     "  3. Admin Tasks"
	echo -e  "  9. Exit${NORMAL}"

	read -rp "Option [1-3, or 9]: " option

	case $option in
		[1]* )
			./menuData.sh ;;

		[2]* )
			echo "2" ;;

		[3]* )
			./menuAdmin.sh ;;

		[9]* )
			#Exit.
			clear
			break ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}Invalid Entry. Try Again ...${NORMAL}"
			sleep 1

	esac

done