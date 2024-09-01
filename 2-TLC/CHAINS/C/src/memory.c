/**
 * @file memory.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Memory ibrary
 * 
 * Library containing dynamic memory allocation functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "memory.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static error_t AllocateByteStream( byte_stream_t * ioStream, len_t len );
static error_t FreeByteStream( byte_stream_t * ioStream );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief Function for dynamically allocating memory for any type of stream.
 * 
 * @param ioStream : i/o stream whose buffer has to be allocated
 * @param len : buffer length
 * @param size : buffer elementsize [B]
 * 
 * @return error ID
 */
error_t Memory_AllocateStream( void * ioStream, len_t len, size_t size )
{
  error_t retErr = ERR_NONE;
  byte_stream_t * tmpStream;

  if (NULL != ioStream)
  {
    switch(size)
    {
      case sizeof(byte_stream_t):
        tmpStream = (byte_stream_t *) ioStream;
        AllocateByteStream(tmpStream,len);
        break;
      
      default:
        retErr = ERR_INV_STREAM_TYPE;
        break;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for dynamically deallocating memory for any type of stream.
 * 
 * @param ioStream : i/o stream whose buffer has to be deallocated
 * @param size : buffer element size [B]
 * 
 * @return error ID
 */
error_t Memory_FreeStream( void * ioStream, size_t size )
{
  error_t retErr = ERR_NONE;
  byte_stream_t * tmpStream;

  if (NULL != ioStream)
  {
    switch(size)
    {
      case sizeof(byte_stream_t):
        tmpStream = (byte_stream_t *) ioStream;
        FreeByteStream(tmpStream);
        break;
      
      default:
        retErr = ERR_INV_STREAM_TYPE;
        break;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

/**
 * @brief Function for dynamically allocating memory for a byte stream.
 * 
 * @param ioStream : i/o stream whose buffer has to be allocated
 * @param len : buffer length
 * 
 * @return error ID
 */
static error_t AllocateByteStream( byte_stream_t * ioStream, len_t len )
{
  error_t retErr = ERR_NONE;

  if (NULL != ioStream)
  {
    ioStream->pBuf = calloc(len,sizeof(uint8_t));
    if (NULL == ioStream->pBuf)
    {
      retErr = ERR_INV_DYNAMIC_ALLOC;
    }
    else
    {
      ioStream->len = len;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for dynamically deallocating memory for a byte stream.
 * 
 * @param ioStream : i/o stream whose buffer has to be deallocated
 * 
 * @return error ID
 */
static error_t FreeByteStream( byte_stream_t * ioStream )
{
  error_t retErr = ERR_NONE;

  if ((NULL != ioStream) && (NULL != ioStream->pBuf))
  {
    free(ioStream->pBuf);
    ioStream->pBuf = NULL;
    ioStream->len = 0;
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
