
#ifndef DEBUG_H
#define DEBUG_H


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



/***************/
/*** DEFINES ***/
/***************/

#define PRINT_REGISTER(BUCKET, REGISTER)  \
  do {                                    \
    uint32_t t = BUCKET->REGISTER;        \
    Serial.print(#REGISTER " : 0x");      \
    Serial.println(t, HEX);               \
  } while (false)



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

void Debug_PrintRegistersGTP( void );


#endif
