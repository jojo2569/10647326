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

echo "git commit -m $desc"
sleep 3


git commit -m "$desc"
git branch -M main
git push -u origin master

sleep 2
printf $uname \r \n
sleep 2
printf $token \r \n
