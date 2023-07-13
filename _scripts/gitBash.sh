#!/bin/bash

# Push to GIT Repo

read -p "Files/Folders     : " content

if [ -z "$content" ]
then
	content="."
fi


git add $content


read -p "Commit description: " desc

echo "git commit -m $desc"
sleep 3


git commit -m "$desc"
git branch -M main
git push -u origin main

