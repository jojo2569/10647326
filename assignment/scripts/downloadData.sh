#!/bin/bash

# Purpose      : Download Web Data.
# Filename     : downloadData.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Variables
source "./variables.sh"

#url="https://haveibeenpwned.com/PwnedWebsites"
#location="../files"

#Constants
source "./constants.sh"


#Test for Valid URL.
wget -q --spider "$url"

#Valid URL/File Location
if [ "$?" -eq 0 ]
then
     
    wget -qP "$location" "$url"     			        #Gets File and Copies to the Above Location.

    doc=$(echo -e "$url" | awk -F"/" '{print $NF}')     #Get Document name from URL.
    
    #Display Output of Downloaded Content.
    echo -e "\nFile Downloaded Successfully ..." && ls -al "$location"/"$doc" --color=auto && echo -e "\n"
    sleep 2

    $(./cleanseData.sh > ../)

else
    echo -e "\n${RED}Invalid URL ...${NORMAL}\n"
    sleep 2
fi