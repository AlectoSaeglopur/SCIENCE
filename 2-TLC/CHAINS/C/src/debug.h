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

#include "convolutional.h"                              /** - import convolutional library */
#include "error.h"                                      /** - import error library */
#include "memory.h"                                     /** - import memory library */
#include "modulation.h"                                 /** - import modulation library */
#include "system.h"                                     /** - import system library */



/******************/
/*** PARAMETERS ***/
/******************/

#define PID_NCOLS           20u                         //!< Number of columns per row to print before wrapping
#define IS_CSV_ENABLED      (false)



/****************/
/*** TYPEDEFS ***/
/****************/

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
error_t Debug_GenerateRandomBytes( byte_stream_t * ioStream, const uint32_t * pSeed );
error_t Debug_PrintBytes( const byte_stream_t * inStream, print_label_t label );
error_t Debug_CheckWrongBits( const byte_stream_t * inStreamA, const byte_stream_t * inStreamB, print_label_t label );
error_t Debug_WriteBytesToCsv( const byte_stream_t * inStream, print_label_t label );


#endif
