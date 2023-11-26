
/*
 * "Weak" attribute example (pt.4) - strong source file
 */


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>


const int VAL = 4;                      // strong definition overriding the weak one in "ex_weak_m.c"


/*** FUNCTIONS ***/

// strong definition of overridable function
void print_square( uint16_t val ){
    printf(" strong = %d\n",val*val);
}