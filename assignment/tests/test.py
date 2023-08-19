#!/usr/bin/python3

# Purpose      : {purpose}
# Filename     : test.py
# Date Created : 15-Aug-2023
# Date Modified: 15-Aug-2023
# Author       : Joe Velardi

#Imports.
#import csv
import pandas as pd

#Variables - Make SeparateVariable file.
dataCleansed="../data/cleansedData.txt"
dataCategory = "../data/categoryData.txt"



#Open File.
#with open(dataCategory, "r") as f:
#    reader = csv.reader(f, delimiter="|")
#    for row in reader:
#        #print(row)
#        print(row[1])



#Ctegory Date
#dCategory = pd.read_csv(dataCategory, delimiter="|", header=None)
#dCategory= dCategory.sort_values(dCategory.columns[0], ascending=[False]).head(20)
#print(dCategory)


dCleansed = pd.read_csv(dataCleansed, delimiter="|", names=['Name', 'Description', 'Date', 'Accounts', 'Categories'])
#dCleansed['Date'] = dCleansed['Date'].astype('datetime64[ns]')
dCleansed= dCleansed.sort_values(dCleansed.columns[2], ascending=[False]) #.head(10)



#dCleansed = pd.DataFrame(dCleansed)

#dCleansed[2] = pd.to_datetime(dataCleansed[2], format='%Y-%mm-%dd')

#dGroupBy=dCleansed.groupby(dCleansed.date.dt.year)['Accounts'].sum()

dCleansed['Date'] = dCleansed['Date'].str[:4]
dGroupBy=dCleansed.groupby('Date')['Accounts'].sum().reset_index(name ='Totals')
print(dGroupBy)


###dGroupBy=dCleansed.groupby(pd.Grouper(key='Date', axis=0, freq='Y')).sum()



#print(dCleansed)
#print(dCleansed[['Name', 'Date', 'Accounts']].dtypes)

#print(dCleansed[['Date', 'Accounts']])










# sudo apt-get install python3-matplotlib  -- ubuntu




