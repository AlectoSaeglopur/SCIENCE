/*
 * Library where all test cases are defined (and invoked by main.c).
 */

/** INCLUDES **/

#include "unity\unity.h"

#include "test_modulation.h"

#include "..\src\modulation.h"
#include "..\src\setting.h"



/** PROTOTYPES **/

static void test_GetGray( void );



/** FUNCTIONS **/

/* Main function invoked by umain.c containing all tests withi module. */
int run_modulation_tests(void)
{
    UNITY_BEGIN();                                                                      // always start the test sequence by invoking the BEGIN function
    
    RUN_TEST(test_GetGray);                                                             // run tests on "modulation.c" functions
    
    return UNITY_END();                                                                 // always finish the test sequence by invoking the END function
}

/* Function to check "CountByteOnes" function */
static void test_GetGray( void )
{
  const uint8_t expArray[M] = {0,1,3,2};
  uint8_t actArray[M] = {0};
  GetGray(actArray);
  TEST_ASSERT_EQUAL_UINT8_ARRAY(expArray,actArray,M);
}
