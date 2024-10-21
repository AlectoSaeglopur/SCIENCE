/*
 * Library where all test cases are defined (and invoked by main.c).
 */

/** INCLUDES **/

#include "unity\unity.h"

#include "test_extra.h"

#include "..\src\extra.h"
#include "..\src\setting.h"



/** PROTOTYPES **/

static void test_CheckWrongBits_equal( void );
static void test_CheckWrongBits_diff( void );
static void test_GetCpxSgnPower_const( void );



/** FUNCTIONS **/

/* Main function invoked by umain.c containing all tests withi module. */
int run_extra_tests(void)
{
    UNITY_BEGIN();                                                                      // always start the test sequence by invoking the BEGIN function
    
    RUN_TEST(test_CheckWrongBits_equal);                                                // run tests on "extra.c" functions
    RUN_TEST(test_CheckWrongBits_diff);
    RUN_TEST(test_GetCpxSgnPower_const);
    
    return UNITY_END();                                                                 // always finish the test sequence by invoking the END function
}

/* Function to check "CheckWrongBits" function with identical inputs */
static void test_CheckWrongBits_equal( void )
{
  #define LEN_CHECKWRONGBITS_EQUAL 5
  uint8_t Stream1[LEN_CHECKWRONGBITS_EQUAL] = {1, 22, 40, 92, 5};
  uint8_t Stream2[LEN_CHECKWRONGBITS_EQUAL] = {1, 22, 40, 92, 5};
  TEST_ASSERT_TRUE(CheckWrongBits(Stream1, Stream2, LEN_CHECKWRONGBITS_EQUAL, PRID_INVALID));
}

/* Function to check "CheckWrongBits" function with different inputs */
static void test_CheckWrongBits_diff( void )
{
  #define LEN_CHECKWRONGBITS_DIFF 5
  uint8_t Stream1[LEN_CHECKWRONGBITS_DIFF] = {1, 22, 40, 92, 5};
  uint8_t Stream2[LEN_CHECKWRONGBITS_DIFF] = {1, 22, 43, 92, 5};
  TEST_ASSERT_FALSE(CheckWrongBits(Stream1, Stream2, LEN_CHECKWRONGBITS_DIFF, PRID_INVALID));
}

/* Function to check "GetCpxSgnPower" function with constant waveform input */
static void test_GetCpxSgnPower_const( void )
{
  #define LEN_GETCPXSGNPOWER_CONST 3
  #define AMP_GETCPXSGNPOWER_CONST 13.2
  #define TOL_GETCPXSGNPOWER_CONST 0.001
  complex Stream[LEN_GETCPXSGNPOWER_CONST] = {
    {.Re=AMP_GETCPXSGNPOWER_CONST,.Im=AMP_GETCPXSGNPOWER_CONST},
    {.Re=AMP_GETCPXSGNPOWER_CONST,.Im=AMP_GETCPXSGNPOWER_CONST},
    {.Re=AMP_GETCPXSGNPOWER_CONST,.Im=AMP_GETCPXSGNPOWER_CONST}};
    TEST_ASSERT_FLOAT_WITHIN(TOL_GETCPXSGNPOWER_CONST, 2*AMP_GETCPXSGNPOWER_CONST*AMP_GETCPXSGNPOWER_CONST, GetCpxSgnPower(Stream,LEN_GETCPXSGNPOWER_CONST));
}
