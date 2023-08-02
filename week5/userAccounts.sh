#!/bin/bash

# Purpose      : Format User Accounts using AWK
# Filename     : userAccounts.sh
# Date Created : 02-Aug-2023
# Date Modified: 02-Aug-2023
# Author       : Joe Velardi


clear

grep '/bin/bash' /etc/passwd | awk '

BEGIN {
    FS=":";
    BLUE="\033[34m";
    BROWN="\033[033m";
    PURPLE="\033[35m";
    NORMAL="\033[0m";

    print "________________________________________________________________________________________________";
    printf("| %sUsername%s   | %sUserID%s     | %sGroupID%s    | %sHome%s                           | %sShell%s                |\n", BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL);
    print "________________________________________________________________________________________________";
}

{
    printf("| %s%-10s%s | %s%-10s%s | %s%-10s%s | %s%-30s%s | %s%-20s%s |\n", BROWN, $1, NORMAL, PURPLE, $3, NORMAL, PURPLE, $4, NORMAL, PURPLE, $6, NORMAL, PURPLE, $7, NORMAL);
}

END {
    printf ("________________________________________________________________________________________________\n\n");
}' 