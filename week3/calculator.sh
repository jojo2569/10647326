#!/bin/bash

# Purpose      : Simple Expression Calculator with Colors.
# Filename     : calculator.sh
# Date Created : 23-Jul-2023
# Date Modified: 25-Jul-2023
# Author       : Joe Velardi


#Constants
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
MAGENTA="\033[35m"
NORMAL="\033[0m"

while [ "$?" -eq 0 ] ; do

	echo -e  "\nCalculator. Enter a Menu Option."
	echo     "  1. Addition"
	echo     "  2. Subtraction"
	echo     "  3. Multiplication"
	echo     "  4. Division"
	echo     "  5. Exit"

	read -rp "Option [1-5]: " option

	#Read inputs of menu options
	if [[ "$option" -ge 1 && "$option" -le 4 ]] ; then

		echo -e "\n"
		read -rp "Enter First Value : " val1
		read -rp "Enter Second Value: " val2  

	fi

	#Perform Calculation
	case $option in
		[1] )
			sum=$(echo "$val1 + $val2" | bc)
			echo -e "\n${BLUE}Answer: $val1 + $val2 = $sum\n" ;;

		[2] )
			sum=$(echo "$val1 - $val2" | bc)
			echo -e "\n${GREEN}Answer: $val1 - $val2 = $sum\n" ;;

		[3] )
			sum=$(echo "$val1 * $val2" | bc)
			echo -e "\n${RED}Answer: $val1 x $val2 = $sum\n" ;;

		[4] ) 
			sum=$(echo "$val1 / $val2" | bc)
			echo -e "\n${MAGENTA}Answer: $val1 / $val2 = $sum\n" ;;

		[5] )
			echo -e "\nExiting ...\n"
			sleep 1
			break ;;
			
		* )
			echo -e "\nIncorrect Value. Exiting.\n"
			sleep 1
			break ;;
	esac    

	echo -e "$NORMAL"
	read -rp "Perform Another Calculation? [yn] " yn

	case $yn in
		[Yy] )
			clear ;;
		* )
			echo -e "\nExiting ...\n"
			break ;;
	esac

done
