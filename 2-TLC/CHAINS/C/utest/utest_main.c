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
#include "utest_convolutional.h"
#include "utest_modulation.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static void print_divider( char * name );



/***********************/
/*** UNITY FUNCTIONS ***/
/***********************/

/* "Setup" function: print a counter before each test result entry. */
void setUp( void )
{
}

/* "Teardown" function: do nothing. */
void tearDown (void)
{
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

/* Custom function used as test result divider */
static void print_divider( char * name )
{
  static uint8_t cnt = 0;

  if (cnt > 0)
  {
    printf("----------\n");
    printf("----------\n");
  }
  printf("\n>> LIBRARY # %d: %s\n",cnt++,name);
}



/************/
/*** MAIN ***/
/************/

int main( void )
{
  print_divider("CONVOLUTIONAL");
  UnitTest_Convolutional();
  print_divider("MODULATION");
  RunTestModulation();

  //while (1){};                                                  // do NOT loop
  return 0;
}
