#!/bin/bash

# Purpose      : Download Web Data.
# Filename     : downloadData.sh
# Date Created : 12-Aug-2023
# Date Modified: 13-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"


#House Cleaning.
rm -f $dataSource


#Test for Valid URL.
wget -q --spider "$url"


#Valid URL/File Location
if [ "$?" -eq 0 ]
then

    clear
     
    #Gets File and Copies to the Above Location.
    wget -qP "$dataLocation" "$url"

    #Get Filename from URL
    doc=$(echo -e "$url" | awk -F"/" '{print $NF}')
    
    #Display Output of Downloaded Content.
    echo -e "\n${GREEN}Downloading Data. One Moment ...${NORMAL}"
    echo -e "\nFile Downloaded Successfully ..." && ls -al "$dataSource" --color=auto

    #Run Data Cleansing.
    echo -e "\n${GREEN}Cleansing Data. One Moment ...${NORMAL}"
    $(./cleanseData.sh)
    entries=$(wc -l $dataCleansed | grep -o "^\w*\b")
    echo -e "\nData Cleansing Completed ($entries Entries) ..." && ls -al "$dataCleansed" --color=auto && echo -e "\n"

else
    echo -e "\n${RED}Invalid URL ...${NORMAL}\n"
    sleep 2
fi