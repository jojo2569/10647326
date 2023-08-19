#!/bin/bash

# Purpose      : Enter Password; Validate Against Hashed Password (foo-bar).
# Filename     : passwordCheck.sh
# Date Created : 20-Jul-23
# Date Modified: 25-Jul-23
# Author       : Joe Velardi


#Constants
RED="\033[31m"
GREEN="\033[32m"
NORMAL="\033[0m"

# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

# Check Hashed Password from File (Absolute Path).
echo -n "$password" | sha256sum --check --status "../week2/secret.txt"

#Validate if Password is Correct, or Not.
if [ $? -eq 0 ] ; then

	# Password Matches.
	echo -e "\n\n${GREEN}Access Granted.${NORMAL}"
	sleep 1
	clear
	exit 0

else

	#Password Does Not match.
	echo -e "\n\n${RED}Access Denied. Exiting.${NORMAL}\n"
	sleep 1
	clear
	exit 1

fi
