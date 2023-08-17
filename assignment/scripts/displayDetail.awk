#Prints Individual Record Detail.

BEGIN {
    FS="|";
    BOLD="\033[1m";
    BLUE="\033[34m";
    YELLOW="\033[033m";
    MAGENTA="\033[35m";
    NORMAL="\033[0m";
}

{
    printf("\n\n%sPWNED Wesite Information.%s", BOLD, NORMAL);
    printf("\n\n%s%s%s\n%72s\n\n", YELLOW, $1, NORMAL, $2);
    printf("%s%-22s: %s%s\n", BOLD, "Breach Date", NORMAL, $3);
    printf("%s%-22s: %s%s\n", BOLD, "Compromised Accounts", NORMAL, $4);
    printf("%s%-22s: %s%s\n", BOLD, "Compromised Data", NORMAL, $5);
}

END {
    printf("___________________________________________________________________\n");

}
