#!/bin/bash

# Push to GIT Repo

#GitHub Username
uname="jojo2569"
token="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"

read -p "Files/Folders     : " content

if [ -z "$content" ]
then
	content="."
fi


git add $content
read -p "Commit description: " desc
git commit -m "$desc"
git branch -M main
git push origin master

sleep 10
printf uname
sleep 10
printf token
