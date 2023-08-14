#!/bin/bash

# Purpose      : {purpose}
# Filename     : test.sh
# Date Created : 14-Aug-2023
# Date Modified: 14-Aug-2023
# Author       : Joe Velardi


echo "Please enter password for User to be created in OIM: "
read -rp "Password: " user_passwd

echo $user_passwd
echo $regex
if [ $user_passwd -ge 8 ]; then
    echolog "Password Matches the criteria"
else
    echo "Password does not Match the criteria, exiting..."
    exit
fi


#[[ ${#s} -ge 6 && "$s" == *[[:lower:]]* && "$s" == *[[:upper:]]* && "$s" == *[0-9]* ]]