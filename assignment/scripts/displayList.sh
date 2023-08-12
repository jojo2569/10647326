#!/bin/bash

# Purpose      : Display List in Formatted Table.
# Filename     : displayList.sh
# Date Created : 12-Aug-2023
# Date Modified: 12-Aug-2023
# Author       : Joe Velardi

grep . ../files/cleansedData.txt | awk -f displayList.awk
