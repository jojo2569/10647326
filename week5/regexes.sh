#!/bin/bash

# Purpose      : Smorgaboard or regex Examples.
# Filename     : regexes.sh
# Date Created : 31-Jul-2023
# Date Modified: 31-Jul-2023
# Author       : Joe Velardi


#Constants
RED="\033[0;31m"
GREEN="\033[0;32m"
BROWN="\033[0;33m"
GREY="\033[0;37m"
NORMAL="\033[0m"

while true
do 

    clear

    #Menu
    echo -e  "${GREEN}Enter an Option to Display grep Output.${GREY}"
    echo     "  1. All sed Statements"
    echo     "  2. All Lines Starting with the Letter \`m\`"
    echo     "  3. All Lines Containing 3-digit Numbers"
    echo     "  4. All echo Statements with at least 3 Words"
    echo     "  5. All Lines that would Make a Good Password"
    echo -e  "  6. Exit${NORMAL}"

    read -rp "Option [1-6]: " selection

	clear

	case $selection in
		[1]* )
            echo -e "${BROWN}grep --color -r 'sed -.' ~/scripts/portfolio/w*${NORMAL}\n"
			grep --color -r 'sed -.' ~/scripts/portfolio/w* ;;

		[2]* )
			echo -e "${BROWN}grep --color -r '^m' ~/scripts/portfolio/w*${NORMAL}\n"
			grep --color -r '^m' ~/scripts/portfolio/w* ;;

		[3]* )
			echo -e "${BROWN}grep --color -r -E '[0-9]{3,3}' ~/scripts/portfolio/w*${NORMAL}\n"
			grep --color -r  '[0-9]{3,3}' ~/scripts/portfolio/w* ;;

		[4]* )
			#todo 
            ;;

		[5]* )
			echo -e "${BROWN}grep -r '(?=^.{8,}$)(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])' ~/scripts/portfolio/w*${NORMAL}\n" 
            grep -r '[(?=^.{8,}$)(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])]' ~/scripts/portfolio/w* ;;

		[6]* )
			#Exit.
			exit 0 ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}Invalid Enty. Exiting ...${NORMAL}"
			sleep 1

	esac

    echo -e "\n"
    read -p "Press Any Key to Continue ..."

done