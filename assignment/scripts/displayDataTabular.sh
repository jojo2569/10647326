#!/bin/bash

# Purpose      : Display Data in Table Format.
# Filename     : displayDetail.sh
# Date Created : 19-Aug-2023
# Author       : Joe Velardi


#Display List in Tabular Format.
displayDataTabular() {

	displayBanner

	case $1 in
		[1] )
			#Display Full Lists.
			cat $2 | awk -v header="$3" -f $4 | more  ;;

		[2] )
			#Display Top Lists.
			cat $2 | sort  --field-separator="$DELIM" $5 $6 > $dataScratch
			head -20 $dataScratch | LC_ALL=en_US.UTF-8 gawk -v header="$3" -f $4 ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}  An ERROR Has Occurred. Try Again ...${NORMAL}\n"

	esac

	promptPressEnter

}
