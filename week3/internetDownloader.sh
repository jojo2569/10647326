#!/bin/bash

# Purpose      : Download a File from a Website.
# Filename     : internetDownloader.sh
# Date Created : 24-Jul-2023
# Date Modified: 24-Jul-2023
# Author       : Joe Velardi


clear

while [ $? -eq 0 ]
do
    # Read URL or exit.
    read -rp "Please Type the URL of a File to Download, or Type 'exit' to quit: " url

    if [ "$url" != "exit" ]
    then

        #Read Location to Store File.
        read -rp "Type the Location of Where You Would Like to Download the File to: " location
        
        mkdir -p "$location"                            #Creates Folder; Prevents Error on Existing Folder.        
        wget -qP "$location" "$url"                     #Gets File and Copies to the Above Location.
        doc=$(echo -e "$url" | awk -F"/" '{print $NF}') #Get Document name from URL.
        
        #Display Output of Downloaded Content.
        echo -e "\nFile Copied" && ls -al "$location"/"$doc" --color=auto && echo -e "\n"
        sleep 1

    else

        echo -e "\nThank You, Exiting ...\n"
        exit 1

    fi

done

exit 0