/**
 * @file utest_modulation.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup UNIT_TEST
 * @brief Unit test modulation library
 * 
 * Library containing unit test functions for modulation library.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "unity\unity.h"
#include "utest_modulation.h"
#include "..\src\modulation.h"



/***************/
/*** DEFINES ***/
/***************/

#define BPS2ORDER(x)      (0x01<<(x))



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static void UnitTest_Modulation_ListParameters( void );
static void UnitTest_GetGraySequence( void );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/* Main function invoked by umain.c containing all tests withi module. */
int RunTestModulation(void)
{
    UNITY_BEGIN();                                                                      // always start the test sequence by invoking the BEGIN function
    
    RUN_TEST(UnitTest_Modulation_ListParameters);
    RUN_TEST(UnitTest_GetGraySequence);
    
    return UNITY_END();                                                                 // always finish the test sequence by invoking the END function
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

static void UnitTest_Modulation_ListParameters( void )
{
  error_t retErr = ERR_NONE;
  mod_par_t * pParams = NULL;
  retErr = Modulation_ListParameters(pParams);
  TEST_ASSERT_EQUAL_UINT8(ERR_INV_NULL_POINTER,retErr);
}


static void UnitTest_GetGraySequence( void )
{
  const uint8_t Bps = 2;
  const size_t Order = BPS2ORDER(Bps);
  const mod_par_t params = {.order = Order, .bps = Bps};
  const uint8_t expArray[] = {0,1,3,2};
  byte_t * actArray = calloc(Order,sizeof(byte_t));
  Test_GetGraySequence(actArray,&params);
  TEST_ASSERT_EQUAL_UINT8_ARRAY(expArray,actArray,Order);
  free(actArray);
}
