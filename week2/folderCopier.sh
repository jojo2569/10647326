#!/bin/bash

# Purpose      : Enter a Folder and Contents to Copy, Validates if Exists.
# Filename     : folderCopier.sh
# Date Created : 18-Jul-23
# Date Modified: 22-Jul-23
# Author       : Joe Velardi


#Read Folder Name
read -rp "Type the name of the folder you would like to copy: " folderName

#Checks if Folder Name is a Valid Directory
if [ -d "$folderName" ]; then

	#Copy Folder & Contents
	read -rp "Type the name of the destination folder: " newFolderName

	cp -r "$folderName" "$newFolderName"

else

	#Folder Non Existent, DIaply Error
	echo "I couldn't find that folder"

fi
					
