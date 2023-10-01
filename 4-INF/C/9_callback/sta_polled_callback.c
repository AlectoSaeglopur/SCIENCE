
/*
 * Example of standalone callback mechanism (in polling, since no MCU hardware is available for interrupts). 
 */


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>



/*** CONSTANTS ***/

uint32_t SimCnt = 0;                                        // Simulation counter
const uint32_t SimTo = 1050;                                // Simulation timeout
const uint32_t SimPer = 101;                                // Simulation period to generate event



/*** CALLBACK FUNCTION ***/

void callback_function( void ){
    printf(" Cnt = %d\n",SimCnt);                           // with actual hardware, this line could used to toggle a GPIO to blink an LED
}



/*** CALLBACK REGISTRATION ***/

void (*fpointer) (void) = &callback_function;



/*** CALLBACK EXECUTION ***/

void callback_execution( void (*fn) (void) ){
    if( (SimCnt%SimPer) == 0 ){                             // condition for executing callback function
        fn();                                           
    }
    SimCnt++;
}



/*** MAIN ***/

int main( void ){
    while( 1 ){
        callback_execution(fpointer);                       // continuously executed in polling
        if( SimCnt > SimTo ){                               // exit condition (not to run endlessly here)
            break;
        }
    }
}