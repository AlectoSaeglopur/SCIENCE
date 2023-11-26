
/*** INCLUDES ***/

#include <stdio.h>          // to use "printf"
#include <stdlib.h>         // to use "atoi" (for string-to-int convertion)
#include <string.h>         // to use "strcmp" (for string comparison)


/*** MAIN ***/

int main(int argc, char **argv){
    if( (argc > 2) && !(strcmp(argv[1],"sqr")) ){
        int x = atoi(argv[2]);
        printf("SQR = %d\n",x*x);
    } else {
        printf("Command not recognized!");
    }
    return 1;
}


/***    NOTES ***/

// 1. "argc" represents the number of provided input arguments (i.e. the length of "argv").
//    Remember argv[0] is by default the name of the .exe file itself, thus argc is always >= 1.

// 2. "argv" represents the list of input arguments provided by terminal. All elements of "argv"
//    are interpreted as strings, then "atoi(.)" can be used for integer conversion.

// 3. For example, typing "cls && gcc ex_main_arg.c -o asd && asd sqr 4" return "SQR = 16".
