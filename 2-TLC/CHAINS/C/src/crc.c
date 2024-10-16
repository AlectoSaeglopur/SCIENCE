/**
 * @file crc.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @see Digital communications - Fundamentals and applications (Bernard Sklar, 2014)
 * @ingroup TLC_CHAIN
 * @brief CRC ibrary
 * 
 * Library containing cyclic redundancy check (CRC) functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "crc.h"
#include "debug.h"



/*****************/
/*** CONSTANTS ***/
/*****************/

static const uint8_t CRC_GENPOLY_8[] = {0,2,4,6,7};               //!< Generator polynomial for 8-bit CRC (ITU standard)
static const uint8_t CRC_GENPOLY_16[] = {0,5,12};                 //!< Generator polynomial for 16-bit CRC (DVB-S2 standard)
static const uint8_t CRC_GENPOLY_24[] = {0,1,5,6,23};             //!< Generator polynomial for 24-bit CRC (UMTS standard)
static const uint8_t CRC_GENPOLY_32[] = {0,1,2,4,5,7,8,10,
                                  11,12,16,22,23,26};             //!< Generator polynomial for 32-bit CRC (MPEG-2 standard)
static const uint8_t CRC_GENPOLY_64[] = {0,1,3,4};                //!< Generator polynomial for 64-bit CRC (ISO standard)



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static slen_t FindMaxDegree( const uint8_t * poly, ulen_t lenBi );



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
error_t Crc_ListParameters( crc_par_t * ioParams )
{
  Debug_SetWatermark((void *)Crc_ListParameters,WM_LEVEL_1);

  error_t retErr = ERR_NONE;

  if (NULL != ioParams)
  {
    ioParams->degree = CRC_DEGREE;

    switch (ioParams->degree)
    {
      case CRC_DEGREE_8:
        ioParams->pGenPoly = CRC_GENPOLY_8;
        ioParams->lenGenPoly = sizeof(CRC_GENPOLY_8);
        break;

      case CRC_DEGREE_16:
        ioParams->pGenPoly = CRC_GENPOLY_16;
        ioParams->lenGenPoly = sizeof(CRC_GENPOLY_16);
        break;

      case CRC_DEGREE_24:
        ioParams->pGenPoly = CRC_GENPOLY_24;
        ioParams->lenGenPoly = sizeof(CRC_GENPOLY_24);
        break;

      case CRC_DEGREE_32:
        ioParams->pGenPoly = CRC_GENPOLY_32;
        ioParams->lenGenPoly = sizeof(CRC_GENPOLY_32);
        break;

      case CRC_DEGREE_64:
        ioParams->pGenPoly = CRC_GENPOLY_64;
        ioParams->lenGenPoly = sizeof(CRC_GENPOLY_64);
        break;

      default:
        retErr = ERR_INV_CRC_DEGREE;
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
 * @brief <i> Function for calculating CRC. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to crc parameters structure
 * 
 * @return error ID
 */
error_t Crc_CalculateChecksum( const byte_stream_t * inStream, byte_stream_t * outStream, const crc_par_t * pParams )
{
  Debug_SetWatermark((void *)Crc_CalculateChecksum,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  const ulen_t crcLenBy = BI2BY_LEN(pParams->degree);
  const ulen_t upLenBi = BY2BI_LEN(inStream->len)+pParams->degree;    /** upshifted bit-length */
  const ulen_t upLenBy = BI2BY_LEN(upLenBi);                          /** upshifted byte-length */
  slen_t maxDeg, quotDeg;
  ulen_t byteIdx;
  byte_t tmpPoly[upLenBy];                                            /** temporary polynomial used for iterative division operations */
  uint8_t mask;
  uint8_t bitIdx;
  uint8_t j;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id) &&
      (NULL != pParams))
  {
    if (crcLenBy == outStream->len)
    {
      memcpy(tmpPoly,inStream->pBuf,inStream->len);                     /** upshift the message polynomial into tmpPoly(x) */
      memset(&tmpPoly[inStream->len],0,crcLenBy);
      maxDeg = upLenBi-FindMaxDegree(tmpPoly,upLenBi)-1;                /** search for the maximum degree of tmpPoly(x) at 1st iteration */
      quotDeg = maxDeg-pParams->degree;                                 /** estimate quotient degree at 1st iteration */

      if (maxDeg < upLenBi)                                             /** verify that input stream is not an all-zero array */
      {
        while (quotDeg >= 0)
        {                                                               /** exit if at current iteration tmpPoly(x) has a maximum degree less than CrcDeg */
          byteIdx = BI2BY_LEN(upLenBi-maxDeg-1);
          bitIdx = (uint8_t)((upLenBi-maxDeg-1)&LSBYTE_MASK_U32);
          mask = ~(MSBIT_MASK_U8>>bitIdx);
          tmpPoly[byteIdx] &= mask;                                     /** reset the maximum degree of tmpPoly(x) at current iteration */
          for (j=0; j<pParams->lenGenPoly; j++)
          {
            byteIdx = BI2BY_LEN(upLenBi-quotDeg-pParams->pGenPoly[j]-1);
            bitIdx = (uint8_t)((upLenBi-quotDeg-pParams->pGenPoly[j]-1)&LSBYTE_MASK_U32);
            mask = (MSBIT_MASK_U8>>bitIdx);
            tmpPoly[byteIdx] ^= mask;                                   /** compute division remainder at current iteration */
          }
          maxDeg = upLenBi-FindMaxDegree(tmpPoly,upLenBi)-1;            /** search for the maximum degree of tmpPoly(x) at current iteration */
          quotDeg = maxDeg-pParams->degree;                             /** estimate the quotient degree at current iteration */
        }
      }

      memcpy(outStream->pBuf,&tmpPoly[upLenBy-crcLenBy],crcLenBy);      /** copy computed crc bytes into output stream */
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



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/


/**
 *  Function for finding the maximum degree of the input polynomial (in MSB endianess).
 *  A -1 return means that the input is an all-zero array.
 **/

/**
 * @brief <i> Function for finding the maximum degree of a polynomial (assuming MSB endianess). </i>
 * 
 * @param[in] poly input polynomial
 * @param[in] lenBi polynomial length
 * 
 * @return index of maximum degree
 */
static slen_t FindMaxDegree( const  uint8_t * poly, ulen_t lenBi )
{
  Debug_SetWatermark((void *)FindMaxDegree,WM_LEVEL_2);

  ulen_t j, byteIdx;
  slen_t maxDeg = -1;
  uint8_t bitIdx;
  
  for (j=0; j<lenBi; j++)
  {
    byteIdx = BI2BY_LEN(j);
    bitIdx = (uint8_t)(j&LSBYTE_MASK_U32);

    if ((poly[byteIdx]>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK_U8)
    {
      maxDeg = (slen_t)j;
      break;
    }
  }

  return maxDeg;
}
