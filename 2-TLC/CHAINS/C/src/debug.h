/**
 * @file debug.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Debug library header
 */


#ifndef DEBUG_H
#define DEBUG_H


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"                                      /** - import error library */
#include "system.h"                                     /** - import system library */



/***************/
/*** DEFINES ***/
/***************/

#define PID_NCOLS           20u                         //!< Number of columns per row to print before wrapping

#define IS_CSV_ENABLED      (false)



/*************/
/*** ENUMS ***/
/*************/

typedef enum
{
  PID_TX_SRC = 0,                             /** Tx source bytes print-ID */
  PID_RX_SRC,                                 /** Rx source bytes print-ID */
  PID_TX_CNVCOD,                              /** Tx convolution coded bytes print-ID */
  PID_RX_CNVCOD,                              /** Rx convolution coded bytes print-ID */
  // keep NUM as final entry
  PID_NUM
} print_label_t;



/******************/
/*** PROTOTYPES ***/
/******************/

error_t Debug_PrintParameters( len_t len );
error_t Debug_GenerateRandomBytes( uint8_t * ioBuffer, len_t len, const uint32_t * pSeed );
error_t Debug_PrintBytes( const uint8_t * inBuffer, len_t len, print_label_t label );
error_t Debug_CheckWrongBits( const uint8_t * inBufferA, const uint8_t * inBufferB, len_t byteLen, print_label_t label );
error_t Debug_WriteBytesToCsv( const uint8_t * inBuffer, len_t len, print_label_t label );


#endif
