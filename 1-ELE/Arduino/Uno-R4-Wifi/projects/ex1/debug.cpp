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
  PRINT_REGISTER(R_GPT3, GTWP);
  PRINT_REGISTER(R_GPT3, GTPR);
  PRINT_REGISTER(R_GPT3, GTCR);
  PRINT_REGISTER(R_GPT3, GTUDDTYC);
  PRINT_REGISTER(R_GPT3, GTCNT);
  PRINT_REGISTER(R_GPT3, GTST);
}
