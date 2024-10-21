/*
 * Library where all test cases are defined (and invoked by main.c).
 */

/** INCLUDES **/

#include "unity\unity.h"
#include "utest_modulation.h"
#include "..\src\modulation.h"



/** PROTOTYPES **/

static void utest_Modulation_ListParameters( void );



/** FUNCTIONS **/

/* Main function invoked by umain.c containing all tests withi module. */
int run_modulation_tests(void)
{
    UNITY_BEGIN();                                                                      // always start the test sequence by invoking the BEGIN function
    
    RUN_TEST(utest_Modulation_ListParameters);
    
    return UNITY_END();                                                                 // always finish the test sequence by invoking the END function
}

/* Function to check "CountByteOnes" function */
//static void test_GetGray( void )
//{
//  const uint8_t expArray[M] = {0,1,3,2};
//  uint8_t actArray[M] = {0};
//  GetGray(actArray);
//  TEST_ASSERT_EQUAL_UINT8_ARRAY(expArray,actArray,M);
//}


static void utest_Modulation_ListParameters( void )
{
  error_t retErr = ERR_NONE;
  mod_par_t * pParams = NULL;
  retErr = Modulation_ListParameters(pParams);
  TEST_ASSERT_EQUAL_UINT8(ERR_INV_NULL_POINTER,retErr);
}


//static void utest_GetGraySequence( void )
//{
//  mod_par_t params = {.order = 4, .bps = 2};
//  byte_t ioBuffer[4] = {0};
//
//  GetGraySequence(ioBuffer,&params);
//}
