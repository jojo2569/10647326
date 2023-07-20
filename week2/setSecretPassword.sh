#!/bin/bash

# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

#Redirect SHA Password to Folder Location.
echo -n $password | sha256sum > secret.txt
echo -e "\n\nThanks, All Done.\n"

exit 0
