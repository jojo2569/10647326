#!/bin/bash

# Purpose      : Cleanse Downloaded Data.
# Filename     : cleanseData.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"


#House Cleaning.
rm -f $dataCleansed
rm -f $dataCategory


#Data Cleansing.
sed -n -e '/<h3>/,$p' < $dataSource |                                   #sed [1] Remove All Content Priot to <h3> tag.
sed '/<div class="row breachListLegend">/,$d' |                         #sed [2] Remove All Content After <div class="row breachListLegend"> tag.
sed -e 's/<[^>]*>//g' |                                                 #sed [3] Strip All <tags>.
sed '/Permalink/d' |                                                    #sed [4] Remove 'Permalink' instances.
sed '/Date added to HIBP/d' |                                           #sed [5] Remove 'Date added to HIBP' instances.
sed 's/Breach date: //g' |                                              #sed [6] Remove 'Breach Date: ' prefix.
sed 's/Compromised accounts: //g' |                                     #sed [7] Remove 'Compromised accounts: ' prefix.
sed 's/Compromised data: //g' |                                         #sed [8] Remove 'Compromised data: ' prefix.
sed '/^[[:space:]]*$/d' |                                               #sed [9] Remove Blank Lines & Redirect to $dataScratch.
sed 's/\&amp;/\&/g; s/&quot/"/g; s/&#39;/'"'"'/g; s/&#228;/a/g' |       #sed [10] Cleanse HTML Escape Characters.
sed 's/&#252;/u/g; s/&mdash;/-/g; s/&#224;/a/g; s/&#201;/E/g' |
sed 's/&#233;/e/g; s/&#241;/n/g; s/";/"/g' > $dataScratch				#Pump out Reults to a Temporary File.


#Format Fields; Add Delimiters.
formatFields() {

	case $(($1 % 5)) in

		[0] )
			#Last Field. No Delimieter Required.
			echo -e "$2" >> $dataCleansed 

			#Loop Through Category Field and Separate.
			IFS=',' read -ra categoryArray <<< "$2"
			for i in "${categoryArray[@]}"; do
    			echo -e $i >> $dataCategory
			done ;;

		[3] )
			#Format Date Field.
			echo -n $(echo -n $(date -d "$2" +'%F') && echo "$DELIM") >> $dataCleansed ;;

		[4] )
			#Format Number Field.
			echo -n $(echo -n $2 | sed 's/,//g' && echo -n "$DELIM") >> $dataCleansed ;;

		* )
			echo -e -n "$2$DELIM" >> $dataCleansed

	esac

}


#Loop Through $dataScratch, formatFields.
intCounter=1

while read -r line; do

    formatFields $intCounter "${line[@]}" 
    ((intCounter++))

done < $dataScratch


#A More Graceful Way Needed to Exclude Funky Character Sets.
cat $dataCleansed | grep  '^[A-Za-z0-9]' > $dataScratch
cat $dataScratch > $dataCleansed


#Creating Category Data With Counts.
grep . $dataCategory | sort | uniq -c | 						#Find Unique Instances and -c Get Counts.
sed -e 's/^[ \t]*//' | 											#Remove Leading White Spaces.
sed -r 's/\s+/|/' > $dataScratch								#Replace First Space with a Pipe (|).
grep . $dataScratch > $dataCategory								#Dump Data into Final Destination.


#House Cleaning.
rm -f $dataScratch
