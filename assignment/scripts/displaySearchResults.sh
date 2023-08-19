#!/bin/bash

# Purpose      : Display Data in a List Format.
# Filename     : displayDataList.sh
# Date Created : 19-Aug-2023
# Date Modified: 19-Aug-2023
# Author       : Joe Velardi


displaySearchResults() {

	while true
	do

		displayBanner

		#Navigation. Search Detail.
		echo -e  "\n${GREEN}  View PWNED Website Data. Enter Search Criteria.${NORMAL}"
		echo     "  -------------------------------------------------"

		read -rp "  Search for Breached Website Content (min. 3 Chars): " searchCriteria

		if [ ${#searchCriteria} -lt 3 ] 
		then

			#Does Not Meet Minimum Search Criteria.
			echo -e "\n\n${RED}  Please Enter 3 or More Characters in the Search Field.${NORMAL}\n"
			promptPressEnter

		else

			# Search For Results.
			searchResult=$(grep $searchCriteria $dataCleansed)

			if [ "$searchResult" = "" ]; then
				#No Results Found.
				echo -e "\n${RED}  No Results Were Found.${NORMAL}\n"

				read -rp "  Press Enter to Continue, or Type 'exit' to Quit: " option

				isExit=$(echo "$option" | tr '[:upper:]' '[:lower:]')
				if [ "$isExit" == "exit" ]; then break; fi

			else
				#Display Results.
				echo -e "$searchResult" | LC_ALL=en_US.UTF-8 gawk -f "displaySearchResults.awk" | more
				promptPressEnter
				break
			fi
		fi

	done

}