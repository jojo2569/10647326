#!/bin/bash

# Purpose      : Sample awk Output of IP Addresses.
# Filename     : awkFormat.sh
# Date Created : 01-Aug-2023
# Date Modified: 01-Aug-2023
# Author       : Joe Velardi


echo "Google Server IPs:"

awk 'BEGIN {
    FS=":";

    print "________________________________";
    print "| \033[34mServer Type\033[0m | \033[34mIP Address\033[0m     |";

}

{
    printf("| \033[33m%-11s\033[0m | \033[35m%-14s\033[0m |\n", $1, $2);
}

END {
    print("________________________________");
}' input.txt