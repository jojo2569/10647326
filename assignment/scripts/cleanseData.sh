#!/bin/bash

# Purpose      : Cleanse Downloaded Data.
# Filename     : cleanseData.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Variables
source variables.sh
intCounter=1


#House Cleaning.
rm -f $dataTarget


#Data Cleansing.
sed -n -e '/<h3>/,$p' < $dataSource |                       #sed [1] Remove All Content Priot to <h3> tag
sed '/<div class="row breachListLegend">/,$d' |             #sed [2] Remove All Content After <div class="row breachListLegend"> tag.
sed -e 's/<[^>]*>//g' |                                     #sed [3] Strip All <tags>
sed '/Permalink/d' |                                        #sed [4] Remove 'Permalink' instances.
sed '/Date added to HIBP/d' |                               #sed [5] Remove 'Date added to HIBP' instances.
sed 's/Breach date: //g' |                                  #sed [6] Remove 'Breach Date: ' prefix.
sed 's/Compromised accounts: //g' |                         #sed [7] Remove 'Compromised accounts: ' prefix.
sed 's/Compromised data: //g' |                             #sed [8] Remove 'Compromised data: ' prefix.
sed 's/&#39;/`/g' |
sed 's/&quot;/"/g' |
sed 's/&amp;/\&/g' |
sed 's/&#228;/a/g' |
sed 's/&#252;/u/g' |
sed 's/&mdash;/-/g' |
sed 's/&#224;/a/g' |
sed 's/&#201;/E/g' |
sed 's/&#233;/e/g' |
sed 's/&#241;/n/g' |

sed '/^[[:space:]]*$/d' > $dataScratch                      #sed [6] Remove Blank Lines & Redirect to $dataScratch.


#Loop Through $dataScratch, Add Delimiter `||`, Group Content into a Single Line.
while read -r line; do

    if [ $((intCounter % 5)) != 0 ]
    then
        echo -e -n "$line~" >> $dataTarget
    else 
        echo -e "$line" >> $dataTarget

    fi
    ((intCounter++))

done < $dataScratch


#HouseCleaning
rm -f $dataScratch
