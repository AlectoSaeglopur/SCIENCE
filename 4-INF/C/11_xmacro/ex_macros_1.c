
/*
 * Example of macro-function with multiple actions.
 * NB: This is just an example to show macro capabilities, but it's NOT
 *     recommended to use a macro-function like "EXE_MACRO"!
 */

/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


/*** DEFINES ***/

#define EXE_MACRO(w)                        /* macro function with x1 argument */ \
    w*2;                                    /* returns "w*2" as output */ \
    add_one(&w);                            /* invokes external function */ \
    printf("MACR = %d\n",w);                // invokes "printf" function (NB: "printf" returns an "int" as output, however this is discarded since only the 1st output within the macro counts!)


/*** FUNCTIONS ***/          

void add_one( uint16_t * pVal ){
    *pVal += 1;
}


/*** MAIN ***/

int main( void ){
    uint16_t vkn = 23;
    vkn = EXE_MACRO(vkn);                   // prints 47
}
