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

/**
 * @brief Function for dynamically allocating memory for byte buffer.
 * 
 * @param ioStream : i/o stream whose buffer has to be allocated
 * @param size : buffer size [B]
 * 
 * @return error ID
 */
error_t Memory_AllocateByteBuffer( byte_stream_t * ioStream, len_t size )
{
  error_t retErr = ERR_NONE;

  if (NULL != ioStream)
  {
    ioStream->pBuf = calloc(size,sizeof(uint8_t));
    ioStream->len = size;
    if (NULL == ioStream->pBuf)
    {
      retErr = ERR_INV_DYNAMIC_ALLOC;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for dynamically allocating memory for byte buffer.
 * 
 * @param ioStream : i/o stream whose buffer has to be deallocated
 * 
 * @return error ID
 */
error_t Memory_FreeByteBuffer( byte_stream_t * ioStream )
{
  error_t retErr = ERR_NONE;

  if ((NULL != ioStream) && (NULL != ioStream->pBuf))
  {
    free(ioStream->pBuf);
    ioStream->pBuf = NULL;
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
