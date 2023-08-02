#!/bin/bash

#Prints User Account Information from /etc/passwd
function printUserAccounts() {
}
BEGIN {
    FS=":";
    BLUE="\033[34m";
    BROWN="\033[033m";
    PURPLE="\033[35m";
    NORMAL="\033[0m";

    print "_______________________________________________________________________________________________________________";
    printf("| %sUsername%s                  | %sUserID%s     | %sGroupID%s    | %sHome%s                           | %sShell%s                |\n", BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL);
    print "_______________________________________________________________________________________________________________";
}

{
    printf("| %s%-25s%s | %s%-10s%s | %s%-10s%s | %s%-30s%s | %s%-20s%s |\n", BROWN, $1, NORMAL, PURPLE, $3, NORMAL, PURPLE, $4, NORMAL, PURPLE, $6, NORMAL, PURPLE, $7, NORMAL);
}

END {
    printf ("_______________________________________________________________________________________________________________\n\n");
}