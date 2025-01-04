
#ifndef DEBUG_H
#define DEBUG_H


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



/***************/
/*** DEFINES ***/
/***************/

#define PRINT_REGISTER(MODULE, REGISTER)  \
  do {                                    \
    uint32_t reg = MODULE->REGISTER;      \
    Serial.print(#REGISTER " : 0x");      \
    Serial.println(reg, HEX);             \
  } while (false)



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

void Debug_PrintClockRegs( void );
void Debug_PrintTimerRegs( void );


#endif
