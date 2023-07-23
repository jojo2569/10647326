#!/bin/bash

# Purpose      : {purpose}
# Filename     : test.sh
# Date Created : 23-Jul-2023
# Date Modified: 23-Jul-2023
# Author       : Joe Velardi


BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
BROWN="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
GREY="\033[0;37m"
BG_RED="\033[0;101m"
BG_GREEN="\033[0;102m"
BG_WHITE="\033[0;107m"
NORMAL="\033[0m"

echo -e "plain $BLACK BLK MESSAGE $NORMAL reset"
echo -e "plain $BG_GREEN GRN MESSAGE $NORMAL reset"
echo -e "plain $BG_RED RED MESSAGE $NORMAL reset"
echo -e "plain $BROWN BRN MESSAGE $NORMAL reset"
echo -e "plain $BLUE BLU MESSAGE $NORMAL reset"
echo -e "plain $PURPLE PRP MESSAGE $NORMAL reset"
echo -e "plain $CYAN CYN MESSAGE $NORMAL reset"
echo -e "plain $BG_WHITE GRY MESSAGE $NORMAL reset"

