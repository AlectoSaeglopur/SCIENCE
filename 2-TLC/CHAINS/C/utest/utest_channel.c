/**
 * @file utest_channel.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup UNIT_TEST
 * @brief Unit test channel library
 * 
 * Library containing unit test functions for channel library.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "unity\unity.h"
#include "utest_channel.h"
#include "..\src\channel.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static void UnitTest_GetComplexSgnPower( void );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

int UnitTest_Channel(void)
{
    UNITY_BEGIN();
    
    RUN_TEST(UnitTest_GetComplexSgnPower);
    
    return UNITY_END();
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

static void UnitTest_GetComplexSgnPower( void )
{
  float actPower = -1.0;
  const float tolerance = 0.001;
  const ulen_t waveLen = 3;
  const float waveAmp = 17.2;
  const float expPower = 2*waveAmp*waveAmp;                   // do NOT change (assuming constant waveform)
  complex_t wave[] =
  {
    {.re = waveAmp, .im = waveAmp},
    {.re = waveAmp, .im = waveAmp},
    {.re = waveAmp, .im = waveAmp}
  };
  complex_stream_t stream = {.len = waveLen, .pBuf = wave, .id = memory_type_complex};
  actPower = Test_GetComplexSgnPower(&stream);
  TEST_ASSERT_FLOAT_WITHIN(tolerance,expPower,actPower);
}
