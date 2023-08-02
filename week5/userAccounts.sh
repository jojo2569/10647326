#!/bin/bash

# Purpose      : Format User Accounts using AWK
# Filename     : userAccounts.sh
# Date Created : 02-Aug-2023
# Date Modified: 02-Aug-2023
# Author       : Joe Velardi


#Constants
BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
BROWN="\033[033m"
BLUE="\033[34m"
PURPLE="\033[35m"
CYAN="\033[36m"
GREY="\033[37m"
NORMAL="\033[0m"
BG_RED="\033[101m"
BG_GREEN="\033[102m"
BG_WHITE="\033[107m"

#Variables
passwdList=$(cat /etc/passwd)

#echo -e $passwdList

grep '/bin/bash' /etc/passwd | awk 'BEGIN {
    FS=":";
    BLUE="\033[34m";

    print "__________________________________________________________________________________________________________";
    print "| Username             | UserID   | GroupID  | Home                           | Shell                     |";

}

{
    printf("| \033[33m%-20s\033[0m | \033[35m%-8s\033[0m | \033[35m%-8s\033[0m | \033[35m%-30s\033[0m | \033[35m%-25s\033[0m |\n", $1, $3, $4, $6, $7);
}

END {
    print "__________________________________________________________________________________________________________";
}' 