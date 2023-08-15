#Prints Cleansed Data in Table Format.
function printCategory() {
}
BEGIN {
    FS="|";
    BLUE="\033[34m";
    YELLOW="\033[033m";
    MAGENTA="\033[35m";
    NORMAL="\033[0m";

    print("\n______________________________________________________");
    printf("| %s%-51s%s |\n", BLUE, header,  NORMAL);
    print("______________________________________________________");
    printf("| %sCategory%s                                 | %sBreaches%s | \n", BLUE, NORMAL, BLUE, NORMAL);
    print("______________________________________________________");
}
{
    printf("| %s%-40s%s | %s%8s%s |\n", YELLOW, $2, NORMAL, MAGENTA, $1, NORMAL);
}
END {
    printf("_______________________________________________________\n");
    printf("| %s%-51s%s |\n", YELLOW, "Total Records: " NR, NORMAL);
    printf("_______________________________________________________\n\n");
}