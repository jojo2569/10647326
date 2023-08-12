#Prints Cleansed Data i Table Format
function printList() {
}
BEGIN {
    FS="~";
    BLUE="\033[34m";
    BROWN="\033[033m";
    PURPLE="\033[35m";
    NORMAL="\033[0m";

    print "____________________________________________________________________________________________________";
    printf("| %sName%s                                               | %sBreach Date%s         | %sAccounts Impacted%s     |\n", BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL);
    print "____________________________________________________________________________________________________";
}

{
    printf("| %s%-50s%s | %s%-20s%s | %s%-20s%s |\n", BROWN, $1, NORMAL, PURPLE, $3, NORMAL, PURPLE, $4, NORMAL);
}

END {
    printf ("____________________________________________________________________________________________________\n\n");
}