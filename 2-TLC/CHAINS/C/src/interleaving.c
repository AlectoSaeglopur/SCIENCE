/**
 * @file interleaving.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Interleaving library
 * 
 * Library containing interleaving functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "interleaving.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static error_t BlockInterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * ioParams );
static error_t BlockDeinterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for retrieving and listing interleaving parameters into dedicated structure. </i>
 * 
 * @param[in] ioParams pointer to i/o parameters structure to be filled
 * 
 * @return error ID
 */
error_t Intrlv_ListParameters( itlv_par_t * ioParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != ioParams)
  {
    ioParams->type = INTRLV_TYPE;

    if (INTRLV_BLOCK == ioParams->type)
    {
      ioParams->rows = BLK_NROWS;
      ioParams->cols = BLK_NCOLS;
    }
    else if (INTRLV_CONV == ioParams->type)
    {
      ioParams->dlys = CONV_NDLYS;
      ioParams->cells = CONV_NCELLS;
    }
    else
    {
      retErr = ERR_INV_INTERLEAVING_TYPE;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for interleaving. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to interleaving parameters structure
 * 
 * @return error ID
 */
error_t Intrlv_Interleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != pParams)
  {
    switch (pParams->type)
    {
      case INTRLV_BLOCK:
        retErr = BlockInterleaver(inStream,outStream,pParams);
        break;

      case INTRLV_CONV:
////        retErr = ConvolutionalInterleaver(inStream,outStream,pParams);
        break;

      default:
        retErr = ERR_INV_SCRAMBLING_TYPE;
        break;
    }
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for deinterleaving. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to interleaving parameters structure
 * 
 * @return error ID
 */
error_t Intrlv_Deinterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != pParams)
  {
    switch (pParams->type)
    {
      case INTRLV_BLOCK:
        retErr = BlockDeinterleaver(inStream,outStream,pParams);
        break;

      case INTRLV_CONV:
////        retErr = ConvolutionalDeinterleaver(inStream,outStream,pParams);
        break;

      default:
        retErr = ERR_INV_SCRAMBLING_TYPE;
        break;
    }
  }

  return Error_HandleErr(retErr);
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

/**
 * @brief <i> Function for block interleaving.
 *        The matrix is filled column-wise and then emptied row-wise.
 *        In case streams length is larger than R*C, the algorithm is
 *        executed in multiple cycles by filling and emptying the matrix 
 *        completely at each time. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to interleaving parameters structure
 * 
 * @return error ID
 */
static error_t BlockInterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint32_t cycNum = (inStream->len-1)/(pParams->rows*pParams->cols)+1;      /** - number of cycles needed to process input stream */
  uint32_t cycLen;
  uint32_t i, j, k;
  uint8_t curRow;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id))
  {
    if (inStream->len == outStream->len)
    {
      for (k=0; k<cycNum; k++)
      {
        curRow = 0;
        j = 0;

        if (cycNum-1 == k)
        {
          cycLen = inStream->len-k*pParams->rows*pParams->cols;                   /** - number of input elements to be processed during last cycle */
        }
        else
        {
          cycLen = pParams->rows*pParams->cols;
        }

        for (i=0; i<cycLen; i++)
        {
          outStream->pBuf[i+k*pParams->rows*pParams->cols] =
            inStream->pBuf[j+k*pParams->rows*pParams->cols];
          j += pParams->rows;

          if (j >= cycLen)
          {
            curRow += 1;
            j = curRow;
          }
        }
      }
    }
    else
    {
      retErr = ERR_INV_BUFFER_SIZE;
    }
  }
  else
  {
    retErr = ERR_INV_STREAM;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for block deinterleaving.
 *        The the matrix is filled row-wise and then emptied column-wise.
 *        In case streams length is larger than R*C, the algorithm is
 *        executed in multiple cycles by filling and emptying the matrix 
 *        completely at each time. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to interleaving parameters structure
 * 
 * @return error ID
 */
static error_t BlockDeinterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint32_t cycNum = (inStream->len-1)/(pParams->rows*pParams->cols)+1;      /** - number of cycles needed to process input stream */
  const uint32_t misElem = cycNum*pParams->rows*pParams->cols-inStream->len;      /** - number of missing elements to completely fill the matrix during final cycle */
  uint32_t cycLen;
  uint32_t i, j, k;
  uint8_t skipElem[pParams->rows];                                                /** - number of elements to be skipped for each row */
  uint8_t curRow, curCol;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id))
  {
    if (inStream->len == outStream->len)
    {
      memset(skipElem,0,pParams->rows);
      curRow = pParams->rows-1;
      for (k=0; k<misElem; k++)
      {
        skipElem[curRow] += 1;

        if (0 == curRow)
        {
          curRow = pParams->rows-1;
        }
        else
        {
          curRow -= 1;
        }
      }

      for (k=0; k<cycNum; k++)
      {
        curRow = 0;
        curCol = 0;
        j = 0;

        if (cycNum-1 == k)
        {
          cycLen = inStream->len-k*pParams->rows*pParams->cols;                   /** number of input elements to be processed during last cycle */
        }
        else
        {
          cycLen = pParams->rows*pParams->cols;
        }

        for (i=0; i<cycLen; i++)
        {
          outStream->pBuf[i+k*pParams->rows*pParams->cols] = 
            inStream->pBuf[j+k*pParams->rows*pParams->cols];
          j += pParams->cols;

          if (cycNum-1 == k)
          {
            j -= skipElem[curRow];                                                /** update counter in case of missing elements during final cycle */
            curRow += 1;
          }

          if (j >= cycLen)
          {
            curCol += 1;
            j = curCol;
            curRow = 0;
          }
        }
      }
    }
    else
    {
      retErr = ERR_INV_BUFFER_SIZE;
    }
  }
  else
  {
    retErr = ERR_INV_STREAM;
  }

  return Error_HandleErr(retErr);
}
