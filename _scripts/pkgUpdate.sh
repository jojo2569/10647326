#!/bin/bash
# simple update script to update your system
# send your password if required
echo "your_password_here" | sudo -S apt update
# pause for 1 second
sleep 1
# upgrade the packages
sudo apt upgrade -y
# pause for 1 second
sleep 1
# remove old packages
sudo apt autoremove -y
exit 0
