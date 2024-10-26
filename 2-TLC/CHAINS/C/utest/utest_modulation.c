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
static void UnitTest_IsQamBpsValid( void );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

int UnitTest_Modulation(void)
{
    UNITY_BEGIN();
    
    RUN_TEST(UnitTest_Modulation_ListParameters);
    RUN_TEST(UnitTest_GetGraySequence);
    RUN_TEST(UnitTest_IsQamBpsValid);
    
    return UNITY_END();
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
  const uint8_t bps = 2;
  const size_t order = BPS2ORDER(bps);
  const mod_par_t params = {.order = order, .bps = bps};
  const uint8_t expArray[] = {0,1,3,2};
  byte_t * actArray = calloc(order,sizeof(byte_t));
  Test_GetGraySequence(actArray,&params);
  TEST_ASSERT_EQUAL_UINT8_ARRAY(expArray,actArray,order);
  free(actArray);
}


static void UnitTest_IsQamBpsValid( void )
{
  TEST_ASSERT_FALSE(Test_IsQamBpsValid(1));
  TEST_ASSERT_TRUE(Test_IsQamBpsValid(2));
  TEST_ASSERT_FALSE(Test_IsQamBpsValid(3));
  TEST_ASSERT_TRUE(Test_IsQamBpsValid(4));
}
