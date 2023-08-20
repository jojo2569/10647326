#!/bin/bash

# Purpose      : Password Validation Routines.
# Filename     : passwordChecker.sh
# Date Created : 13-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"
source "../core/functions.sh"
source "./passwordComplexity.sh"


validatePassword() {

    #Loop Until Correct password or Exit
    while true
    do

        displayBanner

        # Get Password (Secretly).
        read -rsp "  PWNED Breached WebSite Analysis. Please Enter Your Password: " password

        # Check Hashed Password from File (Absolute Path).
        echo -n "$password" | sha256sum --check --status $secretPassword

        #Validate if Password is Correct, or Not.
        if  [ $? -eq 0 ]; then

            # Password Matches.
            echo -e "\n\n${GREEN}  Access Granted. One Moment ...${NORMAL}"
            sleep 1; clear; break 1

        else

            #Password Does Not Match. Try Again or Exit.
            echo -e  "\n\n${RED}  Access Denied. ${NORMAL}\n"
            read -rp "  Press Enter to Continue, or Type 'exit' to Quit: " option

            isExit=$(echo "$option" | tr '[:upper:]' '[:lower:]')
            if [ "$isExit" == "exit" ]; then             
            clear; exit 1; fi

        fi

    done

}


