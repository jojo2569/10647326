#!/usr/bin/python3

# Purpose      : {purpose}
# Filename     : brute.py
# Date Created : 07-Aug-2023
# Date Modified: 07-Aug-2023
# Author       : Joe Velardi


#Libraries
import string
import itertools
import hashlib
import time
import os


#Variables
alphaNumericList = string.printable[:62]                #Index 62 is AlphaNumeric only. Index 95 includes Special Chars.
startLength      = 1
result           = None
startTime        = int(time.time())
passwordHash     = "04e77bf8f95cb3e1a36a59d1e93857c411930db646b46c218a0352e432023cf2"


#Function: Converts Tuple to String for encoding.
def convertTuple(tupleList):
    str = ''
    for item in tupleList:
        str = str + item
    return str.encode('utf-8')


#Function: Brute Force Password using itertools.product
def bruteForce(alphaNumericList, passwordHash, passwordLength):

    charList = [[x for x in alphaNumericList]] * passwordLength

    for tupleCombo in itertools.product(*charList):

        #Converts Word as Tuple into String, then Hashed.
        wordCombo = convertTuple(tupleCombo)
        wordHash  = hashlib.sha256(wordCombo).hexdigest()

        #Tests Matched Hashed Word v Password.
        if wordHash == passwordHash:
            return wordCombo.decode('utf-8')

#Main
os.system('clear')

print(f"Brute Force Password Finder (Searching AlphaNumeric Only) ...\n")

while result == None:
    
    result  = bruteForce(alphaNumericList, passwordHash, startLength)
    startLength +=1

#Print Results.
endTime = int(time.time())
print(f"Password `{result}` cracked in {endTime - startTime} seconds.\n")