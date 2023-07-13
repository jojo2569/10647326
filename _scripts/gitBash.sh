#!/bin/bash

# Push to GIT Repo

read -p "Files/Folders     : " content
read -p "Commit Description: " desc

if [ -z "$content" ]
then
	content="."
fi

git add $content
git commit -m "$desc"
git branch -M main
git push -u origin main

