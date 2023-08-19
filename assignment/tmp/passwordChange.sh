#!/bin/bash

# Purpose      : Change Password.
# Filename     : passwordChange.sh
# Date Created : 13-Aug-2023
# Date Modified: 18-Aug-2023
# Author       : Joe Velardi


#Data Sources.
source "../core/constants.sh"
source "../core/variables.sh"
source "../core/functions.sh"

#Local Variables.
hasMin=8
hasLower="*[a-z]*"
hasUpper="*[A-Z]*"
hasNumber="*[0-9]*"
hasSpecial="*[#?!@$\%^\&*-]*"


while true
do

    displayBanner

    read -rsp "  Please Enter a Password or Type 'exit' to Quit: " password

    #Exit Gracefully.        
    isExit=$(echo "$password" | tr '[:upper:]' '[:lower:]')
    if [ "$isExit" == "exit" ]; then clear; break; fi

    #Check password Complexity.
    if [ ${#password} -ge $hasMin ] && [[ $password == $hasNumber ]] && [[ $password == $hasUpper ]] && 
        [[ $password == $hasLower ]] && [[ $password == $hasSpecial ]] 
    then 
        #Save Updated Password.
        echo -n "$password" | sha256sum > $secretPassword
        echo -e "\n\n  Thanks. Password Has Been Updated.\n"
        sleep 2
        break

    else
        #Password Does Not Meet Password Complexity Criteria.
        displayBanner

        echo -e "${RED}  Password Change Complexity FAILED:\n${RED}"
        
        if [ ${#password} -lt $hasMin     ];  then echo -e "  - Password Does Not Meet the Minimum Length of 8 Characters."     ; fi
        if [[ $password   !=  $hasLower   ]]; then echo -e "  - Password Does Not Have at Least 1 Lower Case [a-z] Character."  ; fi
        if [[ $password   !=  $hasUpper   ]]; then echo -e "  - Password Does Not Have at Least 1 Upper Case [A-Z] Character."  ; fi
        if [[ $password   !=  $hasNumber  ]]; then echo -e "  - Password Does Not Have at Least 1 Numeric [0-9] Character."     ; fi
        if [[ $password   !=  $hasSpecial ]]; then echo -e "  - Password Does Not Have at Least 1 Special [!@#$%^&] Character." ; fi

        echo -e "${NORMAL}"

        promptPressEnter

    fi

done 

