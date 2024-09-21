/**
 * @file error.h
 * @author Filippo Valmori
 * @date 26/08/2024
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
  ERR_NONE = 0,                                       /** - successful error ID */
  ERR_INV_NULL_POINTER,                               /** - invalid null pointer error ID */
  ERR_INV_PRINTID,                                    /** - invalid print label provided error ID */
  ERR_INV_CNVCOD_RATE,                                /** - invalid convolutional coding rate error ID */
  ERR_INV_CNVCOD_KLEN,                                /** - invalid convolutional coding constaint length error ID */
  ERR_INV_CNVCOD_DECMET,                              /** - invalid convolutional coding decoding method error ID */
  ERR_INV_BUFFER_SIZE,                                /** - invalid buffer size error ID */
  ERR_INV_DYNAMIC_ALLOC,                              /** - invalid dynamic memory allocation error ID */
  ERR_INV_STREAM_TYPE,                                /** - invalid stream type error ID */
  ERR_INV_MODULATION_TYPE,                            /** - invalid modulation type error ID */
  ERR_INV_MODULATION_BPS,                             /** - invalid modulation BPS error ID */
  ERR_INV_CHANNEL_TYPE,                               /** - invalid channel type error ID */
  ERR_INV_SCRAMBLING_TYPE,                            /** - invalid scrambling type error ID */
  ERR_INV_CRC_DEGREE,                                 /** - invalid crc degree error ID */
  ERR_INV_RS_GF_DEGREE,                               /** - invalid reed-solomon galois field degree error ID */
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

#define ALARM_TYPE          ALARM_STOP



/******************/
/*** PROTOTYPES ***/
/******************/

error_t Error_HandleErr( error_t inErr );


#endif
