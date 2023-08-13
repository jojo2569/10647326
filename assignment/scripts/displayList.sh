#!/bin/bash

# Purpose      : Display List in Formatted Table.
# Filename     : displayList.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"






#grep . ../files/cleansedData.txt | awk -f displayList.awk

#sort by date desc
#cat ../files/cleansedData.txt | sort  --field-separator="|" -k3 -r > ../files/test.txt
#grep . ../files/test.txt | awk -f  displayList.awk

#sort by date desc
cat $dataCleansed | sort  --field-separator="$DELIM" -nk4 -r > $dataScratch
head -10 $dataScratch | awk -f displayList.awk