#!/bin/bash

# Purpose      : Change Password.
# Filename     : passwordChange.sh
# Date Created : 13-Aug-2023
# Date Modified: 13-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"

# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

#Redirect SHA Password to Folder Location.
echo -n "$password" | sha256sum > $secretPassword
echo -e "\n\nThanks, All Done.\n"