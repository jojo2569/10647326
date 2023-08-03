#!/bin/bash

# Purpose      : Converts Temperature Between Celcius and Fahrenheit
# Filename     : convertTemp.sh
# Date Created : 14-Jul-23
# Date Modified: 20-Jul-23
# Author       : Joe Velardi


# Prints Menu to Screen
echo "*** Converting between the different temperature scales ***"
echo "1. Convert Celsius temperature into Fahrenheit"
echo "2. Convert Fahrenheit temperatures into Celsius"
echo -n "Select your choice (1-2) : "
read choice
 
# Executes Condition Based on Choice
if [ $choice -eq 1 ]
then
	#Enter Degrees Celcius
	echo -n "Enter temperature (C) : "
	read tc

	#Display Fahrenheit Value
	#Formula tf=(9/5)*tc+32
	tf=$(echo "scale=2;((9/5) * $tc) + 32" |bc)
	echo "$tc C = $tf F"

elif [ $choice -eq 2 ]

then
	#Enter Degrees Farenheit
	echo -n "Enter temperature (F) : "
	read tf

	#Display Celcius Value
	#Formula tc=(5/9)*(tf-32) 
	tc=$(echo "scale=2;(5/9)*($tf-32)"|bc)
	echo "$tf = $tc"

else
	#Incorrect Value Entered. Exiting with an error.
	echo "Please select 1 or 2 only"
	exit 1
fi

exit 0
