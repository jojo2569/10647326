#!/bin/bash

# Purpose      : Download Web Data.
# Filename     : downloadData.sh
# Date Created : 12-Aug-2023
# Date Modified: 13-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"
source "../core/functions.sh"


#House Cleaning.
rm -f $dataSource


#Test for Valid URL.
wget -q --spider "$url"


#Valid URL/File Location
if [ "$?" -eq 0 ]
then

    displayBanner 
     
    #Gets File and Makes a Local Copy.
    echo -e "\n${GREEN}  Downloading Data. One Moment ...${NORMAL}"
    wget -qP "$dataLocation" "$url"

    #Displays Content Being Processes.
    results=$(ls -al "$dataSource")
    echo -e "\n  File Downloaded Successfully ...\n  $results"

    #Run Data Cleansing.
    echo -e "\n${GREEN}  Cleansing Data. Almost There ...${NORMAL}"
    $(./cleanseData.sh)
    
    entries=$(wc -l $dataCleansed | grep -o "^\w*\b")
    results=$(ls -al "$dataCleansed")
    echo -e "\n  Data Cleansing Completed ($entries Entries) ...\n  $results"

    entries=$(wc -l $dataCategory | grep -o "^\w*\b")
    results=$(ls -al "$dataCategory")
    echo -e "\n  Data Category Completed ($entries Entries) ...\n  $results\n"

    promptPressEnter

else
    echo -e "\n${RED}  Invalid URL ...${NORMAL}\n"
    sleep 2
fi