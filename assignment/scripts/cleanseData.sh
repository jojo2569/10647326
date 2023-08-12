#!/bin/bash

# Purpose      : Cleanse Downloaded Data.
# Filename     : cleanseData.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi

dataSource="../files/PwnedWebsites"
dataTarget="../files/cleansedData.txt"

#1. Top and Tail data with grep to get required content.
#    - top after <h3> tag
#    - tail before <div class="row breachListLegend"> tag
#2. Remove tages with sed and redirect to cleansed file.


#sed -e 's/<[^>]*>//g' < $dataSource

#Start at <h3> tag
#grep -Pzo '.*<h3>(.*\n)*' $dataSource 


#grep -B 9999999 '<div class="row breachListLegend">' $dataSource 

#sed -n 's/<h3>/,$p' < $dataSource

#sed -n '/row breachListLegend/,$d' < $dataSource

#sed '/<div class="row breachListLegend">/,$d' < $dataSource #| 


#sed [1] Remove All Content Priot to <h3> tag
#sed [2] Remove All Content After <div class="row breachListLegend"> tag.
#sed [3] Strip All <tags>
#sed [4] Remove 'Permalink' instances.
#sed [5] Remove Repeating Line Breaks.
sed -n '/<h3>/,$p' < $dataSource | sed '/<div class="row breachListLegend">/,$d' | sed -e 's/<[^>]*>//g' | sed '/Permalink/d' | sed -z 's/\n\n\n\n\n\n\n\n\n/ /g'

