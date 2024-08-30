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

#include "system.h"                                     /** - import system library */



/*************/
/*** ENUMS ***/
/*************/

typedef enum
{
  ERR_NONE = 0,                                       /** - successful error ID */
  ERR_INV_NULL_POINTER,                               /** - invalid null pointer error ID */
  ERR_INV_PRINTID,                                    /** - invalid print label provided error ID */
  ERR_INV_CNVCOD_RATE,                                /** - invalid convolutional coding rate error ID */
  ERR_INV_CNVCOD_KLEN,                                /** - invalid convolutional coding constaint length error ID */
  ERR_INV_BUFFER_SIZE,                                /** - invalid buffer size error ID */
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



/***************/
/*** DEFINES ***/
/***************/

#define ALARM_TYPE          ((alarm_t) ALARM_STOP)



/******************/
/*** PROTOTYPES ***/
/******************/

error_t Error_HandleErr( error_t inErr );


#endif
