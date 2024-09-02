/**
 * @file convolutional.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Convolutional coding library
 * 
 * Library containing all convolutional coding functions.
 */

/****************/
/*** INCLUDES ***/
/****************/

#include "convolutional.h"



/***************/
/*** DEFINES ***/
/***************/

const cc_rate_t CC_RATE_ARRAY[CC_RATE_NUM] =
{
  LIST_OF_CC_RATES(DEF_CC_RATES_ARRAY)
};



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static bool IsRateValid( cc_rate_t val );
static bool IsKlenValid( cc_klen_t val );
static error_t RetrieveConnectorPuncturationVectors( cc_encoder_info_t * ioInfo, const cc_par_t * inParams );
static uint8_t ComputeEncBit( uint8_t cState, uint8_t cvVal, cc_klen_t kLen );
static error_t ComputeTrellisDiagram( cc_trellis_t * ioTrellisDiagr, const uint8_t * conVect, const cc_par_t * pParams );
static error_t HardDepuncturer( byte_t * ioBuffer, len_t inLenBi, len_t outLenBi, const uint8_t * punctVect, const cc_par_t * pParams );
static uint8_t CountByteOnes( byte_t InByte );
static uint8_t FindMinSurvPathHard( const cc_hard_dec_info_t * inPaths );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief Function for retrieving and listing convolution encoding parameters into dedicated structure.
 * 
 * @param ioParams : pointer to I/O parameters structure to be filled
 * 
 * @return error ID
 */
error_t CnvCod_ListParameters( cc_par_t * ioParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != ioParams)
  {
    ioParams->cRate = CC_RATE;
    ioParams->kLen = CC_KLEN;
    ioParams->memFact = CC_MEMFACT;
    ioParams->vitDM = CC_VITDM;
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for retrieving connection and puncturation vectors as a function of the selected parameters.
 * 
 * @param ioInfo : pointer to I/O structure to be filled
 * @param inParams : pointer to parameters
 * 
 * @return error ID
 */
static error_t RetrieveConnectorPuncturationVectors( cc_encoder_info_t * ioInfo, const cc_par_t * inParams )
{
  error_t retErr = ERR_NONE;

  if ((NULL != ioInfo) && (NULL != inParams))
  {
    if (IsKlenValid(inParams->kLen))
    {

      memcpy(ioInfo->connVect,CC_CVMATRIX[inParams->kLen-CC_KLEN_MIN],CC_NBRANCHES);      /** - link connector vector */
    }
    else
    {
      retErr = ERR_INV_CNVCOD_KLEN;
    }

    if (IsRateValid(inParams->cRate))
    {
      switch (inParams->cRate)
      {
        case CC_RATE_23:
          memcpy(ioInfo->puncVect,CC_PUNC_VECT_23,CC_PUNCTLEN);                           /** - link puncturation vector */
          break;
        
        case CC_RATE_34:
          memcpy(ioInfo->puncVect,CC_PUNC_VECT_34,CC_PUNCTLEN);
          break;

        case CC_RATE_56:
          memcpy(ioInfo->puncVect,CC_PUNC_VECT_56,CC_PUNCTLEN);
          break;

        case CC_RATE_78:
          memcpy(ioInfo->puncVect,CC_PUNC_VECT_78,CC_PUNCTLEN);
          break;

        default:
          // do nothing
          break;
      }
    }
    else
    {
      retErr = ERR_INV_CNVCOD_RATE;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for convolutional encoding (including puncturing).
 * 
 * @param inStream : input/source stream
 * @param outStream : output/encoded stream
 * @param pParams : pointer to parameters structure
 * @param pEncInfo : pointer to encoder connector and puncturation structure
 * 
 * @return errod ID
 */
error_t CnvCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const len_t unpLenBy = CC_NBRANCHES*inStream->len;                                /** unpunctured coded length [B] */
  const len_t unpLenBi = unpLenBy<<BY2BI_SHIFT;                                     /** unpunctured coded length [b] */
  const len_t inLenBi = inStream->len<<BY2BI_SHIFT;                                 /** input buffer length [b] */
  const len_t punLenBi = inLenBi*(pParams->cRate+1)/pParams->cRate;                 /** expected punctured coded length [b] */
  cc_encoder_info_t encInfo;
  len_t wrIdx = 0;
  len_t byteIdx;
  len_t j;
  uint8_t encState = 0;
  uint8_t bitIdx;
  uint8_t rdBit;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != outStream) &&
      (NULL != outStream->pBuf) && (NULL != pParams))
  {
    RetrieveConnectorPuncturationVectors(&encInfo,pParams);                         /** retrieve convolutional encoder info */

    if (unpLenBy == outStream->len)
    {
      for (j=0; j<inLenBi; j++)
      {
        byteIdx = j>>BY2BI_SHIFT;                                                   /** update byte index for reading input buffer */
        bitIdx = (uint8_t)(j&LSBYTE_MASK);                                          /** update bit index for reading input buffer */
        encState >>= 1;
        encState |= ((inStream->pBuf[byteIdx]>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK)
          <<(pParams->kLen-1);                                                      /** update encoder state with latest input bit */
        byteIdx = (CC_NBRANCHES*j)>>BY2BI_SHIFT;                                    /** update byte index for output stream writing */
        bitIdx = (CC_NBRANCHES*j)&LSBYTE_MASK;                                      /** update bit index for output stream writing */
        outStream->pBuf[byteIdx] |= (ComputeEncBit(encState,encInfo.connVect[0],
          pParams->kLen)<<(BITIDX_1LAST-bitIdx));
        outStream->pBuf[byteIdx] |= (ComputeEncBit(encState,encInfo.connVect[1],
          pParams->kLen)<<(BITIDX_2LAST-bitIdx));
      }

      if (CC_RATE_12 != pParams->cRate)
      {                                                                              /**  apply puncturing if selected Rc is higher than 1/2 */
        for (j=0; j<unpLenBi; j++)
        {
          byteIdx = j>>BY2BI_SHIFT;
          bitIdx = j&LSBYTE_MASK;
          rdBit = (outStream->pBuf[byteIdx]>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK;     /** j-th bit of unpunctured output stream */
          if (encInfo.puncVect[j%(CC_NBRANCHES*pParams->cRate)])                    /** check if puncturation has to applied now */
          {
            byteIdx = wrIdx>>BY2BI_SHIFT;
            bitIdx = BITIDX_1LAST-(uint8_t)(wrIdx&LSBYTE_MASK);
            wrIdx++;
            if (0 == rdBit)
            {
              outStream->pBuf[byteIdx] &= ~(LSBIT_MASK<<bitIdx);
            }
            else
            {
              outStream->pBuf[byteIdx] |= (LSBIT_MASK<<bitIdx);
            }
          }
        }
        if (punLenBi == wrIdx)                                                      /** check if computed and theoretical punctured length match */
        {
          outStream->len = wrIdx>>BY2BI_SHIFT;                                      /** update output buffer length (from default unpuntured one to actual punctured one) */
        }
        else
        {
          retErr = ERR_INV_BUFFER_SIZE;
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
 * @brief Function for convolutional hard-decoding by implementing Viterbi algorithm (including depuncturing).
 * 
 * @param inStream : input/encoded stream
 * @param outStream : output/decoded stream
 * @param pParams : coding parameters
 * @param pEncInfo : encoder info
 * 
 * @return error ID
 */
error_t CnvCod_HardDecoder( const byte_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const len_t outLenBi = outStream->len<<BY2BI_SHIFT;
  const len_t inLenBi = inStream->len<<BY2BI_SHIFT;
  const len_t unpLenBy = CC_NBRANCHES*inStream->len*pParams->cRate/(pParams->cRate+1);
  const len_t unpLenBi = unpLenBy<<BY2BI_SHIFT;
  cc_encoder_info_t encInfo;
  cc_hard_dec_info_t curPaths = {.iter={0}, .dist={0}, .path={{0}}};
  cc_hard_dec_info_t prevPaths;
  cc_trellis_t trDiagr;
  uint32_t byteIdx, inIdx, wrIdx, finIdx;
  uint32_t candDist;
  uint32_t i;
  uint8_t tmpStream[unpLenBy];
  uint8_t nextSt, minDistSt, depSt, arrSt;
  uint8_t bitIdx, hypIdx;
  uint8_t cycleBits;
  uint8_t hamDist;
  uint8_t erasMask;
  uint8_t j;
  
  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != outStream) && (NULL != outStream->pBuf))
  {
    RetrieveConnectorPuncturationVectors(&encInfo,pParams);                                     /** retrieve convolutional encoder info */
    ComputeTrellisDiagram(&trDiagr,encInfo.connVect,pParams);                                   /** compute convolutional decoder trellis diagram */
    curPaths.iter[0] = 1;                                                                       /** enable only all-zero state at the beginning */
    memcpy(tmpStream,inStream->pBuf,inStream->len);

    if (CC_RATE_12 == pParams->cRate)                                                           /** check if depuncturing is needed */
    {
      erasMask = CC_INMASK;                                                                     /** use no-erasure mask for depuctured case */
    }
    else
    {
      HardDepuncturer(tmpStream,inLenBi,unpLenBi,encInfo.puncVect,pParams);
    }

    for (i=CC_NBRANCHES; i<outLenBi+CC_NBRANCHES; i++)
    {
      inIdx = CC_NBRANCHES*(i-CC_NBRANCHES);
      byteIdx = (inIdx>>BY2BI_SHIFT);
      bitIdx = (uint8_t)(inIdx&LSBYTE_MASK);
      cycleBits = (tmpStream[byteIdx]>>(BITIDX_2LAST-bitIdx))&CC_INMASK;                        /** current pair of input bits */
      prevPaths = curPaths;
      if (CC_RATE_12 != pParams->cRate)                                                         /** retrieve erasure mask in case depuncturing has been applied */
      {
        erasMask = 0;
        erasMask |= (encInfo.puncVect[inIdx%(2*pParams->cRate)]<<1);
        erasMask |= encInfo.puncVect[(inIdx+1)%(2*pParams->cRate)];
      }
      for (j=0; j<CC_NTRELSTATES; j++)
      {
        if (prevPaths.iter[j] == i-1)                                                           /** check if j-th state was active in previous iteration */
        {                                                          
          for (hypIdx = 0; hypIdx<CC_NBRANCHES; hypIdx++)
          {
            hamDist = CountByteOnes((cycleBits^(trDiagr.trSt[j].outBits[hypIdx]))&erasMask);    /** compute Hamming distance assuming hypIdx input bit */
            nextSt = trDiagr.trSt[j].nextSt[hypIdx];                                            /** compute next state assuming HypIdx input bit */
            if (curPaths.iter[nextSt] < i)                                                      /** if there's not yet a survivor path for nextSt state at i-th cycle */
            {
              curPaths.iter[nextSt] = i;                                                        /** update state iteration counter */
              curPaths.dist[nextSt] = prevPaths.dist[j]+(uint32_t)hamDist;                      /** update state distance */
              if (i-1 < CC_MEM_DIM)
              {
                finIdx = i-CC_NBRANCHES;
              }
              else
              {
                finIdx = CC_MEM_DIM-1;
              }
              for (wrIdx = 0; wrIdx < finIdx; wrIdx++)                                          /** update state path among previous states */
              {
                curPaths.path[nextSt][wrIdx] = prevPaths.path[j][wrIdx];
              }
              curPaths.path[nextSt][finIdx] = j;              
            }
            else                                                                                /** if a survivor path for nextSt state at i-th cycle already exists, check if new candidate is better */
            {
              candDist = prevPaths.dist[j]+(uint32_t)hamDist;
              if (candDist < curPaths.dist[nextSt])
              {
                curPaths.dist[nextSt] = candDist;
                if (i-1 < CC_MEM_DIM)
                {
                  finIdx = i-CC_NBRANCHES;
                }
                else
                {
                  finIdx = CC_MEM_DIM-1;
                }
                for (wrIdx = 0; wrIdx < finIdx; wrIdx++)
                {
                  curPaths.path[nextSt][wrIdx] = prevPaths.path[j][wrIdx];
                }
                curPaths.path[nextSt][finIdx] = j;
              }
            }
          }
        }
      }

      if (i-1 == outLenBi)                                                                      /** if input bit stream is over, flush decoder memory and extract final info bits */
      {
        minDistSt = FindMinSurvPathHard(&curPaths);                                             /** look for minimum distance survivor path */
        if (i-1 >= CC_MEM_DIM)                                                                  /** check if memory has been completely filled */
        {
          finIdx = CC_MEM_DIM;
        }
        else
        {
          finIdx = i-1;
        }
        for (wrIdx=0; wrIdx<finIdx; wrIdx++)
        {
          depSt = curPaths.path[minDistSt][wrIdx];                                              /** set departure state */
          if (wrIdx == finIdx-1)
          {
            arrSt = minDistSt;                                                                  /** set arrival state */
          }
          else
          {
            arrSt = curPaths.path[minDistSt][wrIdx+1];
          }
          byteIdx = (outLenBi-finIdx+wrIdx)>>BY2BI_SHIFT;
          bitIdx = (uint8_t)((outLenBi-finIdx+wrIdx)&LSBYTE_MASK);
          if (trDiagr.trSt[depSt].nextSt[0] == arrSt)
          {
            outStream->pBuf[byteIdx] &= ~(LSBIT_MASK<<(BITIDX_1LAST-bitIdx));                         /** set output bit to '0' */
          }
          else
          {
            outStream->pBuf[byteIdx] |= (LSBIT_MASK<<(BITIDX_1LAST-bitIdx));                          /** set output bit to '1' */
          }
        }
      }
      else if (i-1 >= CC_MEM_DIM)                                                               /** if input bit stream is not over but memory is full, extract oldest info bit */
      {
        minDistSt = FindMinSurvPathHard(&curPaths);
        depSt = curPaths.path[minDistSt][0];
        arrSt = curPaths.path[minDistSt][1];
        byteIdx = (i-CC_MEM_DIM-1)>>BY2BI_SHIFT;
        bitIdx = (uint8_t)((i-CC_MEM_DIM-1)&LSBYTE_MASK);
        if (trDiagr.trSt[depSt].nextSt[0] == arrSt)
        {
          outStream->pBuf[byteIdx] &= ~(LSBIT_MASK<<(BITIDX_1LAST-bitIdx));
        }
        else
        {
          outStream->pBuf[byteIdx] |= (LSBIT_MASK<<(BITIDX_1LAST-bitIdx));
        }
        for (j=0; j<CC_NTRELSTATES; j++)
        {
          for (wrIdx = 0; wrIdx<(CC_MEM_DIM-1); wrIdx++)
          {
            curPaths.path[j][wrIdx] = curPaths.path[j][wrIdx+1];                                /** keep all survivor paths */
          }
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
 * @brief Function for checking the correctness of the code rate parameter.
 * 
 * @param val : code rate value
 * 
 * @return validity outcome
 */
static bool IsRateValid( cc_rate_t val )
{
  bool bRet = false;
  uint8_t j;

  for (j=0; j<CC_RATE_NUM; j++)
  {
    if (val == CC_RATE_ARRAY[j])
    {
      bRet = true;
      break;
    }
  }

  return bRet;
}


/**
 * @brief Function for checking the correctness of the constraint length parameter.
 * 
 * @param val : constraint length value
 * 
 * @return validity outcome
 */
static bool IsKlenValid( cc_klen_t val )
{
  bool bRet;

  bRet = (val >= CC_KLEN_MIN) && (val <= CC_KLEN_MAX);

  return bRet;
}


/**
 * @brief Function for computing the next encoded bit.
 * 
 * @param cState : current convolutional state
 * @param cvVal : connection vector value
 * @param kLen : encoder constraint length
 * 
 * @return next encoded bit
 */
static uint8_t ComputeEncBit( uint8_t cState, uint8_t cvVal, cc_klen_t kLen )
{
  uint8_t outBit = 0;
  uint8_t j;

  for (j=0; j<kLen; j++)
  {
    outBit ^= (((cState>>j)&LSBIT_MASK)&((cvVal>>j)&LSBIT_MASK));
  }

  return outBit;
}


/**
 * @brief Function for retrieving depunctured trellis diagram information.
 * 
 * @param ioTrellisDiagr : pointer to trellis structure to be filled
 * @param conVect : connection vector
 * @param pParams : pointer to parameters structure
 * 
 * @return error ID
 */
static error_t ComputeTrellisDiagram( cc_trellis_t * ioTrellisDiagr, const uint8_t * conVect, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint8_t StBin[CC_NTRELSTATES];
  uint8_t i, j;
  uint8_t outBit;
  uint8_t state0, state1;
  
  if (NULL != ioTrellisDiagr)
  {
    for (j=0; j<CC_NTRELSTATES; j++)
    {
      StBin[j] = j;                                                             /** state IDs */
    }
    for (j=0; j<CC_NTRELSTATES; j++)
    {
      state0 = StBin[j];                                                        /** state update due to new 0-bit input */
      for (i=0; i<CC_NBRANCHES; i++)
      {
        outBit = ComputeEncBit(state0,conVect[i],pParams->kLen);                /** estimate encoded bit from i-th connection branch */
        if ( 0 == i)
        {
          ioTrellisDiagr->trSt[j].outBits[0] = outBit<<1;                     /** store 1st encoded bit into trellis */
        }
        else
        {
          ioTrellisDiagr->trSt[j].outBits[0] += outBit;                       /** store 2nd encoded bit into trellis */
        }
      }
      ioTrellisDiagr->trSt[j].nextSt[0] = state0>>1;                          /** store next state into trellis (due to 0-bit input from j-th state) */
      state1 = state0|(LSBIT_MASK<<(pParams->kLen-1));                          /** state update due to new 1-bit input */
      for (i=0; i<CC_NBRANCHES; i++)
      {
        outBit = ComputeEncBit(state1,conVect[i],pParams->kLen);
        if (0 == i)
        {
          ioTrellisDiagr->trSt[j].outBits[1] = outBit<<1;
        }
        else
        {
          ioTrellisDiagr->trSt[j].outBits[1] += outBit;
        }
      }
      ioTrellisDiagr->trSt[j].nextSt[1] = state1>>1;                          /** store next state into trellis (due to 1-bit input from j-th state) */
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function to depuncture a byte stream to base code rate.
 * 
 * @param ioBuffer : i/o buffer
 * @param inLenBi : input/punctured length [b]
 * @param outLenBi : output/unpunctured length [b]
 * @param punctVect : puncturing vector
 * @param pParams : coding parameters
 * 
 * @return error ID
 */
static error_t HardDepuncturer( byte_t * ioBuffer, len_t inLenBi, len_t outLenBi, const uint8_t * punctVect, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint32_t rdIdx = inLenBi-1;                                             /** final bit index of input stream length */
  uint32_t byteIdx;
  uint32_t j;
  uint8_t rdIdxPunc = CC_NBRANCHES*pParams->cRate-1;
  uint8_t bitIdx;
  uint8_t rdBit;

  if (NULL != ioBuffer)
  {
    for (j=outLenBi; j>0; j--)
    {
      if (1 == punctVect[rdIdxPunc])
      {
        byteIdx = rdIdx>>BY2BI_SHIFT;
        bitIdx = (uint8_t)(BITIDX_1LAST-(rdIdx&LSBYTE_MASK));
        rdBit = ioBuffer[byteIdx]&(LSBIT_MASK<<bitIdx);
        rdIdx--;
      }
      else
      {
        rdBit = 0;                                                        /** each erasure bit restored has '0' value */
      }
      if (rdIdxPunc > 0)
      {
        rdIdxPunc--;
      }
      else
      {
        rdIdxPunc = CC_NBRANCHES*pParams->cRate-1;
      }
      byteIdx = (j-1)>>BY2BI_SHIFT;
      bitIdx = (uint8_t)(BITIDX_1LAST-((j-1)&LSBYTE_MASK));
      if (0 == rdBit)
      {
        ioBuffer[byteIdx] &= ~(LSBIT_MASK<<bitIdx);                       /** set output bit to '0' */
      }
      else
      {
        ioBuffer[byteIdx] |= (LSBIT_MASK<<bitIdx);                        /** set output bit to '1' */
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
 * @brief Function for counting the number of 1-bits within the input byte.
 * 
 * @param inByte : input byte
 * 
 * @return number of '1's
 */
static uint8_t CountByteOnes( byte_t inByte )
{
  uint8_t j;
  uint8_t cnt = 0;

  for (j=0; j<NUM_BITS_PER_BYTE; j++)
  {
    if ((inByte>>j)&LSBIT_MASK)
    {
      cnt++;
    }
  }
  
  return cnt;
}


/**
 * @brief Function to find the hard-coded survivor path with minimum distance.
 * 
 * @param InPaths : current Viterbi paths
 * 
 * @return index of minimum distance trellis state
 */
static uint8_t FindMinSurvPathHard( const cc_hard_dec_info_t * inPaths )
{
  uint32_t minDist;
  uint8_t minStateIdx;
  uint8_t j;
  
  if (NULL != inPaths)
  {
    minDist = inPaths->dist[0];
    minStateIdx = 0;
    for (j=1; j<CC_NTRELSTATES; j++)
    {
      if ((inPaths->iter[j]>0) && (inPaths->dist[j] < minDist))
      {
        minDist = inPaths->dist[j];
        minStateIdx = j;
      }
    }
  }

  return minStateIdx;
}













/**
 * @brief Function for convolutionally decoding a byte stream (and depuncturing as well) by implementing Viterbi soft algorithm.
 * @param InLLRs : Input float LLR stream.
 * @param DecByt : Output decoded byte stream.
 * @param CodeDiagr : Trellis diagram.
 * @param PunctVect : Puncturing vector.
 * @return none
 */
//void SoftConvDecoder( float *InLLRs, uint8_t *DecByt, trellis *CodeDiagr, uint8_t *PunctVect ){
//  uint32_t i, ByteIdx, CurIdx, WrIdx, IdxFin;
//  uint8_t j, BitIdx, MaskEras, HypIdx;
//  uint8_t NextSt, MinDistState, StateDep, StateArr;
//  float EuclDist, CandDist;
//  uint8_t Mask = 0x01;
//  vitdecs CurPaths = {.Iter = {0}, .Dist = {0}, .Path = {{0}}};
//  CurPaths.Iter[0] = 1;                                  /** Enable only the all-zero state at the beginning */
//  vitdecs PrevPaths;
//  if ( Rc == RATE_12 ){                                  /** Check if Depuncturing is needed */
//    MaskEras = 0x03;                                  /** Use no-erasure mask for depuctured case */
//  } else {
//    SoftDepuncturing(InLLRs,PunctVect);
//  }
//  for ( i=2; i<SrcBitLen+2; i++){
//    CurIdx = 2*(i-2);
//    PrevPaths = CurPaths;
//    if ( Rc != RATE_12 ){                                /** Estimate specific erasure mask if Depuncturing has been applied */
//      MaskEras = 0;
//      MaskEras |= (PunctVect[CurIdx%(2*Rc)]<<1);
//      MaskEras |= PunctVect[(CurIdx+1)%(2*Rc)];
//    }
//    for ( j=0; j<N_TSTAT; j++ ){
//      if ( PrevPaths.Iter[j] == i-1 ){                         /** Check if j-th state was active in the previous iteration */
//        for ( HypIdx = 0; HypIdx<2; HypIdx++ ){
//          EuclDist = GetEuclideanDist(&InLLRs[CurIdx],CodeDiagr->States[j].OutBits[HypIdx],MaskEras);    /** Compute Euclidean distance assuming HypIdx-value input bit */
//          NextSt = CodeDiagr->States[j].NextState[HypIdx];                        /** Compute trellis next state assuming HypIdx-value input bit */
//          if ( CurPaths.Iter[NextSt] < i ){                    /** If there's not yet a survivor path for NextSt state at i-th cycle */
//            CurPaths.Iter[NextSt] = i;                      /** Update the state iteration counter */
//            CurPaths.Dist[NextSt] = PrevPaths.Dist[j]+EuclDist;          /* Update the state distance */
//            if ( i-1 < MEM_DIM ){
//              IdxFin = i-2;
//            } else {
//              IdxFin = MEM_DIM-1;
//            }
//            for ( WrIdx = 0; WrIdx < IdxFin; WrIdx++ ){              /** Update the state path among previous states */
//              CurPaths.Path[NextSt][WrIdx] = PrevPaths.Path[j][WrIdx];
//            }
//            CurPaths.Path[NextSt][IdxFin] = j;
//          } else {                                /** If a survivor path for NextSt state at i-th cycle already exists, check if the new candidate is better */
//            CandDist = PrevPaths.Dist[j]+EuclDist;
//            if ( CandDist < CurPaths.Dist[NextSt] ){
//              CurPaths.Dist[NextSt] = CandDist;
//              if ( i-1 < MEM_DIM ){
//                IdxFin = i-2;
//              } else {
//                IdxFin = MEM_DIM-1;
//              }
//              for ( WrIdx = 0; WrIdx < IdxFin; WrIdx++ ){
//                CurPaths.Path[NextSt][WrIdx] = PrevPaths.Path[j][WrIdx];
//              }
//              CurPaths.Path[NextSt][IdxFin] = j;
//            }
//          }
//        }
//      }
//    }
//    if ( i-1 == SrcBitLen ){                              /** If input bit stream is over, flush the decoder memory and extract the final info bits */
//      MinDistState = FindMinIndexSoft(&CurPaths);                    /** Look for the minimum distance survivor path */
//      if ( i-1 >= MEM_DIM ){                              /** Check if memory has been completely filled */
//        IdxFin = MEM_DIM;
//      } else {
//        IdxFin = i-1;
//      }
//      for ( WrIdx=0; WrIdx<IdxFin; WrIdx++ ){
//        StateDep = CurPaths.Path[MinDistState][WrIdx];                /** Departure state */
//        if ( WrIdx == IdxFin-1 ){
//          StateArr = MinDistState;                        /** Arrival state */
//        } else {
//          StateArr = CurPaths.Path[MinDistState][WrIdx+1];
//        }
//        ByteIdx = (SrcBitLen-IdxFin+WrIdx)>>3;
//        BitIdx = (uint8_t)((SrcBitLen-IdxFin+WrIdx)&0x0007);
//        if ( CodeDiagr->States[StateDep].NextState[0] == StateArr ){
//          DecByt[ByteIdx] &= ~(Mask<<(7-BitIdx));                  /** Set output bit to '0' */
//        } else {
//          DecByt[ByteIdx] |= (Mask<<(7-BitIdx));                  /** Set output bit to '1' */
//        }
//      }
//    } else if ( i-1 >= MEM_DIM ){                            /** If input bit stream is not over but memory is full, extract the oldest info bit */
//      MinDistState = FindMinIndexSoft(&CurPaths);
//      StateDep = CurPaths.Path[MinDistState][0];
//      StateArr = CurPaths.Path[MinDistState][1];
//      ByteIdx = (i-MEM_DIM-1)>>3;
//      BitIdx = (uint8_t)((i-MEM_DIM-1)&0x0007);
//      if ( CodeDiagr->States[StateDep].NextState[0] == StateArr ){
//        DecByt[ByteIdx] &= ~(Mask<<(7-BitIdx));                    /** Set output bit to '0' */
//      } else {
//        DecByt[ByteIdx] |= (Mask<<(7-BitIdx));                    /** Set output bit to '1' */
//      }
//      for ( j=0; j<N_TSTAT; j++){
//        for ( WrIdx = 0; WrIdx<(MEM_DIM-1); WrIdx++ ){
//          CurPaths.Path[j][WrIdx] = CurPaths.Path[j][WrIdx+1];          /** Keep all survivor paths */
//        }
//      }
//    }
//  }
//}


/**
 * @brief Function for calculating Euclidean distance between LLR stream and specific trellis state.
 * @param CurLLRs : Input float LLR stream.
 * @param TrlByte : Output bits for specific trellis state.
 * @param MaskEras : Depuncturing erasure mask.
 * @return Estimated Euclidean distance.
 */
//static float GetEuclideanDist( float *CurLLRs, uint8_t TrlByte, uint8_t MaskEras ){
//  uint8_t j;
//  uint8_t Mask = 0x01;
//  float Dist = 0;
//  for ( j=0; j<2; j++ ){
//    if ( (MaskEras>>(1-j)) & Mask ){
//      Dist += fabs(2*((float)((TrlByte>>(1-j))&Mask))-1-CurLLRs[j]);
//    }
//  }
//  return Dist;
//}


/**
 * @brief Function for finding soft survivor path with minimum distance.
 * @param InPaths : Input decoding paths.
 * @return Minimum distance path index.
 */
//static uint8_t FindMinIndexSoft( vitdecs *InPaths ){
//  uint8_t j, MinStateIdx;
//  float MinDist;
//  if ( InPaths != NULL ){
//    MinDist = InPaths->Dist[0];
//    MinStateIdx = 0;
//    for ( j=1; j<N_TSTAT; j++ ){
//      if ( (InPaths->Iter[j]>0) && (InPaths->Dist[j] < MinDist) ){
//        MinDist = InPaths->Dist[j];
//        MinStateIdx = j;
//      }
//    }
//  }
//  return MinStateIdx;
//}


/**
 * @brief Function for depuncturing an input LLR stream.
 * @param InLLRs : Input LLR stream.
 * @param PunctVect : Puncturing vector.
 * @return none
 */
//static void SoftDepuncturing( float *InLLRs, uint8_t *PunctVect ){
//  uint32_t j;
//  uint8_t RdIdxPunc = 2*Rc-1;                                /** Reading index within punturing vector */
//  uint32_t RdIdx = PunBitLen-1;                              /** Reading index within LLR array */
//  for ( j=DepBitLen; j>0; j-- ){
//    if ( PunctVect[RdIdxPunc] == 1 ){
//      InLLRs[j-1] = InLLRs[RdIdx];
//      RdIdx--;
//    } else {
//      InLLRs[j-1] = 0;                                /** Each erasure LLR restored has 0-value */
//    }
//    if ( RdIdxPunc > 0 ){
//      RdIdxPunc--;
//    } else {
//      RdIdxPunc = 2*Rc-1;
//    }
//  }
//}
