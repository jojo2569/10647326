#Prints Cleansed Data in Table Format
function printList() {
}
BEGIN {
    FS="|";
    BLUE="\033[34m";
    BROWN="\033[033m";
    PURPLE="\033[35m";
    NORMAL="\033[0m";


    print "__________________________________________________________________________________________";
    printf("| %sName%s                                               | %sBreach Date%s     | %sUsers Impacted%s  |\n", BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL);
    print "__________________________________________________________________________________________";
}

{
    printf("| %s%-50s%s | %s%-15s%s | %s%15s%s |\n", UBROWNP, $1, NORMAL, PURPLE, $3, NORMAL, PURPLE, $4, NORMAL);
}

END {
    printf ("__________________________________________________________________________________________\n\n");
}