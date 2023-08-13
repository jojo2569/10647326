#!/bin/bash

# Purpose      : Cleanse Downloaded Data.
# Filename     : cleanseData.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Variables
source variables.sh
intCounter=1


#Constants
source constants.sh


#House Cleaning.
rm -f $dataTarget


#Data Cleansing.
sed -n -e '/<h3>/,$p' < $dataSource |                                   #sed [1] Remove All Content Priot to <h3> tag
sed '/<div class="row breachListLegend">/,$d' |                         #sed [2] Remove All Content After <div class="row breachListLegend"> tag.
sed -e 's/<[^>]*>//g' |                                                 #sed [3] Strip All <tags>
sed '/Permalink/d' |                                                    #sed [4] Remove 'Permalink' instances.
sed '/Date added to HIBP/d' |                                           #sed [5] Remove 'Date added to HIBP' instances.
sed 's/Breach date: //g' |                                              #sed [6] Remove 'Breach Date: ' prefix.
sed 's/Compromised accounts: //g' |                                     #sed [7] Remove 'Compromised accounts: ' prefix.
sed 's/Compromised data: //g' |                                         #sed [8] Remove 'Compromised data: ' prefix.
sed '/^[[:space:]]*$/d' |                                               #sed [9] Remove Blank Lines & Redirect to $dataScratch.
sed 's/\&amp/&;/g; s/\&quot/";/g; s/\&#39;/'"'"'/g; s/&#228;/a/g' |     #sed [10] HTML Escae Characters
sed 's/&#252;/u/g; s/&mdash;/-/g; s/&#224;/a/g; s/&#201;/E/g' |
sed 's/&#233;/e/g; s/&#241;/n/g' > $dataScratch   


#Function: addDelimiter
formatFields() {

	case $(($1 % 5)) in
		[0]* )
            #Last Field. No Delimieter Required.
			echo -e "$DELIM$2" >> $dataTarget ;;

		[3]* )
            #Format Date Field.
			echo -n $(echo -n $(date -d "$2" +'%F') && echo -n "$DELIM") >> $dataTarget ;;

		[4]* )
            #Format Number Field.
			echo -n $2 | sed 's/,//g' >> $dataTarget ;;

		* )
			echo -e -n "$2$DELIM" >> $dataTarget

	esac

}


#Loop Through $dataScratch, formatFields.
while read -r line; do

    formatFields $intCounter "${line[@]}" 
    ((intCounter++))

done < $dataScratch


#House Cleaning.
rm -f $dataScratch
