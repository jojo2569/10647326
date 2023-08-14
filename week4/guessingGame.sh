#!/bin/bash

# Purpose      : {purpose}
# Filename     : guessingGame.sh
# Date Created : 26-Jul-2023
# Date Modified: 27-Jul-2023
# Author       : Joe Velardi


#Constants
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
MAGENTA="\033[35m"
NORMAL="\033[0m"
MIN=1
MAX=100
ANSWER=42

#Variables
guess=0
lowest=$MIN
highest=$MAX
attempts=0

#Expressions
isNumber="^[0-9]+$"


#Common Error Message.
displayInvalidEntry() {
        echo -e "\n${RED}Invalid Entry. Input must be between $MIN and $MAX!${NORMAL}\n"
}


#Gets Range of Minumum & Maximum Values Attempted.
getRange() {
        echo -e "Lowest ($1), Highest ($2)\n"
}


#Evaluates if Number is Correct.
evaluateNumber() {

        #Correct $guess.
        if [ "$guess" -eq "$ANSWER" ]
        then
                echo -e "\n${GREEN}Correct! It took you $attempts attempt(s)!${NORMAL}\n"
                exit 0

        #Less Than $ANSWER.
        elif [[ "$guess" -ge "$MIN" && "$guess" -le "$ANSWER" ]]
        then  
                if [ "$guess" -ge "$lowest" ]; then lowest=$guess; fi
                echo -e "\n${BLUE}Too Low! $(getRange $lowest $highest)${NORMAL}\n"

        #Greater Than $ANSWER.
        elif [[ "$guess" -ge "$ANSWER" && "$guess" -le "$MAX" ]]
        then         
                if [ "$guess" -le "$highest" ]; then highest=$guess; fi
                echo -e "\n${MAGENTA}Too High! $(getRange $lowest $highest)${NORMAL}\n"

        #Catch for Out-of-Bound.
        else
                displayInvalidEntry

        fi
}


#Run
clear

while true
do
        #Read Guess from User; Increment Attempts.
        read -rp "Enter a Number Between 1 and 100 : " guess
        ((attempts++))

        #Tests if a Number.
        if [[ $guess =~ $isNumber ]]; then
                evaluateNumber
        else
                displayInvalidEntry
        fi

done

exit 0