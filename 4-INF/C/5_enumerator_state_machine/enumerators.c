
/*
 * Script showing an example of enumerators.
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


/* TYPEDEFS */

typedef enum { MON, TUE, WED, THU, FRI, SAT, SUN } weekday_t;                   // by default, MON=0, TUE=1, ..., SUN=6

typedef enum {
    ON,                                                                         // ON = 0
    OFF,                                                                        // OFF = 1
    INIT = 34,                                                                  // INIT = 34
    ERROR,                                                                      // ERROR = 35
    SLEEP                                                                       // SLEEP = 36
} state_t;


/* MAIN */

int main( void ){

    weekday_t today = WED;
    state_t fsm = SLEEP;

    printf(" Size = %d bytes\n",sizeof(today));                                 // results 4 bytes (see NOTE#1)
    printf(" Day = %d\n",today);                                                // returns 2
    printf(" -----\n");
    printf(" Size = %d bytes\n",sizeof(state_t));                               // results 4 bytes (see NOTE#1)
    printf(" State = %d\n",fsm);                                                // returns 36
    
    return 1;
}


/* NOTES */

// 1. In standard-C there is no way to control the size of an enum-type. For example, here "weekday_t"
//    it is of 4-byte size even though it could easily be of 1-byte only. That depends on the compiler
//    and is anyway a trade-off between memory usage (better with uint8) and memory indexing efficiency
//    (better with uint32, since the PC has a 32-bit architecture -> see "memory_alignment" topic!).