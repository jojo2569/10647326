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


echo "git add $content"
sleep 5


read -p "Commit description: " desc
git commit -m "$desc"


sleep 5
echo "sleep 5 - commit desc $desc"


git branch -M main
git push origin master

sleep 2
printf $uname
sleep 2
printf $token
