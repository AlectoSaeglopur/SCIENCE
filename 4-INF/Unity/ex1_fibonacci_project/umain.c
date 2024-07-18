/*
 * Main script to invoke unit tests.
 */

/** INCLUDES **/

#include "stdio.h"
#include "stdint.h"
#include "test_list\test.h"



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


/** MAIN **/

int main( void )
{
    run_fib_tests();                                                            // run tests
//    while (1){};                                                              // do NOT loop
    return 0;
}
