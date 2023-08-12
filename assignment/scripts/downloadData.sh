#!/bin/bash

# Purpose      : Download Web Data.
# Filename     : downloadData.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Variables
source variables.sh


#Constants
source constants.sh


#House Cleaning
rm -f PwnedWebsites

#Test for Valid URL.
wget -q --spider "$url"


#Valid URL/File Location
if [ "$?" -eq 0 ]
then
     
    #Gets File and Copies to the Above Location.
    wget -qP "$location" "$url"

    #Get Filename from URL
    doc=$(echo -e "$url" | awk -F"/" '{print $NF}')
    
    #Display Output of Downloaded Content.
    echo -e "\nFile Downloaded Successfully ..." && ls -al "$location"/"$doc" --color=auto && echo -e "\n"
    sleep 2

    #Run Data Cleaning
    $(./cleanseData.sh)
    echo -e "\nFData Cleansing Completed ...\n"

else
    echo -e "\n${RED}Invalid URL ...${NORMAL}\n"
    sleep 2
fi