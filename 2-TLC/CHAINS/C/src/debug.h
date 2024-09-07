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

#include "channel.h"                                    /** - import channel library */
#include "convolutional.h"                              /** - import convolutional library */
#include "error.h"                                      /** - import error library */
#include "memory.h"                                     /** - import memory library */
#include "modulation.h"                                 /** - import modulation library */
#include "system.h"                                     /** - import system library */



/******************/
/*** PARAMETERS ***/
/******************/

#define PID_NCOLS_BYTE      35u                         //!< Number of byte columns per row to print before wrapping
#define PID_NCOLS_FLOAT     15u                         //!< Number of float columns per row to print before wrapping
#define PID_NCOLS_SYMB      8u                          //!< Number of symbol columns per row to print before wrapping
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
  PID_TX_MAP,                                 /** Tx mapped symbols print-ID */
  PID_RX_MAP,                                 /** Rx mapped symbols print-ID */
  PID_RX_LLR,                                 /** Rx demapped LLRs print-ID */
  // keep NUM as final entry
  PID_NUM
} print_label_t;


typedef struct _debug_par_t
{
  cc_par_t ccPar;
  mod_par_t modPar;
  chan_par_t chanPar;
} debug_par_t;



/******************/
/*** PROTOTYPES ***/
/******************/

error_t Debug_PrintParameters( len_t len );
error_t Debug_ListParameters( debug_par_t * ioParams, const cc_par_t * ccParam, const mod_par_t * modParam, const chan_par_t * chanParam );
error_t Debug_GenerateRandomBytes( byte_stream_t * ioStream, const uint32_t * pSeed );
error_t Debug_PrintByteStream( const byte_stream_t * inStream, print_label_t label, const debug_par_t * dbgParams );
error_t Debug_PrintFloatStream( const float_stream_t * inStream, print_label_t label, const debug_par_t * dbgParams );
error_t Debug_PrintComplexStream( const complex_stream_t * inStream, print_label_t label, const debug_par_t * dbgParams );
error_t Debug_CheckWrongBits( const byte_stream_t * inStreamA, const byte_stream_t * inStreamB, print_label_t label, const debug_par_t * dbgParams );
error_t Debug_WriteBytesToCsv( const byte_stream_t * inStream, print_label_t label );


#endif
