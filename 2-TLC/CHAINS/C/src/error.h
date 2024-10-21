/**
 * @file error.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup TLC_CHAIN
 * @brief Error handling library header
 */


#ifndef ERROR_H
#define ERROR_H


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  ERR_NONE                    = 0,                    /** - successful error ID */
  ERR_INV_NULL_POINTER        = 1,                    /** - invalid null pointer error ID */
  ERR_INV_ORIG_LEN            = 2,                    /** - invalid origin byte-stream length error ID */
  ERR_INV_PRINTID             = 3,                    /** - invalid print label provided error ID */
  ERR_INV_CNVCOD_RATE         = 4,                    /** - invalid convolutional coding rate error ID */
  ERR_INV_CNVCOD_KLEN         = 5,                    /** - invalid convolutional coding constaint length error ID */
  ERR_INV_CNVCOD_DECMET       = 6,                    /** - invalid convolutional coding decoding method error ID */
  ERR_INV_BUFFER_SIZE         = 7,                    /** - invalid buffer size error ID */
  ERR_INV_DYNAMIC_ALLOC       = 8,                    /** - invalid dynamic memory allocation error ID */
  ERR_INV_STREAM_TYPE         = 9,                    /** - invalid stream type error ID */
  ERR_INV_MODULATION_TYPE     = 10,                   /** - invalid modulation type error ID */
  ERR_INV_MODULATION_BPS      = 11,                   /** - invalid modulation BPS error ID */
  ERR_INV_CHANNEL_TYPE        = 12,                   /** - invalid channel type error ID */
  ERR_INV_SCRAMBLING_TYPE     = 13,                   /** - invalid scrambling type error ID */
  ERR_INV_CRC_DEGREE          = 14,                   /** - invalid crc degree error ID */
  ERR_INV_RS_GF_DEGREE        = 15,                   /** - invalid reed-solomon galois field degree error ID */
  ERR_INV_RS_MSG_CW_LEN       = 16,                   /** - invalid reed-solomon message or codeword length error ID */
  ERR_INV_WATERMARK_LEV       = 17,                   /** - invalid watermark level error ID */
  ERR_INV_INTERLEAVING_TYPE   = 18,                   /** - invalid interleaving type error ID */
  ERR_INV_STREAM              = 19,                   /** - invalid stream error ID */
  // keep NUM as final entry
  ERR_NUM
} error_t;


typedef enum
{
  ALARM_NONE = 0,                                     /** - no alarm ID */
  ALARM_PRINT,                                        /** - print on terminal alarm ID */
  ALARM_STOP,                                         /** - stop execution alarm ID */
  // keep NUM as final entry
  ALARM_NUM
} alarm_t;



/******************/
/*** PARAMETERS ***/
/******************/

#ifdef UTEST
  #define ALARM_TYPE          ALARM_NONE
#else
  #define ALARM_TYPE          ALARM_STOP
#endif



/******************/
/*** PROTOTYPES ***/
/******************/

error_t Error_HandleErr( error_t inErr );


#endif
