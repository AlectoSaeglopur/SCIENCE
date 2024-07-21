/*
 * Main script to invoke unit tests.
 */

/** INCLUDES **/

#include <stdio.h>
#include <stdint.h>
#include "test_extra.h"
#include "test_convolutional.h"
#include "test_modulation.h"



/** FUNCTIONS **/

/* "Setup" function: print a counter before each test result entry. */
void setUp( void )
{
  static uint16_t Cnt = 0;
  Cnt++;
  printf("#%2d - ",Cnt);
}

/* "Teardown" function: do nothing. */
void tearDown (void)
{
}

/* Custom function used as test result divider */
void print_divider( uint8_t sCnt )
{
  printf("\n\n ### SECTION %d ###\n\n\n",sCnt);
}


/** MAIN **/

int main( void )
{
  uint8_t sCnt = 0;
  print_divider(sCnt++);
  run_extra_tests();                                                          // run tests on "extra.c" functions
  print_divider(sCnt++);
  run_convolutional_tests();                                                  // run tests on "convolutional.c" functions
  print_divider(sCnt++);
  run_modulation_tests();                                                     // run tests on "modulation.c" functions
  //while (1){};                                                              // do NOT loop
    return 0;
}



// cls && gcc umain.c test_list\test_extra.c prj_ut\extra.c test_list\test_convolutional.c test_list\test_modulation.c prj_ut\convolutional.c prj_ut\modulation.c unity_engine\unity.c -o asd && asd


//cls && make all && build\bin\utest.exe