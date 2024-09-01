/**
 * @file system.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Memory allocation library header
 */


#ifndef MEMORY_H
#define MEMORY_H


/****************/
/*** INCLUDES ***/
/****************/


#include "error.h"
#include "system.h"                                     /** - import system library */



/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct _byte_stream_t
{
  uint8_t * pBuf;                                       /** - buffer pointer */
  len_t len;                                            /** - buffer length [B] */
} byte_stream_t;



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t Memory_AllocateStream( void * ioStream, len_t len, size_t size );
error_t Memory_FreeStream( void * ioStream, size_t size );


#endif
