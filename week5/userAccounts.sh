#!/bin/bash

# Purpose      : Format User Accounts using AWK
# Filename     : userAccounts.sh
# Date Created : 02-Aug-2023
# Date Modified: 02-Aug-2023
# Author       : Joe Velardi


# Source Files
source userAccounts.awk

#Constants
RED="\033[31m"
GREEN="\033[32m"
GREY="\033[37m"
NORMAL="\033[0m"


while true
do

    clear

    #Menu
    echo -e  "${GREEN}Enter an Option to Display /etc/passwd Output.${GREY}"
    echo     "  1. Print All Accounts"
    echo     "  2. Print Accounts Using bash Shell"
    echo -e  "  3. Exit${NORMAL}"

    read -rp "Option [1-3]: " selection

	clear

	case $selection in
		[1]* )
			#All Accounts.
			grep ':' /etc/passwd | awk -f userAccounts.awk ;;

		[2]* )
			#Accounts Using bash Shell.
			grep '/bin/bash' /etc/passwd | awk -f userAccounts.awk ;;

		[3]* )
			#Exit.
			exit 0 ;;

		* )
			#Invalid Entry.
			echo -e "\n${RED}Invalid Entry. Try Again ...${NORMAL}"

	esac

	echo -e "\n"
	read -p "Press Enter to Continue ..."

done
