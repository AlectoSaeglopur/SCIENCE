/**
 * @file utest_main.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup UNIT_TEST
 * @brief Unit test main file
 * @addtogroup UNIT_TEST
 * 
 * Main library containing all DVB-S telecommunication chain functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "..\src\system.h"
#include "utest_channel.h"
#include "utest_convolutional.h"
#include "utest_debug.h"
#include "utest_modulation.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static void PrintDivider( const char * name );



/***********************/
/*** UNITY FUNCTIONS ***/
/***********************/

void setUp( void )
{
}


void tearDown (void)
{
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

static void PrintDivider( const char * name )
{
  static uint8_t cnt = 0;

  if (cnt > 0)
  {
    printf("---------------\n");
    printf("---------------\n");
  }
  printf("\n>> LIBRARY # %d: %s\n",cnt++,name);
}



/************/
/*** MAIN ***/
/************/

int main( void )
{
  PrintDivider("CHANNEL");
  UnitTest_Channel();

  PrintDivider("CONVOLUTIONAL");
  UnitTest_Convolutional();

  PrintDivider("DEBUG");
  UnitTest_Debug();

  PrintDivider("MODULATION");
  UnitTest_Modulation();

  //while (1){};                                          // do NOT loop
  return 0;
}
