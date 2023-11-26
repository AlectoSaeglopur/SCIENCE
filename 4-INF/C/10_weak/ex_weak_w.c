
/*
 * "Weak" attribute example (pt.3) - weak source file
 */


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>


/*** FUNCTIONS ***/

// weak definition of overridable function
void __attribute__((weak)) print_square( uint16_t val ){
    printf(" weak = %d\n",val*val);
}

// callback definition invoking overridable function
void print_square_cback( uint16_t val ){
    print_square(val);
}