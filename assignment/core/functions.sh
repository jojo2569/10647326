#Common Displays & Prompts.

displayBanner() {
    clear
    cat $welcomeBanner
}

promptInvalidEntry() {
    echo -e "\n${RED}  Invalid Entry. Try Again ...${NORMAL}\n\n"
    sleep 1
}

promptPressEnter() {
    read -rp "  Press Enter to Continue ..."
}
