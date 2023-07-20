#!/bin/bash

# Purpose      : Run passwordCheck.sh; Display Menu to Create Folder, Copy Folder, Set a Password.
# Filename     : menu.sh
# Date Created : 20-Jul-23
# Date Modified: 20-Jul-23
# Author       : Joe Velardi


#Run passwordCheck.sh
./passwordCheck.sh

if [ $? -eq 0 ] ; then

	#Hashed Password matches; Enter Menu Option.
	echo -e "\nCongrats! Your Password Matches. Enter a Menu Option."
	echo    "  1. Create a Folder"
	echo    "  2. Copy a Folder"
	echo    "  3. Set a Password"
	read -p "Option [1-3]: " option

	case $option in
		[1]* )
			#Create a Folder.
			./folderMaker.sh ;;

		[2]* )
			#Copy a Folder.
			./folderCopier.sh ;;

		[3]* )
			#Set a Password.
			./setPassword.sh ;;

		* )
			#invalid Entry.
			echo -e "\nInvalid Entey. Exiting ..."
			sleep 1

	esac

else

	echo "You Shall Not Pass."

fi
