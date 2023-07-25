#!/bin/bash

# Purpose      : Run passwordCheck.sh; Display Menu to Create Folder, Copy Folder, Set a Password.
# Filename     : menu.sh
# Date Created : 24-Jul-23
# Date Modified: 25-Jul-23
# Author       : Joe Velardi


#Variables
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
BROWN="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
GREY="\033[0;37m"
BG_RED="\033[0;101m"
BG_GREEN="\033[0;102m"
BG_WHITE="\033[0;107m"
NORMAL="\033[0m"

clear

#Run passwordCheck.sh
../week2/passwordCheck.sh

function megaMenu() {

	sleep 2
	clear

	#Hashed Password matches; Enter Menu Option.
	echo -e  "\n${GREEN}MEGA MENU. Enter an Option.${BLUE}"
	echo     "  1. Create a Folder"
	echo     "  2. Copy a Folder"
	echo     "  3. Set a Password"
	echo     "  4. Calculator"
	echo     "  5. Create Week Folders"
	echo     "  6. Check Filenames"
	echo     "  7. Download a File"
	echo -e  "  8. Exit${NORMAL}"

	read -rp "Option [1-8]: " option

	clear

	case $option in
		[1]* )
			#Create a Folder.
			../week2/folderMaker.sh ;;

		[2]* )
			#Copy a Folder.
			../week2/folderCopier.sh ;;

		[3]* )
			#Set a Password.
			../week2/setPassword.sh ;;

		[4]* )
			#Calculator.
			./calculator.sh ;;

		[5]* )
			#Create Week Folders.
			./megaFolderMaker.sh ;;

		[6]* )
			#Check Filenames.
			./filenames.sh ;;

		[7]* )
			#Download a File.
			./internetDownloader.sh ;;

		[8]* )
			#Exit.
			exit 0 ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}Invalid Entey. Exiting ...${NORMAL}clear"
			sleep 1

	esac

}

while true
do
	megaMenu
done

exit 0