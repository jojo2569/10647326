#!/bin/bash

# Purpose      : Checks System & Updates Packages.
# Filename     : pkgUpdate.sh
# Date Created : 15-Jul-23
# Date Modified: 20-Jul-23
# Author       : Joe Velardi


#Update Packages
sudo -S apt update

#Pause for 1 second
sleep 1

#Upgrade Packages
sudo apt upgrade -y

#Pause for 1 second
sleep 1

#Remove old packages
sudo apt autoremove -y

exit 0
