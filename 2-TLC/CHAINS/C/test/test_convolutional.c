/*
 * Library where all test cases are defined (and invoked by main.c).
 */

/** INCLUDES **/

#include "unity\unity.h"

#include "test_convolutional.h"

#include "..\src\convolutional.h"
#include "..\src\setting.h"



/** PROTOTYPES **/

static void test_CountByteOnes( void );



/** FUNCTIONS **/

/* Main function invoked by umain.c containing all tests withi module. */
int run_convolutional_tests(void)
{
    UNITY_BEGIN();                                                                      // always start the test sequence by invoking the BEGIN function
    
    RUN_TEST(test_CountByteOnes);                                                       // run tests on "convolutional.c" functions
    
    return UNITY_END();                                                                 // always finish the test sequence by invoking the END function
}

/* Function to check "CountByteOnes" function */
static void test_CountByteOnes( void )
{
  TEST_ASSERT_EQUAL_UINT8(0, CountByteOnes(0x00));
  TEST_ASSERT_EQUAL_UINT8(2, CountByteOnes(0x81));
  TEST_ASSERT_EQUAL_UINT8(5, CountByteOnes(0xAE));
  TEST_ASSERT_EQUAL_UINT8(8, CountByteOnes(0xFF));
}

