#!/bin/bash

# Purpose      : Sub-Menu to Display Admin Tasks.
# Filename     : menuAdmin.sh
# Date Created : 13-Aug-2023
# Date Modified: 13-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"
source "../core/functions.sh"

#Loop Through Menu.
while [ $? -eq 0 ]
do

	displayBanner

	#Navigation. Enter Menu Option.
	echo -e  "\n${GREEN}  ADMIN Tasks. Enter an Option.${BLUE}"
	echo     "  -----------------------------------------"
	echo     "  1. Download & Cleanse Data"
	echo     "  2. Change Password"
	echo     "  3. Reset Default Password"
	echo     "  -----------------------------------------"
	echo -e  "  9. Back${NORMAL}\n"

	read -rp "  Option [1-3, or 9]: " option

	case $option in
		[1] )
			./downloadData.sh ;;

		[2] )
			./passwordChange.sh ;;

		[3] )
			echo -e $hashedPassword > $secretPassword
			echo -e "\n  Password Has Been Reset ..." 
			sleep 2 ;;

		[9] )
			#Exit.
			clear
			break ;;

		* )
			#Invalid Entry.
			promptInvalidEntry

	esac

done