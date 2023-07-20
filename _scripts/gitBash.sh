#!/bin/bash

# Purpose      : Push to GIT Hub Repo.
# Filename     : gitBash.sh
# Date Created : 14-Jul-23
# Date Modified: 20-Jul-23
# Author       : Joe Velardi


# Read Folder/File to Replicate to GIT Hub
read -p "Files/Folders     : " content

# Add a Description for the Update.
read -p "Commit Description: " desc

#Sanity Check. If empty, use current Location.
if [ -z "$content" ]
then
	content="."
fi

#GIT Command to Commit.
git add $content
git commit -m "$desc"
git branch -M main
git push -u origin main

