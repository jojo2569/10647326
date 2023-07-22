#!/bin/bash

# Purpose      : Enter Password; Validate Against Hashed Password (foo-bar).
# Filename     : passwordCheck.sh
# Date Created : 20-Jul-23
# Date Modified: 22-Jul-23
# Author       : Joe Velardi


# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

# Check Hashed Password from File.
echo -n "$password" | sha256sum --check --status secret.txt

#Validate if Password is Correct, or Not.
if [ $? -eq 0 ] ; then

	# Password Matches.
	echo -e "\nAccess Granted."

else

	#Password Does Not match.
	echo -e "\nAccess Denied."
	exit 1

fi
