
/*
 * Example of modular callback mechanism (pt.1): external library containing the x2 callback functions definition.
 */


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>



/*** PROTOTYPES ***/

void callback_function_A( uint32_t Cnt );
bool callback_function_B( uint32_t PeriodMs, uint16_t Ncycles );



/*** CONSTANTS ***/

const void * pcallback_function_B = &callback_function_B;               // function pointer to callback_B function (needed for line "extern TIMER_CALLBACK pcallback_function_B;" in main project)



/*** CALLBACK FUNCTION ***/

void callback_function_A( uint32_t Cnt ){
    printf(" [A] Cnt = %d\n",Cnt);                                      // with actual hardware, this line could used to toggle a GPIO to blink an LED
}


bool callback_function_B( uint32_t PeriodMs, uint16_t Ncycles ){
    bool Ret;
    if( PeriodMs < 800 ){
        Ret = true;
        printf(" [B] Timer settings: Per = %d ms | Ncyc = %d\n",PeriodMs,Ncycles);
    } else {
        Ret = false;
        printf(" [B] Invalid period!\n");
    }
    return Ret;
}



// NOTES

// 1. To create the library object file (mod_polled_callback_1.o), use "gcc -c mod_polled_callback_1.c".