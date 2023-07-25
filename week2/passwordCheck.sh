#!/bin/bash

# Purpose      : Enter Password; Validate Against Hashed Password (foo-bar).
# Filename     : passwordCheck.sh
# Date Created : 20-Jul-23
# Date Modified: 25-Jul-23
# Author       : Joe Velardi


#Variables
RED="\033[0;31m"
GREEN="\033[0;32m"
NORMAL="\033[0m"

# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

# Check Hashed Password from File (Absolute Path).
echo -n "$password" | sha256sum --check --status ~/scripts/portfolio/week2/secret.txt

#Validate if Password is Correct, or Not.
if [ $? -eq 0 ] ; then

	# Password Matches.
	echo -e "\n\n${GREEN}Access Granted.${NORMAL}"

else

	#Password Does Not match.
	echo -e "\n\n${RED}Access Denied. Exiting ...${NORMAL}\n"
	sleep 2
	exit 1

fi
