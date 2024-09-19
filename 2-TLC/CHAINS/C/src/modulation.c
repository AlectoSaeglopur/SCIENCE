/**
 * @file modulation.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Modulation library
 * 
 * Library containing modulation functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "modulation.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static bool IsQamBpsValid( uint8_t bps );
static error_t GetMappingTable( mod_maptable_t * ioTable, const mod_par_t * pParams );
static error_t GetPskTable( mod_maptable_t * ioTable, const mod_par_t * pParams );
static error_t GetQamTable( mod_maptable_t * ioTable, const mod_par_t * pParams );
static error_t GetGraySequence( byte_t * ioBuffer, const mod_par_t * pParams );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for retrieving and listing modulation parameters into dedicated structure. </i>
 * 
 * @param[out] ioParams pointer to i/o parameters structure to be filled
 * 
 * @return error ID
 */
error_t Modulation_ListParameters( mod_par_t * ioParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != ioParams)
  {
    ioParams->type = MOD_TYPE;
    ioParams->order = MOD_ORDER;
    ioParams->bps = MOD_BPS;
    ioParams ->phOfst = MATH_PI/MOD_ORDER;
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for byte to complex symbol stream mapping. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to modulation parameters structure
 * 
 * @return error ID
 */
error_t Modulation_Mapper( const byte_stream_t * inStream, complex_stream_t * outStream, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  mod_maptable_t mapTable;
  const ulen_t inLenBi = BY2BI_LEN(inStream->len);
  ulen_t j = 0;
  ulen_t byteIdx;
  uint8_t curBits = 0;
  uint8_t symbIdx = 0;
  uint8_t bitIdx;
  uint8_t i;

  if ((NULL != inStream) && (NULL != outStream) && (NULL != pParams))
  {
    GetMappingTable(&mapTable,pParams);

    while (j < inLenBi)
    {
      symbIdx++;
      byteIdx = BI2BY_LEN(j);
      bitIdx = (uint8_t)(BITIDX_1LAST-(j&LSBYTE_MASK_U32));
      curBits |= ((inStream->pBuf[byteIdx]>>bitIdx)&LSBIT_MASK_U8)<<(pParams->bps-symbIdx);
      if (pParams->bps == symbIdx)
      {
        for (i=0; i<pParams->order; i++)
        {
          if (mapTable.bits[i] == curBits)
          {
            outStream->pBuf[(j+1)/pParams->bps-1] = mapTable.symbs[i];
            break;
          }
        }
        symbIdx = 0;
        curBits = 0;
      }
      j++;
    }

  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for hard-demapping an input symbol stream into corresponding byte stream. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to modulation parameters structure
 * 
 * @return error ID
 */
error_t Modulation_HardDemapper( const complex_stream_t * inStream, byte_stream_t * outStream, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  mod_maptable_t mapTable;
  float minDist, curDist;
  uint32_t k = 0;                                                           /** - bit counter for output stream writing */
  uint32_t byteIdx;
  uint32_t j;
  uint8_t minIdx;
  uint8_t bitIdx;
  uint8_t i;
  
  if ((NULL != inStream) && (NULL != outStream) && (NULL != pParams))
  {
    GetMappingTable(&mapTable,pParams);                                     /** - retrieve mapping table */
    memset(outStream->pBuf,0,outStream->len);                               /** - clear output buffer */

    for (j=0; j<inStream->len; j++)
    {
      minIdx = 0;
      minDist = fabs(inStream->pBuf[j].re-mapTable.symbs[0].re)+fabs(inStream->pBuf[j].im-mapTable.symbs[0].im);
      for (i=1; i<pParams->order; i++)
      {
        curDist = fabs(inStream->pBuf[j].re-mapTable.symbs[i].re)+fabs(inStream->pBuf[j].im-mapTable.symbs[i].im);
        if (curDist < minDist)
        {
          minDist = curDist;
          minIdx = i;
        }
      }
      for (i=0; i<pParams->bps; i++)
      {
        if (mapTable.bits[minIdx] & (LSBIT_MASK_U8<<(pParams->bps-1-i)))
        {
          byteIdx = BI2BY_LEN(k);
          bitIdx = BITIDX_1LAST-(k&LSBYTE_MASK_U32);
          outStream->pBuf[byteIdx] |= (LSBIT_MASK_U8<<bitIdx); 
        }
        k++;
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for soft-demapping an input symbol stream into corresponding LLR stream. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to modulation parameters structure
 * 
 * @return error ID
 */
error_t Modulation_SoftDemapper( const complex_stream_t * inStream, float_stream_t * outStream, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  mod_maptable_t mapTable;
  const ulen_t punLenBi = BY2BI_LEN(outStream->len);
  ulen_t k;
  float numerator, denominator;
  float distance;
  uint8_t i, j;

  if ((NULL != inStream) && (NULL != outStream) && (NULL != pParams))
  {
    GetMappingTable(&mapTable,pParams);

    if (MOD_BINARY == pParams->order)
    {
      for (k=0; k<punLenBi; k++)
      {
        outStream->pBuf[k] = -inStream->pBuf[k].im;
      }
    }
    else
    {
      for (k=0; k<inStream->len; k++)
      {
        for (i=0; i<pParams->bps; i++)
        {
          numerator = 0;
          denominator = 0;
          for (j=0; j<pParams->order; j++)
          {
            distance = exp(-((inStream->pBuf[k].re-mapTable.symbs[j].re)*(inStream->pBuf[k].re-mapTable.symbs[j].re)+
                        (inStream->pBuf[k].im-mapTable.symbs[j].im)*(inStream->pBuf[k].im-mapTable.symbs[j].im))/MOD_SD_N0);
            if ((mapTable.bits[j]>>i) & LSBIT_MASK_U8)
            {
              numerator += distance;
            }
            else
            {
              denominator += distance;
            }
          }
          outStream->pBuf[(k+1)*pParams->bps-i-1] = MOD_SD_N0/2*log(numerator/denominator);
        }
      }
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
 * @brief <i> Function for retrieving specific mapping table according to modulation. </i>
 * 
 * @param[out] ioTable i/o table
 * @param[in] pParams pointer to modulation parameters structure
 * 
 * @return error ID
 */
static error_t GetMappingTable( mod_maptable_t * ioTable, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if ((NULL != ioTable) && (NULL != pParams))
  {
    if ((pParams->bps >= MOD_BPS_MIN) && (pParams->bps <= MOD_BPS_MAX))
    {
      switch(pParams->type)
      {
        case MOD_PSK:
          GetPskTable(ioTable,pParams);
          break;

        case MOD_QAM:
          GetQamTable(ioTable,pParams);
          break;

        default:
          retErr = ERR_INV_MODULATION_TYPE;
          break;
      }
    }
    else
    {
      retErr = ERR_INV_MODULATION_BPS;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for computing Gray-coded PSK mapping table. </i>
 * 
 * @param[out] ioTable i/o table
 * @param[in] pParams pointer to modulation parameters structure
 * 
 * @return error ID
 */
static error_t GetPskTable( mod_maptable_t * ioTable, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint8_t graySeq[pParams->order];
  uint8_t j;
  
  if ((NULL != ioTable) && (NULL != pParams))
  {
    GetGraySequence(graySeq,pParams);

    for (j=0; j<pParams->order; j++)
    {
      ioTable->bits[j] = graySeq[j];
      ioTable->symbs[j].re = cos(pParams->phOfst+2*MATH_PI*j/pParams->order);
      ioTable->symbs[j].im = sin(pParams->phOfst+2*MATH_PI*j/pParams->order);
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for computing Gray-coded QAM mapping table. </i>
 * 
 * @param[out] ioTable i/o table
 * @param[in] pParams pointer to modulation parameters structure
 * 
 * @return error ID
 */
static error_t GetQamTable( mod_maptable_t * ioTable, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint8_t graySeq[pParams->order];
  uint8_t j;
  uint8_t maxVal = (1<<(pParams->bps/2))-1;
  uint8_t nRows = sqrt(pParams->order);
  div_t divFct; 
  
  if ((NULL != ioTable) && (NULL != pParams))
  {
    if (IsQamBpsValid(pParams->bps))
    {
      GetGraySequence(graySeq,pParams);

      for (j=0; j<pParams->order; j++)
      {
        divFct = div(j,nRows);
        ioTable->bits[j] = graySeq[j];
        ioTable->symbs[j].re = (-maxVal+2*divFct.rem)*pow(-1,divFct.quot+1);
        ioTable->symbs[j].im = maxVal-2*divFct.quot;
      }
    }
    else
    {
      retErr = ERR_INV_MODULATION_BPS;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for retrieving Gray coded sequence. </i>
 * 
 * @param[out] ioBuffer i/o buffer to be filled
 * @param[in] pParams pointer to modulation parameters structure
 * 
 * @return error ID
 */
static error_t GetGraySequence( byte_t * ioBuffer, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint8_t i, cnt;
  uint8_t wrIdx;
  uint8_t shift;
  uint8_t nBlk;

  if ((NULL != ioBuffer) && (NULL != pParams))
  {
    memset(ioBuffer,0,pParams->order);                                      /** - clear buffer content */

    for (i=0; i<pParams->bps; i++)
    {
      nBlk = pParams->order/(1<<i);                                         /** - number of bits per block at i-th iteration */
      shift = pParams->bps-i-1;                                             /** - bit shift value at i-th iteration */
      cnt = 0;                                                              /** - counter within each single block */
      wrIdx = nBlk/2;                                                       /** - starting value of the writing index */
      while (wrIdx < pParams->order)
      {
        ioBuffer[wrIdx] |= (LSBIT_MASK_U8<<shift);
        if (cnt < (nBlk-1))
        {
          cnt++;
        }
        else
        {
          cnt = 0;
          wrIdx += nBlk;
        }
        wrIdx++;
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for checking if QAM BPS parameter is valid. </i>
 * 
 * @param[in] bps modulation bits-per-symbol value
 * 
 * @return validity outcome
 */
static bool IsQamBpsValid( uint8_t bps )
{
  bool bRet;

  bRet = (0 == (bps%2));

  return bRet;
}
