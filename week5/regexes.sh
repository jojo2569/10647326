#!/bin/bash

# Purpose      : Smorgaboard or regex Examples.
# Filename     : regexes.sh
# Date Created : 31-Jul-2023
# Date Modified: 01-Aug-2023
# Author       : Joe Velardi


#Constants
RED="\033[0;31m"
GREEN="\033[0;32m"
BROWN="\033[0;33m"
GREY="\033[0;37m"
NORMAL="\033[0m"
WORDS='you and the date'

while true
do 

    clear

    #Menu
    echo -e  "${GREEN}Enter an Option to Display grep Output.${GREY}"
    echo     "  1. All \`sed\` Statements"
    echo     "  2. All Lines Starting with the Letter \`m\`"
    echo     "  3. All Lines Containing 3-digit Numbers Only"
    echo     "  4. All \`echo\` Statements with at least 3 Words"
    echo     "  5. All Lines that would Make a Good Password"
    echo -e  "  6. Exit${NORMAL}"

    read -rp "Option [1-6]: " selection

	clear

	case $selection in
		[1]* )
			#All `sed` Statements.
			echo -e "All \`sed\` Statements.\n"
            echo -e "${BROWN}grep --color -r 'sed -.' ../week*${NORMAL}\n"
			grep -r --color 'sed -.' ../week* ;;

		[2]* )
			#All Lines Starting with the Letter `m`
			echo -e "All Lines Starting with the Letter \`m\`.\n"
			echo -e "${BROWN}grep -r --color '^m' ../week*${NORMAL}\n"
			grep -r --color '^m' ../week* ;;

		[3]* )
			#All Lines Containing 3-digit Numbers Only
			echo -e "All Lines Containing 3-digit Numbers Only.\n"
			echo -e "${BROWN}grep -r -P --color '(?<!\d)\d{3}(?!\d)' ../week*${NORMAL}\n"
			grep -r -P --color '(?<!\d)\d{3}(?!\d)' ../week* ;;

		[4]* )
			#All `echo` Statements with at least 3 Words
			echo -e "All \`echo\` Statements with at least 3 Words.\n"
			echo -e "${BROWN}grep -r -P --color 'echo.*\"([a-zA-Z]+\s){3}' ../week*${NORMAL}\n"
            grep -r -P --color 'echo.*"([a-zA-Z]+\s){3}' ../week* ;;

		[5]* )
			#All Lines that would Make a Good Password
			echo -e "All Lines that would Make a Good Password.\n"
			echo -e "${BROWN}grep -r -P --color '(?=^.{12,}$)(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])(?=.*[^\$WORDS[@]])(?=.*[^\s])' ../week* | more${NORMAL}\n" 
            grep -r -P --color '(?=^.{12,}$)(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])(?=.*[^${WORDS}[@]])(?=.*[^\s])' ../week* ;;

		[6]* )
			#Exit.
			exit 0 ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}Invalid Entry. Try Again ...${NORMAL}"

	esac

    echo -e "\n"
    read -p "Press Enter to Continue ..."

done