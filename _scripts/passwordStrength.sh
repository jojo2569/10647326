#!/bin/bash 

# Purpose      : Checks Password Strength.
# Filename     : passwordStrength.sh
# Date Created : 20-Jul-23
# Date Modified: 20-Jul-23
# Author       : Joe Velardi


#Enter (Secret) Password.
read -rsp "Enter A Password: " password

#Variabe
len="${#password}" 

#Check That Password is 8 Chars (or More).
if [ $len -ge 8 ] ; then 

	#Check That Password Has a Number.
	echo "$password" | grep -q [0-9] 

	if [ $? -eq 0 ] ; then 

		#Check That Password has an Upper Case.
		echo "$password" | grep -q [A-Z] 

		if [ $? -eq 0 ] ; then 

			#Check That Password Has Lower Case.
			echo "$password" | grep -q [a-z] 

			if [ $? -eq 0 ] ; then 

				#Check That Password has Special Chars.
				echo "$password" | grep -q [$,@,#,%] 

				#All Validations Pass. Password is Strong.
				if [ $? -eq 0 ] ; then 

					echo "Strong Password. Bravo!" 

				#Password Strength is Weak. Display Message.
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
