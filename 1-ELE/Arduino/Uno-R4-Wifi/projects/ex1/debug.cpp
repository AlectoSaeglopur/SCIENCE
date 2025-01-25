/**
 * @file debug.cpp
 * @author Filippo Valmori
 * @date 23/12/2024
 * @brief Debug library
 * 
 * Library containing debug functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "debug.h"



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/


void Debug_PrintClockRegs( void )
{
  static uint16_t cnt = 0;
  Serial.print("\n >>> CLOCK REGS #");
  Serial.println(cnt++, DEC);
  PRINT_REGISTER(R_SYSTEM, SCKDIVCR);
  PRINT_REGISTER(R_SYSTEM, SCKSCR);
  PRINT_REGISTER(R_SYSTEM, HOCOCR);



  
}



/**
 * @brief <i> Function for printing GPT module registers. </i>
 * 
 * @return none
 */
void Debug_PrintTimerRegs( void )
{
  static uint16_t cnt = 0;
  Serial.print("\n >>> TIMER REGS #");
  Serial.println(cnt++, DEC);
  PRINT_REGISTER(R_GPT0, GTWP);
  PRINT_REGISTER(R_GPT0, GTPR);
  PRINT_REGISTER(R_GPT0, GTCR);
  PRINT_REGISTER(R_GPT0, GTUDDTYC);
  PRINT_REGISTER(R_GPT0, GTCNT);
  PRINT_REGISTER(R_GPT0, GTST);
}
