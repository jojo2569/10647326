#!/bin/bash

# Purpose      : Selet Numbers Between Ranges
# Filename     : getNumbers.sh
# Date Created : 26-Jul-2023
# Date Modified: 27-Jul-2023
# Author       : Joe Velardi


#Constants
RED="\033[31m"
NORMAL="\033[0m"


#This function prints a given error       
printError()     
{ 
      
    echo -e "${RED}ERROR:${NORMAL} $1" 
      
} 
      
      
#This function will get a value between the 2nd and 3rd arguments      
getNumber() 
      
{ 
      
    read -p "$1: " 
      
    while (( $REPLY < $2 || $REPLY> $3 )); do 
      
        printError "Input must be between $2 and $3" 
      
        read -p "$1: " 
      
    done 
      
} 


echo "This is the start of the script" 
      
getNumber "Please type a number between 1 and 10" 1 10 
      
echo "Thank you!" 
      
getNumber "Please type a number between 50 and 100" 50 100 
      
echo "Thank you!" 
     
					