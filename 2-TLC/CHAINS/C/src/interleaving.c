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
static error_t ConvolutionalInterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams );
static error_t ConvolutionalDeinterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams );



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
 * @brief <i> Function for interleaving byte-streams. </i>
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
        retErr = ConvolutionalInterleaver(inStream,outStream,pParams);
        break;

      default:
        retErr = ERR_INV_SCRAMBLING_TYPE;
        break;
    }
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for deinterleaving byte-streams. </i>
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
        retErr = ConvolutionalDeinterleaver(inStream,outStream,pParams);
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
 * @brief <i> Function for block interleaving byte-streams.
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
  uint8_t rowIdx;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id))
  {
    if (inStream->len == outStream->len)
    {
      for (k=0; k<cycNum; k++)
      {
        rowIdx = 0;
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
            rowIdx += 1;
            j = rowIdx;
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
 * @brief <i> Function for block deinterleaving byte-streams.
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
  uint8_t rowIdx, colIdx;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id))
  {
    if (inStream->len == outStream->len)
    {
      memset(skipElem,0,pParams->rows);
      rowIdx = pParams->rows-1;
      for (k=0; k<misElem; k++)
      {
        skipElem[rowIdx] += 1;

        if (0 == rowIdx)
        {
          rowIdx = pParams->rows-1;
        }
        else
        {
          rowIdx -= 1;
        }
      }

      for (k=0; k<cycNum; k++)
      {
        rowIdx = 0;
        colIdx = 0;
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
            j -= skipElem[rowIdx];                                                /** update counter in case of missing elements during final cycle */
            rowIdx += 1;
          }

          if (j >= cycLen)
          {
            colIdx += 1;
            j = colIdx;
            rowIdx = 0;
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
 * @brief <i> Function for convolutional interleaving byte-streams. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to interleaving parameters structure
 * 
 * @return error ID
 */
static error_t ConvolutionalInterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint16_t shiftRegRows = pParams->dlys-1;
  const uint16_t shiftRegCols = pParams->cells*(pParams->dlys-1);
  uint16_t shiftRegMtx[shiftRegRows][shiftRegCols];                               /** - shift-register matrix */
  uint32_t i, j;
  ulen_t inIdx = 0;                                                               /** - index over input stream buffer */
  ulen_t outIdx = 0;                                                              /** - index over output stream buffer */
  int16_t rowIdx = -1;                                                            /** - row index ("-1" represents the line with no delay) */

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id))
  {
    if (inStream->len == outStream->len)
    {
      for (i=0; i<shiftRegRows; i++)
      {
        for (j=0; j<shiftRegCols; j++)
        {
          shiftRegMtx[i][j] = INTRLV_NAN;                                         /** - initialize shift-register matrix */
        }
      }

      while (inIdx < inStream->len)                                               /** - loop until all input elements are consumed */
      {
        if (-1 == rowIdx)
        {
          outStream->pBuf[outIdx] = inStream->pBuf[inIdx];                        /** - output from no-delay line */
          outIdx += 1;
        }
        else
        {
          if (INTRLV_NAN != shiftRegMtx[rowIdx][pParams->cells*(rowIdx+1)-1])
          {
            outStream->pBuf[outIdx] =
              shiftRegMtx[rowIdx][pParams->cells*(rowIdx+1)-1];                   /** - output from shift-registers */
            outIdx += 1;
          }

          for (j=pParams->cells*(rowIdx+1)-1; j>0; j--)
          {
            shiftRegMtx[rowIdx][j] = shiftRegMtx[rowIdx][j-1];                    /** - update shift-registers (by right-shifting) */
          }
          shiftRegMtx[rowIdx][0] = inStream->pBuf[inIdx];
        }

        inIdx += 1;

        if ((pParams->dlys-2) == rowIdx)
        {
            rowIdx = -1;
        }
        else
        {
          rowIdx += 1;
        }
      }

      if (-1 == rowIdx)
      {
        rowIdx = 0;
      }

      while (outIdx < inStream->len)                                              /** loop until all elements still stored in the shift-register has been completely consumed */
      {
        if (INTRLV_NAN != shiftRegMtx[rowIdx][pParams->cells*(rowIdx+1)-1])
        {
            outStream->pBuf[outIdx] =
              shiftRegMtx[rowIdx][pParams->cells*(rowIdx+1)-1];
            outIdx += 1;
        }

        for (j=pParams->cells*(rowIdx+1)-1; j>0; j--)
        {
          shiftRegMtx[rowIdx][j] = shiftRegMtx[rowIdx][j-1];
        }

        shiftRegMtx[rowIdx][0] = INTRLV_NAN;

        if ((pParams->dlys-2) == rowIdx)
        {
          rowIdx = 0;
        }
        else
        {
          rowIdx += 1;
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
 * @brief <i> Function for convolutional deinterleaving byte-streams. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to interleaving parameters structure
 * 
 * @return error ID
 */
static error_t ConvolutionalDeinterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint16_t shiftRegRows = pParams->dlys-1;
  const uint16_t shiftRegCols = pParams->cells*(pParams->dlys-1);
  uint16_t shiftRegMtx[shiftRegRows][shiftRegCols];                               /** - shift-register matrix */
  uint32_t i, j;
  ulen_t inIdx = 0;                                                               /** - index over input array */
  ulen_t outIdx = 0;                                                              /** - index over output array */
  uint16_t rowIdx = 0;                                                            /** - row index */
  uint16_t colIdx = 0;                                                            /** - column index */

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id))
  {
    if (inStream->len == outStream->len)
    {
      for (i=0; i<shiftRegRows; i++)
      {
        for (j=0; j<shiftRegCols; j++)
        {
          shiftRegMtx[i][j] = INTRLV_NAN;                                         /** - initialize shift-register matrix */
        }
      }

      while (outIdx < inStream->len)
      {
        if ((pParams->dlys-1 == rowIdx) &&
            (rowIdx+pParams->dlys*(colIdx-pParams->cells*rowIdx) < inStream->len))
        {
          outStream->pBuf[outIdx] = inStream->pBuf[inIdx];                        /** - output from no-delay line */
          outIdx += 1;
          inIdx += 1;
        }
        else
        {
          if (INTRLV_NAN != shiftRegMtx[rowIdx][pParams->cells*(pParams->dlys-rowIdx-1)-1])
          {
            outStream->pBuf[outIdx] =
              shiftRegMtx[rowIdx][pParams->cells*(pParams->dlys-rowIdx-1)-1];     /** - output from shift registers */
            outIdx += 1;
          }

          for (j=pParams->cells*(pParams->dlys-rowIdx-1)-1; j>0; j--)
          {
            shiftRegMtx[rowIdx][j] = shiftRegMtx[rowIdx][j-1];                    /** - update shift-registers (by right-shifting) */
          }

          if (rowIdx+pParams->dlys*(colIdx-pParams->cells*rowIdx) < inStream->len)
          {
            shiftRegMtx[rowIdx][0] = inStream->pBuf[inIdx];
            inIdx += 1;
          }
          else
          {
            shiftRegMtx[rowIdx][0] = INTRLV_NAN;
          }
        }

        if (colIdx < pParams->cells*(pParams->dlys-1))                            /** - case for 1st algorithm phase (initial transient) */
        {
          if (rowIdx == colIdx/pParams->cells)
          {
            rowIdx = 0;
            colIdx += 1;
          }
          else
          {
            rowIdx += 1;
          }
        }
        else                                                                      /* - case for 2nd algorithm phase (shift-registers filled) */
        {
          if (pParams->dlys-1 == rowIdx)
          {
            rowIdx = 0;
            colIdx += 1;
          }
          else
          {
            rowIdx += 1;
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
