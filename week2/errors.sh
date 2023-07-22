#!/bin/bash 

# Purpose      : Fix Errors from Original.
# Filename     : errors.sh
# Date Created : 22-Jul-23
# Date Modified: 22-Jul-23
# Author       : Joe Velardi


#Moved the read Prompt First, to get User Input to the $REPLY Variable.
#Added -r option to the read Variable.
#Added 'REPLY' Variable to the read Prompt.
#Changed the Orderof the case options.
#Encased case option "true" within brackets.
#Cleaned up tabs and spaces.

read -rsp "What's the secret code? " REPLY

secret="shhh" #Don't tell anyone! 
 

#if the user types in the correct secret, tell them they got it right! 

if [ "$secret" = "$REPLY" ]; then 

	echo -e "\nYou got it right!" 

	correct=true 

else     
	
	echo -e "\nYou got it wrong :(" 
      
	correct=false 
      
fi 
      


case $correct in 
    
	[true]* )
		echo "You have unlocked the secret menu"
		#TODO: Add a Secret Menu.
		;;

	* )

		echo "Go Away!" #people who get it wrong need to be told to go away! 
		;; 

esac

