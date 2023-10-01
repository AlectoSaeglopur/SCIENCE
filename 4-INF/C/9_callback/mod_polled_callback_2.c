
/*
 * Example of modular callback mechanism (pt.2): main project invoking the callback functions from object file of external library.
 */


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>



/*** TYPEDEFS ***/

typedef uint32_t timer_period_t;
typedef uint16_t timer_cycles_t;
typedef bool (*TIMER_CALLBACK) (timer_period_t PeriodMs,
                                timer_cycles_t Ncyc);           // typedef for pointer to timer callback function (B)
typedef struct{
    TIMER_CALLBACK callback;
    timer_period_t period;
    timer_cycles_t cycles;
} TIMER_OBJ;                                                    // typedef contatining timer callback function, period and number of cycles settings



/*** CONSTANTS ***/

uint32_t SimCnt = 0;                                            // Simulation counter (A+B)
const uint32_t SimTo = 1050;                                    // Simulation timeout (A+B)
const uint32_t SimPer = 101;                                    // Simulation period to generate event (A+B)

const timer_period_t TmrPer = 650;                              // Initial timer period to be set [ms] (B)
const timer_cycles_t TmrCyc = 12;                               // Initial timer number-of-cycles to be set [.] (B)
TIMER_OBJ MyTimer;



/*** CALLBACK REGISTRATION ***/

extern void callback_function_A( uint32_t );                    // prototype matching the callback function A in external library
void (*fpointer) (uint32_t) = &callback_function_A;

extern TIMER_CALLBACK pcallback_function_B;                     // prototype matching the callback function B in external library
void callback_registration_B( TIMER_CALLBACK cb_function, timer_period_t PeriodMs, timer_cycles_t Ncyc ){
    MyTimer.callback = cb_function;                             // (basically the same as using "fpointer" as above for case A)
    MyTimer.period = PeriodMs;
    MyTimer.cycles = Ncyc;
}



/*** CALLBACK EXECUTION ***/

void callback_execution_A( void (*fn) (uint32_t) ){
    if( (SimCnt%SimPer) == 0 ){                                 // condition for executing callback function A
        fn(SimCnt);                                             // invoke callback A
    }
    SimCnt++;
}

void callback_execution_B( void ){
    if( (SimCnt%SimPer) == 0 ){                                 // condition for executing callback function B
        MyTimer.callback(MyTimer.period,MyTimer.cycles);        // invoke callback B (simulating the setting of an MCU timer)
        MyTimer.period += 20;
        MyTimer.cycles++;
    }
    SimCnt++;
}



/*** MAIN ***/

int main( void ){

    while( 1 ){
        callback_execution_A(fpointer);                         // continuously executed in polling
        if( SimCnt > SimTo ){                                   // exit condition (not to run endlessly here)
            break;
        }
    }

    printf(" ---------\n");

    callback_registration_B(pcallback_function_B,TmrPer,TmrCyc);
    SimCnt =0;
    while( 1 ){
        callback_execution_B();
        if( SimCnt > SimTo ){
            break;
        }
    }

}


// NOTES

// 1. To run the project:
//    - generate object file for external library (see "mod_polled_callback_1.c");
//    - generate object file for main project (i.e. "mod_polled_callback_2.o") with "gcc -c mod_polled_callback_2.c";
//    - link the object files to generate executable and run with "gcc mod_polled_callback_1.c mod_polled_callback_2.c -o asd && asd";
//    - (or summing up "cls && gcc -c mod_polled_callback_1.c mod_polled_callback_2.c && gcc mod_polled_callback_1.c mod_polled_callback_2.c -o asd && asd").
