#!/usr/bin/python3

# Purpose      : {purpose}
# Filename     : test.py
# Date Created : 15-Aug-2023
# Date Modified: 15-Aug-2023
# Author       : Joe Velardi

#Imports.
import csv


import pandas as pd

#Variables - Make SeparateVariable file.
dataCategory = "../data/categoryData.txt"


#Open File.
with open(dataCategory, "r") as f:
    reader = csv.reader(f, delimiter="|")
    for row in reader:
        #print(row)
        print(row[1])




#fn = pd.read_csv(dataCategory, delimiter="|")
#print(fn.sort_values(by=[0], axis=[0], ascending=False))




# sudo apt-get install python3-matplotlib  -- ubuntu
# sudo apt-get install python3-matplotlib   -- ubuntu




