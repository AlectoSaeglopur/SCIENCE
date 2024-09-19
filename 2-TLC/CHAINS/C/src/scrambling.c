/**
 * @file scrambling.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Scrambling library
 * 
 * Library containing scrambling functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "scrambling.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static error_t Scramb_AdditiveScrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams );
static error_t Scramb_AdditiveDescrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams );
static error_t Scramb_MultiplicativeScrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams );
static error_t Scramb_MultiplicativeDescrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams );
static uint8_t ComputeRegBit( uint32_t curSt, const scramb_par_t * pParams );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for retrieving and listing scrambling parameters into dedicated structure. </i>
 * 
 * @param[in] ioParams pointer to i/o parameters structure to be filled
 * 
 * @return error ID
 */
error_t Scramb_ListParameters( scramb_par_t * ioParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != ioParams)
  {
    ioParams->type = SCRAMB_TYPE;

    if (SCRAMB_ADT == ioParams->type)
    {
      ioParams->nCells = NCELLS_ADT;
      ioParams->conVect = CONVECT_ADT;
      ioParams->initSt = INITST_ADT;
    }
    else if (SCRAMB_MLT == ioParams->type)
    {
      ioParams->nCells = NCELLS_MLT;
      ioParams->conVect = CONVECT_MLT;
      ioParams->initSt = INITST_MLT;
    }
    else
    {
      retErr = ERR_INV_SCRAMBLING_TYPE;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for scrambling. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to scrambling parameters structure
 * 
 * @return error ID
 */
error_t Scramb_Scrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != pParams)
  {
    switch (pParams->type)
    {
      case SCRAMB_ADT:
        retErr = Scramb_AdditiveScrambler(inStream,outStream,pParams);
        break;

      case SCRAMB_MLT:
        retErr = Scramb_MultiplicativeScrambler(inStream,outStream,pParams);
        break;

      default:
        retErr = ERR_INV_SCRAMBLING_TYPE;
        break;
    }
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for descrambling. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to scrambling parameters structure
 * 
 * @return error ID
 */
error_t Scramb_Descrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != pParams)
  {
    switch (pParams->type)
    {
      case SCRAMB_ADT:
        retErr = Scramb_AdditiveDescrambler(inStream,outStream,pParams);
        break;

      case SCRAMB_MLT:
        retErr = Scramb_MultiplicativeDescrambler(inStream,outStream,pParams);
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
 * @brief <i> Function for additive (aka synchronous) scrambling. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to scrambling parameters structure
 * 
 * @return error ID
 */
static error_t Scramb_AdditiveScrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const ulen_t bitLen = BY2BI_LEN(inStream->len);
  ulen_t byteIdx;
  ulen_t j;
  uint32_t lfsrSt = pParams->initSt;
  uint8_t scrBit;
  uint8_t bitIdx;
  
  if ((NULL != inStream) && (NULL != outStream) && (NULL != pParams))
  {
    if (inStream->len == outStream->len)
    {
      memcpy(outStream->pBuf,inStream->pBuf,inStream->len);

      for (j=0; j<bitLen; j++)
      {
        byteIdx = BI2BY_LEN(j);
        bitIdx = (uint8_t)(BITIDX_1LAST-(j&LSBYTE_MASK_U32));
        scrBit = ComputeRegBit(lfsrSt,pParams);                             /** - bit outgoing from shift register connections */
        lfsrSt >>= 1;                                                       /** - update scrambler shift register */
    
        if (1 == scrBit)
        {
          lfsrSt |= MSBIT_MASK_U32;                                         /** - update content of shift register's first cell */
          scrBit ^= (outStream->pBuf[byteIdx]>>bitIdx) & LSBIT_MASK_U8;     /** - compute output bit at j-th cycle */
    
          if (scrBit)
          {
            outStream->pBuf[byteIdx] |= (LSBIT_MASK_U8<<bitIdx);            /** - write the the output bit into output stream */
          }
          else
          {
            outStream->pBuf[byteIdx] &= ~(LSBIT_MASK_U8<<bitIdx);
          }
        }
        else
        {
          lfsrSt &= (~MSBIT_MASK_U32);
          scrBit ^= (outStream->pBuf[byteIdx]>>bitIdx) & LSBIT_MASK_U8;

          if (scrBit)
          {
            outStream->pBuf[byteIdx] |= (LSBIT_MASK_U8<<bitIdx);
          }
          else
          {
            outStream->pBuf[byteIdx] &= ~(LSBIT_MASK_U8<<bitIdx);
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
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for additive (aka synchronous) descrambling. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to scrambling parameters structure
 * 
 * @return error ID
 */
static error_t Scramb_AdditiveDescrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams )
{
  return Scramb_AdditiveScrambler(inStream,outStream,pParams);
}


/**
 * @brief <i> Function for multiplicative (aka self-synchronizing) scrambling. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to scrambling parameters structure
 * 
 * @return error ID
 */
static error_t Scramb_MultiplicativeScrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const ulen_t bitLen = BY2BI_LEN(inStream->len);
  ulen_t byteIdx;
  ulen_t j;
  uint32_t lfsrSt = pParams->initSt;
  uint8_t inBit, outBit;
  uint8_t bitIdx;
  
  if ((NULL != inStream) && (NULL != outStream) && (NULL != pParams))
  {
    if (inStream->len == outStream->len)
    {
      memcpy(outStream->pBuf,inStream->pBuf,inStream->len);

      for (j=0; j<bitLen; j++)
      {
        byteIdx = BI2BY_LEN(j);
        bitIdx = (uint8_t)(BITIDX_1LAST-(j&LSBYTE_MASK_U32));
        inBit = ((inStream->pBuf[byteIdx]>>bitIdx)&LSBIT_MASK_U8);          /** - input bit at j-th cycle */
        outBit = ComputeRegBit(lfsrSt,pParams)^inBit;                       /** - output bit at j-th cycle */
        lfsrSt >>= 1;                                                       /** - right-shift the LFSR */
    
        if (1 == outBit)
        {                          
          lfsrSt |= MSBIT_MASK_U32;                                         /** - update content of LFSR first's cell to '1' */
          outStream->pBuf[byteIdx] |= (LSBIT_MASK_U8<<bitIdx);              /** - write the output bit into the I/O stream */
        }
        else
        {
          lfsrSt &= (~MSBIT_MASK_U32);                                      /** - update content of LFSR's first cell to '0' */
          outStream->pBuf[byteIdx] &= ~(LSBIT_MASK_U8<<bitIdx);
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
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for multiplicative (aka self-synchronizing) descrambling. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to scrambling parameters structure
 * 
 * @return error ID
 */
static error_t Scramb_MultiplicativeDescrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scramb_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const ulen_t bitLen = BY2BI_LEN(inStream->len);
  ulen_t byteIdx;
  ulen_t j;
  uint32_t lfsrSt = pParams->initSt;
  uint8_t inBit, outBit;
  uint8_t bitIdx;
  
  if ((NULL != inStream) && (NULL != outStream) && (NULL != pParams))
  {
    if (inStream->len == outStream->len)
    {
      memcpy(outStream->pBuf,inStream->pBuf,inStream->len);

      for (j=0; j<bitLen; j++)
      {
        byteIdx = BI2BY_LEN(j);
        bitIdx = (uint8_t)(BITIDX_1LAST-(j&LSBYTE_MASK_U32));
        inBit = ((inStream->pBuf[byteIdx]>>bitIdx)&LSBIT_MASK_U8);
        outBit = ComputeRegBit(lfsrSt,pParams)^inBit;
        lfsrSt >>= 1;

        if (1 == outBit)
        {
          outStream->pBuf[byteIdx] |= (LSBIT_MASK_U8<<bitIdx);
        }
        else
        {
          outStream->pBuf[byteIdx] &= ~(LSBIT_MASK_U8<<bitIdx);
        }

        if (1 == inBit)
        {
          lfsrSt |= MSBIT_MASK_U32;                                         /** update content of the LFSR's first cell to '1' */
        }
        else
        {
          lfsrSt &= (~MSBIT_MASK_U32);                                      /** Update content of the LFSR's first cell to '0' */
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
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for computing the shift-register output bit at j-th cycle. </i>
 * 
 * @param[in] curSt current LFSR state
 * 
 * @return LFSR output bit
 */
static uint8_t ComputeRegBit( uint32_t curSt, const scramb_par_t * pParams )
{
  uint8_t j;
  uint8_t outBit = 0;

  for (j=0; j<pParams->nCells; j++)
  {
    if (((curSt<<j)&MSBIT_MASK_U32) & ((pParams->conVect<<j)&MSBIT_MASK_U32))
    {
      outBit ^= LSBIT_MASK_U8;
    }
  }
  
  return outBit;
}
