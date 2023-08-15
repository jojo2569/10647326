#!/bin/bash

# Purpose      : {purpose}
# Filename     : test.sh
# Date Created : 15-Aug-2023
# Date Modified: 15-Aug-2023
# Author       : Joe Velardi


	recCount=2
	recLoop=20
	


		getHead=$(($recCount * $recLoop * -1))
		getTail=$((echo "+$($recCount * $recLoop - $recLoop + 1)"))

        #getTail=$(echo "+${getTail}")

        echo "$getHead  -head"
        echo "$getTail  -tail"