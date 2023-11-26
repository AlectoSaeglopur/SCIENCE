
/*
 * "Weak" attribute example (pt.2) - header file
 */


#ifndef WEAK_H
#define WEAK_H


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>


/*** PROTOTYPES ***/

void print_square_cback( uint16_t val );
void __attribute__((weak)) print_square( uint16_t val );


#endif