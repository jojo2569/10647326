#Display "Invalid Entry" Promt.
promptInvalidEntry() {
    echo -e "\n${RED}  Invalid Entry. Try Again ...${NORMAL}\n\n"
    sleep 1
}

promptPressEnter() {
    read -rp "Press Enter to Continue ..."
}
