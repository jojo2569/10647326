#!/usr/bin/python3

# Purpose      : {purpose}
# Filename     : mtplotlib.py
# Date Created : 19-Aug-2023
# Date Modified: 19-Aug-2023
# Author       : Joe Velardi


#Imports.
import pandas as pd
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt


#Variables - Make SeparateVariable file.
#dataCleansed="../data/cleansedData.txt"
#dataCategory = "../data/categoryData.txt"


#Read Data and Apply Field Names
#dCleansed = pd.read_csv(dataCleansed, delimiter="|", names=['Name', 'Description', 'Date', 'Accounts', 'Categories'])

#Trim Date Field to 'YYYY' Year Component.
#dCleansed['Date'] = dCleansed['Date'].str[:4]

#Group Data By Year, with Totals
#dGroupBy=dCleansed.groupby('Date')['Accounts'].sum().reset_index(name ='Totals')['Accounts'].mean().reset_index(name ='Means')
#print(dGroupBy)

fig, ax = plt.subplots()  # Create a figure containing a single axes.
ax.plot([1, 2, 3, 4], [1, 4, 2, 3])  # Plot some data on the axes.