#!/bin/bash

# Purpose      : {purpose}
# Filename     : test.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi

file="../files/cleansedData.txt"

i=1
while read -r line; do

    if [ $((i%5)) != 0 ]
    then
        echo -e -n "$line|" >> cleansed2.txt
    else 
        echo -e "$line" >> cleansed2.txt

    fi
    ((i++))


done < $file 