#!/bin/bash

# Purpose      : Assessment #4
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


	#Hashed Password matches; Enter Menu Option.
	echo -e  "\n${GREEN}MEGA MENU. Enter an Option.${BLUE}"
	echo     "  1. View Content Data"
	echo     "  2. View Content Graphs"
	echo     "  3. Set a Password"
	echo     "  4. Calculator"
	echo     "  5. Create Week Folders"
	echo     "  6. Check Filenames"
	echo     "  7. Download & Cleanse Data"
	echo -e  "  8. Exit${NORMAL}"

	read -rp "Option [1-8]: " option

	clear

	case $option in
		[1]* )
			echo "" ;;

		[2]* )
			echo "" ;;

		[3]* )
			.echo "" ;;

		[4]* )
			echo "" ;;

		[5]* )
			echo "" ;;

		[6]* )
			echo "" ;;

		[7]* )
			echo "" ;;

		[8]* )
			#Exit.
			exit 0 ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}Invalid Enty. Exiting ...${NORMAL}"
			sleep 1

	esac

done

exit 0