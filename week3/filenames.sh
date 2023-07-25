#!/bin/bash

# Purpose      : Reads Content From a File. 
# Filename     : filenames.sh
# Date Created : 23-Jul-2023
# Date Modified: 25-Jul-2023
# Author       : Joe Velardi

clear

#Read Contents of filenames.txt
while read -r line

do

    #Folder Check.,
    if [ -f "$line" ] 
    then
        echo -e "'$line' is a file that exists!"

    #Directory Check
    elif [ -d "$line" ]
    then
        echo -e "'$line' is a directory." 
    else
        echo -e "I don't know what '$line' is!"
    fi

done < filenames.txt

sleep 2

exit 0