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

    print("\n______________________________________________________");
    printf("| %s%-51s%s |\n", BBLUE, header,  NORMAL);
    print("______________________________________________________");
    printf("| %sCategory%s                                 | %sBreaches%s | \n", BLUE, NORMAL, BLUE, NORMAL);
    print("______________________________________________________");
}
{
    printf("| %s%-40s%s | %s%'8d%s |\n", YELLOW, $2, NORMAL, MAGENTA, $1, NORMAL, SUM+=$1);
}
END {
    printf("_______________________________________________________\n");
    printf("| %s%-40s%s | %s%'8d%s |\n", BYELLOW, "Total Records: " NR, NORMAL, BMAGENTA, SUM, NORMAL);
    printf("_______________________________________________________\n\n");
}