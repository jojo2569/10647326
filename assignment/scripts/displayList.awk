#Prints Cleansed Data in Table Format.

BEGIN {
    FS="|";
    BLUE="\033[34m";
    YELLOW="\033[033m";
    MAGENTA="\033[35m";
    BBLUE="\033[1;34m";
    BYELLOW="\033[1;033m";
    BMAGENTA="\033[1;35m";
    NORMAL="\033[0m";

    print("\n__________________________________________________________________________________________");
    printf("| %s%-86s%s |\n", BBLUE, header,  NORMAL);
    print("__________________________________________________________________________________________");
    printf("| %sName%s                                               | %sBreach Date%s     | %sBreached Accts%s  |\n", BLUE, NORMAL, BLUE, NORMAL, BLUE, NORMAL);
    print("__________________________________________________________________________________________");
}

{
    SUM +=$4;
    AVG += $4;
    printf("| %s%-50s%s | %s%-15s%s | %s%'15d%s |\n", YELLOW, $1, NORMAL, MAGENTA, $3, NORMAL, MAGENTA, $4, NORMAL );
}

END {
    printf("__________________________________________________________________________________________\n");
    printf("| %s%-68s%s | %s%'15d%s |\n", BYELLOW, "Total Records: " NR, NORMAL, BMAGENTA, SUM, NORMAL);
    printf("| %s%-68s%s | %s%'15d%s |\n", BYELLOW, "Average User Accounts Breached:", NORMAL, BMAGENTA, SUM/NR, NORMAL);
    printf("__________________________________________________________________________________________\n\n");
}