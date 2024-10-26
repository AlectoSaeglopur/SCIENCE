/**
 * @file utest_debug.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup UNIT_TEST
 * @brief Unit test extra library
 * 
 * Library containing unit test functions for debug library.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "unity\unity.h"
#include "utest_debug.h"
#include "..\src\debug.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static void UnitTest_Debug_CheckWrongBits( void );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

int UnitTest_Debug(void)
{
    UNITY_BEGIN();
    
    RUN_TEST(UnitTest_Debug_CheckWrongBits);
    
    return UNITY_END();
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

static void UnitTest_Debug_CheckWrongBits( void )
{
  debug_par_t dummyPar;
  ulen_t bitErr = 0xFFFF;

  ulen_t arrayLen = 5;
  byte_t array1[] = {0x01, 0x22, 0x40, 0xFF, 0x92};
  byte_t array2[] = {0x01, 0x22, 0x40, 0xFF, 0x92};
  byte_stream_t stream1 = {.len = arrayLen, .pBuf = array1, .id = memory_type_byte};
  byte_stream_t stream2 = {.len = arrayLen, .pBuf = array2, .id = memory_type_byte};
  Debug_CheckWrongBits(&stream1,&stream2,PID_INVALID,&dummyPar,&bitErr);
  TEST_ASSERT_TRUE((0 == bitErr));

  byte_t array3[] = {0x91, 0xA2, 0x40, 0xFE, 0x83};
  byte_stream_t stream3 = {.len = arrayLen, .pBuf = array3, .id = memory_type_byte};
  Debug_CheckWrongBits(&stream1,&stream3,PID_INVALID,&dummyPar,&bitErr);
  TEST_ASSERT_TRUE((6 == bitErr));

  error_t retErr = ERR_NONE;
  arrayLen = 3;
  byte_t array4[] = {0xAA, 0xBB, 0xCC};
  byte_stream_t stream4 = {.len = arrayLen, .pBuf = array4, .id = memory_type_byte};
  retErr = Debug_CheckWrongBits(&stream1,&stream4,PID_INVALID,&dummyPar,&bitErr);
  TEST_ASSERT_EQUAL_UINT8(ERR_INV_BUFFER_SIZE,retErr);
}
