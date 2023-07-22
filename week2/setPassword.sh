#!/bin/bash

# Purpose      : Creates/Uses Folder; Enter password and Hash into Folder/secret.txt.
# Filename     : setPassword.sh
# Date Created : 18-Jul-23
# Date Modified: 22-Jul-23
# Author       : Joe Velardi


#Get Folder Name to Create.
read -rp "Type a folder to create: " folderName

#Check if Folder Exists, Create if New.
if [[ -d "$folderName" ]]
	then
		echo -e   "\nFolder \`$folderName\` already exists, we'll use this.\n"
 	else
		mkdir "$folderName"
		echo -e "\nFolder \`$folderName\` created\n"
fi

# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

#Redirect SHA Password to Folder Location.
echo -n "$password" | sha256sum > "$folderName"/secret.txt
echo -e "\n\nThanks, All Done.\n"

exit 0
