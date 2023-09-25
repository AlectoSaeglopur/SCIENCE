
/*
 * Script showing an example of breaker state machine (based either switch-case or functions-array).
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


/* DEFINES */

#define KEY_START       (uint8_t) 0xD3                                  // special value needed to move on from OFF to INIT and from INIT to ON
#define KEY_RESET       (uint8_t) 0xDF                                  // special value needed to move back from ERROR to OFF and from TRIP to ON
#define TRIP_THR        (uint8_t) 150                                   // over-voltage threshold for tripping decision (shall be between 0 and 255)


/* TYPEDEFS */

typedef enum {
    OFF = 0,                                                            // breaker is off
    INIT,                                                               // breaker initialization is ongoing
    ERROR,                                                              // breaker experienced an error during initialization
    ON,                                                                 // breaker is on and checking the over-voltage condition
    TRIP,                                                               // breaker has tripped after detecting an over-voltage event 
    NSTATES
} state_t;


/* PROTOTYPES */

void Exe_Off(uint8_t, state_t*);
void Exe_Init(uint8_t, state_t*);
void Exe_Error(uint8_t, state_t*);
void Exe_On(uint8_t, state_t*);
void Exe_Trip(uint8_t, state_t*);


/* VARIABLES */

state_t fsm = OFF;
void ( * const StFuncArray[] ) (uint8_t, state_t* const ) = {           // see NOTE#1
    Exe_Off,                                                            // equivalent to "&ExeOff" (& is optional)
    Exe_Init,
    Exe_Error,
    Exe_On,
    Exe_Trip
};


/* FUNCTIONS */

const char* Get_StName( const state_t* const pSt ){                     // function for converting enum from integer to string (see NOTE#2)
    switch( *pSt ){
      case OFF: return "OFF";
      case INIT: return "INIT";
      case ERROR: return "ERROR";
      case ON: return "ON";
      case TRIP: return "TRIP";
      default: return "UNKNOWN";
   }
}

void Exe_Off( uint8_t Arg, state_t* const pSt ){                        // "const" means pointed address cannot be modified inside thiss function (but the pointed value can)
    if( Arg == KEY_START ){
        (*pSt)++;                                                       // equivalent to "*pSt = INIT" here (but depends on members order within enum declaration)
    }
    printf(" OFF | %d >> %s\n",Arg,Get_StName(pSt));                    // print: current state | input argument >> next state
}

void Exe_Init( uint8_t Arg, state_t* const pSt ){
    if( Arg == KEY_START ){
        *pSt = ON;
    } else {
        *pSt = ERROR;
    }
    printf(" INIT | %d >> %s\n",Arg,Get_StName(pSt));
}

void Exe_Error( uint8_t Arg, state_t* const pSt ){
    if( Arg == KEY_RESET ){
        *pSt = OFF;
    }
    printf(" ERROR | %d >> %s\n",Arg,Get_StName(pSt));
}

void Exe_On( uint8_t Arg, state_t* const pSt ){
    if( Arg > TRIP_THR ){
        *pSt = TRIP;
    }
    printf(" ON | %d >> %s\n",Arg,Get_StName(pSt));
}

void Exe_Trip( uint8_t Arg, state_t* const pSt ){
    if( Arg == KEY_RESET ){
        *pSt = ON;
    }
    printf(" TRIP | %d >> %s\n",Arg,Get_StName(pSt));
}

void Exe_SM1( uint8_t Arg ){                                            // state machine #1 (based on switch-case) 
    switch( fsm ){
        case OFF:
            Exe_Off(Arg,&fsm);
            break;
        case INIT:
            Exe_Init(Arg,&fsm);
            break;
        case ERROR:
            Exe_Error(Arg,&fsm);
            break;
        case ON:
            Exe_On(Arg,&fsm);
            break;
        case TRIP:
            Exe_Trip(Arg,&fsm);
            break;
        default:
            printf(" Unknown state detected!\n");
    }
}

void Exe_SM2( uint8_t Arg, state_t* const pSt ){                        // state machine #2 (based on functions-array)
    if( (pSt != NULL) && (StFuncArray[*pSt] != NULL) ){
        StFuncArray[*pSt](Arg,pSt);                                     // to work it must be asured that the states order in enum definition is the same of functions in functions array !!!
    }
}


/* MAIN */

int main( void ){

    uint8_t ArgIn[] = {3, KEY_START, KEY_START, 70, 125, 200};          // input arguments for the state-machine
    uint8_t ArgLen = sizeof(ArgIn);
    uint8_t j;

    printf(" Nstates = %d\n",NSTATES);                                  // returns 5
    printf(" -----\n");
    printf("# SM1 - Switch case\n");

    for( j=0; j<ArgLen; j++ ){
        Exe_SM1(ArgIn[j]);
    }
    printf(" -----\n");
    printf("# SM2 - Functions array\n");

    fsm = OFF;                                                          // reset FSM state
    for( j=0; j<ArgLen; j++ ){
        Exe_SM2(ArgIn[j],&fsm);                                         // see SMs execution results in NOTE#3
    }
    
    return 1;
}


/* NOTES */

// 1. Defining the functions-array as "const" (see "* const StFuncArray[]") tells the compiler/linker to store it into
//    program-memory (otherwise it's stored in data-memory by default), avoiding this way potential pointers corruption
//    in RAM at run-time.

// 2. In the declaration of function "const char* Get_StName( const state_t* const pSt )" there are x3 "const" qualifiers.
//    The 1st one specifies the return value shall not be modified and makes sense ONLY for pointer return types (like here).
//    The others simply mean that both pointed address (3rd) and pointed value (2nd) cannot be modified inside this function
//    (not even by potential other functions invoked inside this one!).

// 3. Expected results for both SM1 and SM2 is:
//    OFF | 3 >> OFF                -> Arg != KEY_START, thus stay in OFF
//    OFF | 211 >> INIT             -> Arg == KEY_START, thus move to INIT
//    INIT | 211 >> ON              -> Arg == KEY_START, thus move to ON
//    ON | 70 >> ON                 -> Arg < TRIP_THR, stay in ON
//    ON | 125 >> ON                -> Arg < TRIP_THR, stay in ON
//    ON | 200 >> TRIP              -> Arg > TRIP_THR, move to TRIP