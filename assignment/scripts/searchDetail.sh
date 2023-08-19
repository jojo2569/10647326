#!/bin/bash

# Purpose      : Searches PWNED Website Data and Returns Results.
# Filename     : searchDetail.sh
# Date Created : 17-Aug-2023
# Date Modified: 17-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"

displayBanner

#Navigation. Search Detail.
echo -e  "\n${GREEN}  View PWNED Data. Enter earch Criteria.${BLUE}\n"
echo     "  -----------------------------------------"


read -rp "  Enter  PWNED Website name: " option