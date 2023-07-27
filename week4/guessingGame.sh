#!/bin/bash

# Purpose      : {purpose}
# Filename     : guessingGame.sh
# Date Created : 26-Jul-2023
# Date Modified: 26-Jul-2023
# Author       : Joe Velardi


#Variables
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
NORMAL="\033[0m"

MIN=1
MAX=100
ANSWER=42
GUESS=0


#Function: getNumber
getNumber() {

    while [ "$GUESS" -ne "$ANSWER" ]
    do

        read -rp "Enter a Number Between 1 and 100 : " GUESS

        #Correct $GUESS.
        if [ "$GUESS" -eq "$ANSWER" ]
        then
                echo -e "\n${GREEN}Correct!${NORMAL}\n"

        #Less Than $ANSWER.
        elif [[ "$GUESS" -ge "$MIN" && "$GUESS" -le "$ANSWER" ]]
        then  
                echo -e "\n${BLUE}Too Low!${NORMAL}\n"
       
        #Greater Than $ANSWER.
        elif [[ "$GUESS" -ge "$ANSWER" && "$GUESS" -le "$MAX" ]]
        then         
                echo -e "\n${BLUE}Too High!${NORMAL}\n"

        #Catch for Out of Bound.
        else
                echo -e "\n${RED}Invalid Entry. Input must be between $MIN and $MAX.${NORMAL}\n"

        fi

    done
}

clear
echo -e "\n"
#RUN Function.
getNumber

exit 0