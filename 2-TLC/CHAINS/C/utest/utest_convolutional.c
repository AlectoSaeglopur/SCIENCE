/**
 * @file utest_convolutional.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup UNIT_TEST
 * @brief Unit test convolutional library
 * 
 * Library containing unit test functions for convolutional library.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "unity\unity.h"
#include "utest_convolutional.h"
#include "..\src\convolutional.h"



/** PROTOTYPES **/

static void UnitTest_Convolutional_CountByteOnes( void );



/** FUNCTIONS **/

/* Main function invoked by umain.c containing all tests withi module. */
int UnitTest_Convolutional(void)
{
    UNITY_BEGIN();                                                                      // always start the test sequence by invoking the BEGIN function
    
    RUN_TEST(UnitTest_Convolutional_CountByteOnes);
    
    return UNITY_END();                                                                 // always finish the test sequence by invoking the END function
}

/* Function to check "CountByteOnes" function */
static void UnitTest_Convolutional_CountByteOnes( void )
{
  TEST_ASSERT_EQUAL_UINT8(0, Test_CountByteOnes(0x00));
  TEST_ASSERT_EQUAL_UINT8(5, Test_CountByteOnes(0xAE));
}

