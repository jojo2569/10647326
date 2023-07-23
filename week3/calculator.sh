#!/bin/bash

# Purpose      : Simple Expression Calculator with Colors.
# Filename     : calculator.sh
# Date Created : 23-Jul-2023
# Date Modified: 23-Jul-2023
# Author       : Joe Velardi


#Variables
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
NORMAL="\033[0m"

while [ "$?" -eq 0 ] ; do

    clear

    echo -e  "\nCalculator. Enter a Menu Option."
    echo -e  "  1. Addition"
    echo -e  "  2. Subtraction"
    echo -e  "  3. Multiplication"
    echo -e  "  4. Division"
    echo -e  "  5. Exit"

    read -rp "Option [1-5]: " option

    # Read Inputs if Menu  Options [1-4]
    if [[ "$option" -ge 1 && "$option" -le 4 ]] ; then

        echo -e "\n"
        read -rp "Enter First Value : " val1
        read -rp "Enter Second Value: " val2  

    fi

    #Perform Calculation
	case $option in
		[1]* )
            sum=$(echo "$val1 + $val2" | bc)
			echo -e "\n${BLUE}Answer: $val1 + $val2 = $sum\n" 
			;;
        [2]* )
            sum=$(echo "$val1 - $val2" | bc)
			echo -e "\n${GREEN}Answer: $val1 - $val2 = $sum\n" 
			;;
        [3]* )
            sum=$(echo "$val1 * $val2" | bc)
			echo -e "\n${RED}Answer: $val1 x $val2 = $sum\n" 
			;;
    	[4]* ) 
            sum=$(echo "$val1 / $val2" | bc)
			echo -e "\n${PURPLE}Answer: $val1 / $val2 = $sum\n" 
			;;
        [5]* )
            echo -e "\nExiting ...\n"
            exit 1
            ;;
		* )
			echo -e "\nIncorrect Value. Exiting.\n"
            exit 1
			;;
	esac    

    echo -e "$NORMAL"
    read -rp "Perform Another Calculation? [yn] " yn

    case $yn in
		[Yy]* )
			;;
		* )
            echo -e "\nExiting ...\n"
			exit 1
			;;
    esac

done

exit 0