#!/bin/bash

#Function to Prompt User & Create Folder.
function createFolder() {

    read -p "Type the name of the folder you would like to create: " folderName


    if [[ -d "$folderName" ]]
        then
            echo -e "\nFolder $folderName already exists.\n"
	    ((cntDupe+=1))
	    arrayCreated+=$folderName
        else
            mkdir "$folderName"
            echo -e "\nFolder $folderName created\n"
	    ((cntGood+=1))
    fi
}

#Vars
cntGood=0
cntDupe=0


#Initial User Prompt
createFolder


#Loop To Create Additional.
while true
do
    read -p "Do you want to create another folder (yn) ?" yn

    case $yn in
        [Yy]* )
                createFolder
        ;;
        [Nn]* )
                break
        ;;
        * )
                echo -e "\nPlease answer yes(y) or no(n)."
        ;;
    esac
done

#Summary
echo -e "\n\nYou created $cntGood folder(s) and had $cntDupe duplicate(s)."
