#!/bin/bash

# Purpose      : Download Web Data.
# Filename     : downloadData.sh
# Date Created : 12-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"
source "../core/functions.sh"


downloadData() {

    #House Cleaning.
    rm -f $dataSource


    #Test for Valid URL.
    wget -q --spider "$url"


    #Valid URL/File Location
    if [ "$?" -eq 0 ]
    then

        displayBanner 
        
        #Gets File and Makes a Local Copy.
        echo -e "\n${BGREEN}  Downloading Data. One Moment ...${NORMAL}"
        wget -qP "$dataLocation" "$url"

        #Displays Content Being Processes.
        results=$(ls -al "$dataSource")
        echo -e "\n${GREEN}  File Downloaded Successfully ...${NORMAL}\n  $results"

        #Run Data Cleansing.
        echo -e "\n${BGREEN}  Cleansing Data. Almost There ...${NORMAL}"
        $(./cleanseData.sh)
        
        entries=$(wc -l $dataCleansed | grep -o "^\w*\b")
        results=$(ls -al "$dataCleansed")
        echo -e "\n${GREEN}  Data Cleansing Completed ($entries Entries) ...${NORMAL}\n  $results"

        entries=$(wc -l $dataCategory | grep -o "^\w*\b")
        results=$(ls -al "$dataCategory")
        echo -e "\n${GREEN}  Data Category Completed ($entries Entries) ...${NORMAL}\n  $results\n"

        promptPressEnter

    else
        echo -e "\n${RED}  Invalid URL ...${NORMAL}\n" && sleep 2
    fi

}