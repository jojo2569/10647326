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


#Display Banner.
displayBanner


#Check if First Time User.
if [ -f "$secretPassword" ]
then
	#Enter Valid Password to Commence.
	./passwordChecker.sh
else
	#Generate Password.
	./passwordChange.sh



fi


#Loop Through Menu.
while [ $? -eq 0 ]
do

	displayBanner

	#Navigation. Enter Menu Option.
	echo -e  "\n${GREEN}  MAIN Menu. Enter an Option.${BLUE}"
	echo     "  -----------------------------------------"
	echo     "  1. View PWNED Data"
	echo     "  2. View PWNED Graphs"
	echo     "  3. Admin Tasks"
	echo     "  -----------------------------------------"
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
			break ;;

		* )
			#Invalid Entry.
			promptInvalidEntry

	esac

done