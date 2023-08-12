#!/bin/bash

# Purpose      : Cleanse Downloaded Data.
# Filename     : cleanseData.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Variables
tempData="../files/tempData.txt"
dataSource="../files/PwnedWebsites"
dataTarget="../files/cleansedData.txt"
increment=1

#House Cleaning.
#Remove if exists Downleaded File, and Cleansed Data.

#Data Cleansing.
sed -n -e '/<h3>/,$p' < $dataSource |                       #sed [1] Remove All Content Priot to <h3> tag
sed '/<div class="row breachListLegend">/,$d' |             #sed [2] Remove All Content After <div class="row breachListLegend"> tag.
sed -e 's/<[^>]*>//g' |                                     #sed [3] Strip All <tags>
sed '/Permalink/d' |                                        #sed [4] Remove 'Permalink' instances.
sed '/Date added to HIBP/d' |                               #sed [5] Remove 'Date added to HIBP' instances.
sed '/^[[:space:]]*$/d' > $tempData                         #sed [6] Remove Blank Lines & Redirect to $tempContent.

i=1
while read -r line; do

    if [ $((i%5)) != 0 ]
    then
        echo -e -n "$line|" >> $dataTarget
    else 
        echo -e "$line" >> $dataTarget

    fi
    ((i++))


done < $tempData




