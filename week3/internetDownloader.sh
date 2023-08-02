#!/bin/bash

# Purpose      : Download a File from a Website.
# Filename     : internetDownloader.sh
# Date Created : 24-Jul-2023
# Date Modified: 25-Jul-2023
# Author       : Joe Velardi


#Constants
RED="\033[0;31m"
NORMAL="\033[0m"

while true
do

    clear

    # Read URL or exit.
    read -rp "Please Type the URL of a File to Download, or Type 'exit' to quit: " url

    isExit=$(echo "$url" | tr '[:upper:]' '[:lower:]')

    if [ "$isExit" != "exit" ]
    then

        #Test for Valid URL.
        wget -q --spider "$url"

        #Valid URL/File Location
        if [ "$?" -eq 0 ]
        then

            #Read Location to Store File.
            read -rp "Type the Location of Where You Would Like to Download the File to: " location

            mkdir -p "$location"                                #Creates Folder; Prevents Error on Existing Folder.        
            wget -qP "$location" "$url"     			        #Gets File and Copies to the Above Location.

            doc=$(echo -e "$url" | awk -F"/" '{print $NF}')     #Get Document name from URL.
            
            #Display Output of Downloaded Content.
            echo -e "\nFile Location" && ls -al "$location"/"$doc" --color=auto && echo -e "\n"
            
            read -rp "Press Any Key to Continue"

        else
            echo -e "\n${RED}Invalid URL. Try again ...${NORMAL}\n"
            sleep 2
        fi

    else

        echo -e "\nThank You, Exiting ...\n"
        break

    fi

done

exit 0
