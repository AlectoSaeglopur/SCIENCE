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

static error_t GetMappingTable( mod_maptable_t * ioTable, const mod_par_t * pParams );
static error_t GetPskTable( mod_maptable_t * ioTable, const mod_par_t * pParams );
static error_t GetQamTable( mod_maptable_t * ioTable, const mod_par_t * pParams );
static error_t GetGraySequence( byte_t * ioBuffer, const mod_par_t * pParams );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief Function for retrieving and listing modulation parameters into dedicated structure.
 * 
 * @param ioParams : pointer to I/O parameters structure to be filled
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
    ioParams ->phOfst = (float)(M_PI/MOD_ORDER);
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for byte to complex symbol stream mapping.
 * 
 * @param inStream : input stream
 * @param outStream : output stream
 * @param pParams : pointer to parameters structure
 * 
 * @return error ID
 */
error_t Modulation_Mapper( const byte_stream_t * inStream, complex_stream_t * outStream, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  mod_maptable_t mapTable;
  len_t inLenBi = inStream->len<<BY2BI_SHIFT;
  len_t j = 0;
  len_t byteIdx;
  int8_t curBits = 0;
  uint8_t symbIdx = 0;
  uint8_t bitIdx;
  uint8_t i;

  if ((NULL != inStream) && (NULL != outStream) && (NULL != pParams))
  {
    GetMappingTable(&mapTable,pParams);                                 /** retrieve mapping table */

    while (j < inLenBi)
    {
      symbIdx++;
      byteIdx = j>>BY2BI_SHIFT;
      bitIdx = BITIDX_1LAST-(j&LSBYTE_MASK);
      curBits |= ((inStream->pBuf[byteIdx]>>bitIdx)&LSBIT_MASK)<<(pParams->bps-symbIdx);
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



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/


/**
 * @brief Function for retrieving specific mapping table according to modulation.
 * 
 * @param ioTable : i/o table
 * @param pParams : pointer to parameters structure
 * 
 * @return error ID
 */
static error_t GetMappingTable( mod_maptable_t * ioTable, const mod_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if ((NULL != ioTable) && (NULL != pParams))
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
        retErr = ERR_INV_MODULATION;
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
 * @brief Function for computing Gray-coded PSK mapping table.
 * 
 * @param ioTable : i/o table
 * @param pParams : pointer to parameters structure
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
      ioTable->symbs[j].re = cos(pParams->phOfst+2*M_PI*j/pParams->order);
      ioTable->symbs[j].im = sin(pParams->phOfst+2*M_PI*j/pParams->order);
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for computing Gray-coded QAM mapping table.
 * 
 * @param ioTable : i/o table
 * @param pParams : pointer to parameters structure
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
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for retrieving Gray coded sequence.
 * 
 * @param ioBuffer : i/o buffer to be filled
 * @param pParams : pointer to parameters structure
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
    memset(ioBuffer,0,pParams->order);                                  /** clear buffer content */

    for (i=0; i<pParams->bps; i++)
    {
      nBlk = pParams->order/(1<<i);                                     /** number of bits per block at i-th iteration */
      shift = pParams->bps-i-1;                                         /** bit shift value at i-th iteration */
      cnt = 0;                                                          /** counter within each single block */
      wrIdx = nBlk/2;                                                   /** starting value of the writing index */
      while (wrIdx < pParams->order)
      {
        ioBuffer[wrIdx] |= (LSBIT_MASK<<shift);
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
 * @brief Function for hard-demapping an input symbol stream into corresponding bit stream.
 * @param InSym : Input symbol stream.
 * @param OutBytes : Output byte stream.
 * @param Table : Constellation mapping table.
 * @return none
 */
//void HardDemapper( complex *InSym, uint8_t *OutBytes, phasemap *Table ){
//  uint8_t i, MinIdx, BitIdx;
//  uint32_t j, ByteIdx;
//  uint8_t Mask = 0x01;
//  uint32_t k = 0;                                          /** Bit counter for output stream writing */
//  float MinDist, CurDist;
//  memset(OutBytes,0,PunBytLen);
//  for ( j=0; j<SymLen; j++ ){
//    MinIdx = 0;
//    MinDist = fabs(InSym[j].Re-Table->Symbs[0].Re)+fabs(InSym[j].Im-Table->Symbs[0].Im);
//    for ( i=1; i<M; i++ ){
//      CurDist = fabs(InSym[j].Re-Table->Symbs[i].Re)+fabs(InSym[j].Im-Table->Symbs[i].Im);
//      if ( CurDist < MinDist ){
//        MinDist = CurDist;
//        MinIdx = i;
//      }
//    }
//    for ( i=0; i<L; i++ ){
//      if ( Table->Bits[MinIdx] & Mask<<(L-1-i) ){
//        ByteIdx = k>>3;
//        BitIdx = (uint8_t)(7-(k&0x0007));
//        OutBytes[ByteIdx] |= Mask<<BitIdx; 
//      }
//      k++;
//    }
//  }
//}


/**
 * @brief Function for soft-demapping an input symbol stream into corresponding LLR stream.
 * @param InSym : Input symbol stream.
 * @param OutLLRs : Output float LLR stream.
 * @param Table : Constellation mapping table.
 * @return none
 */
//void SoftDemapper( complex *InSym, float *OutLLRs, phasemap *Table ){
//  uint32_t k;
//  uint8_t i, j;
//  float Num, Den, Dist;
//  uint8_t Mask = 0x01;
//  float N0 = 4;                                          /** Assumed noise variance in linear (i.e. about 6 dB) */
//  if ( M == 2 ){
//    for ( k=0; k<PunBitLen; k++ ){
//      OutLLRs[k] = -InSym[k].Im;
//    }
//  } else {
//    for ( k=0; k<SymLen; k++ ){
//      for ( i=0; i<L; i++ ){
//        Num = 0;
//        Den = 0;
//        for ( j=0; j<M ; j++ ){
//          Dist = exp(-(pow(InSym[k].Re-Table->Symbs[j].Re,2)+pow(InSym[k].Im-Table->Symbs[j].Im,2))/N0);
//          if ( (Table->Bits[j]>>i) & Mask ){
//            Num += Dist;
//          } else {
//            Den += Dist;
//          }
//        }
//        OutLLRs[(k+1)*L-i-1] = N0/2*log(Num/Den);
//      }
//    }
//  }
//}
