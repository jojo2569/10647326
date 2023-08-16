#!/bin/bash

# Purpose      : Common Functions.
# Filename     : functions.sh
# Date Created : 15-Aug-2023
# Date Modified: 15-Aug-2023
# Author       : Joe Velardi


#Prompt: Enter or Quit.
promptEnterQuit() {

    read -rp "Press Enter to Continue, or Type 'exit' to Quit: " $1

    isExit=$(echo "$option" | tr '[:upper:]' '[:lower:]')

    if [ "$isExit" == "exit" ]; then clear; exit 1; fi
}