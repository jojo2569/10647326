#Prints Cleansed Data i Table Format
function printList() {
}
BEGIN {
    FS="\n";
    RS="";
    BLUE="\033[34m";
    BROWN="\033[033m";
    PURPLE="\033[35m";
    NORMAL="\033[0m";

    print "_______________________________________________________________________________________________________________";
    printf("| %sName%s                  | %sDetail%s     | %sBreach Date%s    | %sAccounts Impacted%s                           | %sCompromised Data%s                |\n", BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL);
    print "_______________________________________________________________________________________________________________";
}

{
    printf("| %s%-25s%s | %s%-10s%s | %s%-10s%s | %s%-30s%s | %s%-20s%s |\n", BROWN, $1, NORMAL, PURPLE, $1, NORMAL, PURPLE, $3, NORMAL, PURPLE, $4, NORMAL, PURPLE, $5, NORMAL);
}

END {
    printf ("_______________________________________________________________________________________________________________\n\n");
}