#!/bin/bash

# Purpose      : Display IP Address Networking Information Only.
# Filename     : ipAddressOnly.sh
# Date Created : 30-Jul-2023
# Date Modified: 30-Jul-2023
# Author       : Joe Velardi


#Get Output from ipInfo.sh
ipInfo="$(./ipInfo.sh)"

#Parse out the ip address lines using sed 
addresses=$(echo "$ipInfo" | sed -n '/IP Address:/p') 
      
#Format Output
echo -e "IP Addresses on this computer are:\n$addresses" 
