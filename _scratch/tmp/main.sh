#!/bin/bash

# Purpose      : Assessment #4. Main Entry.
# Filename     : main.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"
source "../core/functions.sh"


#Enter Valid Password to Commence.
./passwordChecker.sh


#Displays Main Menu.
while [ $? -eq 0 ]
do

	displayBanner

	#Navigation. Enter Menu Option.
	echo -e  "\n${GREEN}  MAIN Menu. Enter an Option.${BLUE}"
	echo     "  -------------------------------------------------"
	echo     "  1. View Breached Website Data"
	echo     "  2. View PBreached Website Graphs"
	echo     "  3. Admin Tasks"
	echo     "  -------------------------------------------------"
	echo -e  "  9. Exit${NORMAL}\n"

	read -rp "  Option [1-3, or 9]: " option

	case $option in
		[1] )
			./menuData.sh ;;

		[2] )
			echo "2" ;;

		[3] )
			./menuAdmin.sh ;;

		[9] )
			#Exit.
			clear
			exit 0 ;;

		* )
			#Invalid Entry.
			promptInvalidEntry

	esac

done

