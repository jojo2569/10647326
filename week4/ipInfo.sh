#!/bin/bash

# Purpose      : Display Networking Information.
# Filename     : ipInfo.sh
# Date Created : 30-Jul-2023
# Date Modified: 30-Jul-2023
# Author       : Joe Velardi


#Get info about networking from the ifconfig command 
net_info="$(ifconfig)" 

#Parse out the ip address lines using sed 
addresses=$(echo "$net_info" | sed -n '/inet / { 

    s/inet/IP Address:/ 

    s/netmask/\n\t\tSubnet Mask:/ 

    s/broadcast/\n\t\tBroadcast Address:/ 

    p 

}') 
      
#Format Output
echo -e "IP Addresses on this computer are:\n$addresses" 