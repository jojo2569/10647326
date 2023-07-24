#!/bin/bash

# Purpose      : Multiple Folder Maker
# Filename     : megaFolderMaker.sh
# Date Created : 23-Jul-2023
# Date Modified: 23-Jul-2023
# Author       : Joe Velardi

      
#If there aren't two arguments to the script 
      
if (( $#!=2 )); then 
      
    #Print an error and exit 
      
    echo "Error, provide two numbers" && exit 1 
      
fi 
      
#For every number between the first argument and the last 
      
for ((i = $1; i <= $2; i++)) 
      
do 
      
    #Create a new folder for that number 
      
    echo "Creating directory week$i" 
      
    mkdir -p "../week$i" 
      
done 
     
					
