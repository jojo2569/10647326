#!/bin/bash 
      
read -rsp "Enter A Password: " password
      
len="${#password}" 
      
if [ $len -ge 8 ] ; then 

	echo "$password" | grep -q [0-9] 

	if [ $? -eq 0 ] ; then 

		echo "$password" | grep -q [A-Z] 

		if [ $? -eq 0 ] ; then 

			echo "$password" | grep -q [a-z] 

			if [ $? -eq 0 ] ; then 

				echo "$password" | grep -q [$,@,#,%] 

				if [ $? -eq 0 ] ; then 

					echo "Strong Password. Bravo!" 

				else 

					echo "Weak Password: Include Special Chars [$,@,#,%]" 

				fi 

			else 

				echo "Weak Password: Include Lower Case Chars [a-z]"

			fi 

		else 

			echo "Weak Password: Include Upper Case Chars [A-Z]"  

		fi 

	else 

     		echo "Weak “Password: Include Numbers [0-9]"

	fi

else

	echo "Weak Password: Use at Least 8 Chars"

fi 
