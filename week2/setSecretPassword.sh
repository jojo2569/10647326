#!/bin/bash

# Purpose      : Creates Hased Password intoFile, secrets.txt.
# Filename     : setSecretpassword.sh
# Date Created : 18-Jul-23
# Date Modified: 20-Jul-23
# Author       : Joe Velardi


# Get Password (Secretly).
read -rsp "Please Enter Your Password: " password

#Redirect SHA Password to Folder Location.
echo -n $password | sha256sum > secret.txt
echo -e "\n\nThanks, All Done.\n"

exit 0
