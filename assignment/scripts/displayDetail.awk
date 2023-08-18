#Prints Individual Record Detail.

BEGIN {
    FS="|";
    BBLUE="\033[1;34m";
    BYELLOW="\033[1;033m";
    NORMAL="\033[0m";

    printf("\n\n%s  PWNED Wesite Information.%s", BBLUE, NORMAL);
}

{
    printf("\n\n  %s%-22s: %s%s\n", BYELLOW, "Breached Website", NORMAL,$1 );
    printf("  %s%-22s: %s%s\n", BYELLOW, "Breach Date", NORMAL, $3);
    printf("  %s%-22s: %s%'d\n", BYELLOW, "Compromised Accounts", NORMAL, $4);
    printf("  %s%-22s: %s%s\n", BYELLOW, "Compromised Data", NORMAL, $5);
    printf("\n  %s%s\n", NORMAL, $2 );

    printf("\n  --------------------------------------------------\n\n");
}

END {

}
