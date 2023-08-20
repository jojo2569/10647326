#!/bin/bash

# Purpose      : Assessment #4. Main Entry.
# Filename     : main.sh
# Date Created : 12-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"
source "../core/functions.sh"


#Specialised Functions.
source "./passwordChecker.sh"
source "./downloadData.sh"
source "./displayDataTabular.sh"
source "./displaySearchResults.sh"


#Local Variables.
menuItem1="Full List: Breached Website Data"
menuItem2="Top 20: Most Recent Breached Websites"
menuItem3="Top 20: Most Compromised Breaches"
menuItem4="Top 20: Least Compromised Breaches"
menuItem5="Full List: Breaches by Category"
menuItem6="Top 20: Most Compromised Categories"
menuItem7="Search Breached Website Detail"
menuItem8="Administrative Tasks"


#Password Protected.
validatePassword


#Check Data Exits.
if [ ! -f $dataSource ]; then

	displayBanner

	echo -e "${GREEN}  You're New Here. Preparing to Download Your Data ...${NORMAL}" && sleep 2
	
	downloadData

fi


#Loop Through Menu.
while [ $? -eq 0 ]
do

	displayBanner

	#Navigation. Enter Menu Option.
	echo -e  "\n${GREEN}  View Breached Website Data. Enter an Option.${BLUE}"
	echo     "  -------------------------------------------------"
	echo     "  1. $menuItem1"
	echo     "  2. $menuItem2"
	echo     "  3. $menuItem3"
	echo     "  4. $menuItem4"
	echo     "  5. $menuItem5"
	echo     "  6. $menuItem6"
	echo     "  7. $menuItem7"
	echo     "  -------------------------------------------------"
	echo     "  8. $menuItem8"
	echo     "  -------------------------------------------------"
	echo -e  "  9. Exit${NORMAL}\n"

	read -rp "  Option [1-9]: " option

	case $option in
		[1] )
			displayDataTabular 1 "$dataCleansed" "$menuItem1" "displayDataByBreaches.awk" ;;

		[2] )
			displayDataTabular 2 "$dataCleansed" "$menuItem2" "displayDataByBreaches.awk" "-k3" "-r" ;;

		[3] )
			displayDataTabular 2 "$dataCleansed" "$menuItem3" "displayDataByBreaches.awk" "-nk4" "-r" ;;

		[4] )
			displayDataTabular 2 "$dataCleansed" "$menuItem4" "displayDataByBreaches.awk" "-nk4" ;;

		[5] )
			displayDataTabular 1 "$dataCategory" "$menuItem5" "displayDataByCategory.awk" ;;

		[6] )
			displayDataTabular 2 "$dataCategory" "$menuItem6" "displayDataByCategory.awk" "-nk1" "-r" ;;

		[7] )
			displaySearchResults ;;

		[8] )
			./menuAdmin.sh ;;

		[9] )
			clear
			exit 1 ;;

		* )
			promptInvalidEntry

	esac


done

