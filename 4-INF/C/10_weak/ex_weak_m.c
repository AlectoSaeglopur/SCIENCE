
/*
 * "Weak" attribute example (pt.1) - main source file
 */


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include "ex_weak.h"


/*** CONSTANTS ***/

const __attribute__((weak)) uint16_t VAL = 3;       // constant defined as weak, so that it can be overriden in "ex_weak_s.c" (if included during linking)


/*** MAIN ***/

int main(){
    print_square_cback(VAL);                        // returns respectively "strong = 16" and "weak = 9" when "ex_weak_s.o" is included or not during the linking prcess
    printf("%X",print_square_cback);
    return 1;
}

/*** NOTES ***/

// 1. Not including the object file "ex_weak_s.o" during the linking process, keeps the definition of both "VAL" and "print_square(.)" as weak:
//    >> cls && gcc -c ex_weak_m.c ex_weak_w.c && gcc ex_weak_m.o ex_weak_w.o -o asd && asd
//    NB: since "ex_weak_s.o" is not needed here, it's even useless to generate it, thus also "gcc -c ex_weak_s.c" can be removed from the command.

// 2. Including the object file "ex_weak_s.o" during the linking process, overrides the definition of both "VAL" and "print_square(.)" as strong
//    according to what's defined in "ex_weak_s.c":
//    >> cls && gcc -c ex_weak_m.c ex_weak_w.c ex_weak_s.c && gcc ex_weak_m.o ex_weak_w.o ex_weak_s.o -o asd && asd
