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

#include "channel.h"
#include "convolutional.h"
#include "error.h"
#include "interleaving.h"
#include "memory.h"
#include "modulation.h"
#include "reed_solomon.h"
#include "scrambling.h"
#include "system.h"



/******************/
/*** PARAMETERS ***/
/******************/

#define PID_NCOLS_BYTE      30u                         //!< Number of byte columns per row to print before wrapping
#define PID_NCOLS_FLOAT     15u                         //!< Number of float columns per row to print before wrapping
#define PID_NCOLS_SYMB      8u                          //!< Number of symbol columns per row to print before wrapping



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  PID_TX_ORG = 0,                                       /** - tx origin bytes print-id */
  PID_RX_ORG,                                           /** - rx origin bytes print-id */
  PID_TX_CRC,                                           /** - tx CRC print-id */
  PID_RX_CRC,                                           /** - rx CRC print-id */
  PID_TX_SCR,                                           /** - tx scrambled bytes print-id */
  PID_RX_SCR,                                           /** - rx scrambled bytes print-id */
  PID_TX_RSCOD,                                         /** - tx reed-solomon coded bytes print-id */
  PID_RX_RSCOD,                                         /** - tx reed-solomon coded bytes print-id */
  PID_TX_INTLV,                                         /** - tx interleaved bytes print-id */
  PID_RX_INTLV,                                         /** - rx interleaved bytes print-id */
  PID_TX_CNVCOD,                                        /** - tx convolution coded bytes print-id */
  PID_RX_CNVCOD,                                        /** - rx convolution coded bytes print-id */
  PID_TX_MAP,                                           /** - tx mapped symbols print-id */
  PID_RX_MAP,                                           /** - rx mapped symbols print-id */
  PID_RX_LLR,                                           /** - rx demapped LLRs print-id */
  // keep NUM as final entry
  PID_NUM
} print_label_t;


typedef struct _debug_par_t
{
  scr_par_t scrPar;
  rs_par_t rsPar;
  itlv_par_t itlvPar;
  cc_par_t ccPar;
  mod_par_t modPar;
  chan_par_t chanPar;
} debug_par_t;


typedef enum _wm_level_t
{
  WM_LEVEL_1 = 0,
  WM_LEVEL_2,
  // keep NUM as final entry
  WM_LEVEL_NUM
} wm_level_t;



/*****************/
/*** CONSTANTS ***/
/*****************/

#define watermark_t         uint32_t
#define WATERMARK_MASK      ((watermark_t)0x0000FFFF)



/******************/
/*** PROTOTYPES ***/
/******************/

error_t Debug_PrintParameters( ulen_t orgLen, const debug_par_t * pParams );
error_t Debug_ListParameters( debug_par_t * ioParams, const scr_par_t * scrParam, const rs_par_t * rsParam, const itlv_par_t * itlvParam, const cc_par_t * ccParam, const mod_par_t * modParam, const chan_par_t * chanParam );
error_t Debug_GenerateRandomBytes( byte_stream_t * ioStream, const uint32_t * pSeed );
error_t Debug_PrintByteStream( const byte_stream_t * inStream, print_label_t label, const debug_par_t * pParams );
error_t Debug_PrintFloatStream( const float_stream_t * inStream, print_label_t label, const debug_par_t * pParams );
error_t Debug_PrintComplexStream( const complex_stream_t * inStream, print_label_t label, const debug_par_t * pParams );
error_t Debug_CheckWrongBits( const byte_stream_t * inStreamA, const byte_stream_t * inStreamB, print_label_t label, const debug_par_t * pParams );
error_t Debug_WriteByteStreamToCsv( const byte_stream_t * inStream, print_label_t label );
error_t Debug_WriteComplexStreamToCsv( const complex_stream_t * inStream, print_label_t label );
error_t Debug_SetWatermark( void * funcAddr, wm_level_t level );
void Debug_PrintWatermarks(void);


#endif
