/**
 * @file system.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Dynamic memory allocation library header
 */


#ifndef MEMORY_H
#define MEMORY_H


/****************/
/*** INCLUDES ***/
/****************/


#include "error.h"
#include "system.h"



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  memory_type_byte = 0,                                 /** - byte stream ID */
  memory_type_float,                                    /** - float stream ID */
  memory_type_complex                                   /** - complex stream ID */
} memory_type_t;


typedef struct _byte_stream_t
{
  byte_t * pBuf;                                        /** - buffer pointer */
  len_t len;                                            /** - buffer length [B] */
  memory_type_t id;
} byte_stream_t;


typedef struct _float_stream_t
{
  float * pBuf;                                         /** - buffer pointer */
  len_t len;                                            /** - buffer length [B] */
  memory_type_t id;
} float_stream_t;


typedef struct _complex_stream_t
{
  complex_t * pBuf;                                     /** - buffer pointer */
  len_t len;                                            /** - buffer length [B] */
  memory_type_t id;
} complex_stream_t;



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t Memory_AllocateStream( void * ioStream, len_t len, memory_type_t type );
error_t Memory_FreeStream( void * ioStream, memory_type_t type );


#endif
