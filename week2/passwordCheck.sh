#!/bin/bash

# Purpose      : Enter Password; Validate Against Hashed Password (foo-bar).
# Filename     : passwordCheck.sh
# Date Created : 20-Jul-23
# Date Modified: 20-Jul-23
# Author       : Joe Velardi


# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

# Check hased Password from File.
sha256sum < secret.txt

#Validate if Password is Correct, or Not.
if [ $? -eq 0 ] ; then

	echo "Access Granted."
	exit 0

else

	echo "Access Denied."
	exit 1

fi
