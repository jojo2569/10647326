#!/bin/bash

# Purpose      : View Detailed Search Results.
# Filename     : searchRessults.sh
# Date Created : 17-Aug-2023
# Date Modified: 17-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"

viewSearchResults() {

    echo -e "PWNED Wesite Information.\n"
    echo -e "${BOLD}$1"
    echo -e "$2" | fold -w72 -s
    echo -e "Breach Date         : $3"
    echo -e "Compromised Accounts: $4"
    echo -e "Compromised Data    " $5\n"

}