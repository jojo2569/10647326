#!/bin/bash

# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

sha256sum < secret.txt

if [ $? -eq 0 ] ; then

	echo "Access Granted."
	exit 0

else

	echo "Access Denied."
	exit 1

fi
