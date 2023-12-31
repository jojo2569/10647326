#!/usr/bin/python3

# Purpose      : Brute Force Attack Algorythm.
# Filename     : brute.py
# Date Created : 07-Aug-2023
# Date Modified: 11-Aug-2023
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
passwordHash     = "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"


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

print(f"Brute Force Password Finder ...\n")

while result == None:

    result  = bruteForce(alphaNumericList, passwordHash, startLength)
    startLength +=1


#Print Results.
endTime = int(time.time())
print(f"Password `{result}` cracked in {endTime - startTime} seconds.\n")