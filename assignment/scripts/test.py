#!/usr/bin/python3

# Purpose      : {purpose}
# Filename     : test.py
# Date Created : 15-Aug-2023
# Date Modified: 15-Aug-2023
# Author       : Joe Velardi

#Imports.
#import matplotlib as mpl
#import matplotlib.pyplot as plt
import numpy as np
import pandas as pd



filename = "../data/categoryData.txt"

#dataX=np.loadtxt( filename, delimiter='|', usecols=[0])
#dataY=np.loadtxt( filename, delimiter='|', usecols=[1], dtype=str)
#print(data)


data = pd.read_csv(filename, delimiter='|')
data.info()



#with open(filename, "r") as f:
#    print(f.read())

 







# sudo apt-get install python3-matplotlib  -- ubuntu
# sudo apt-get install python3-matplotlib   -- ubuntu