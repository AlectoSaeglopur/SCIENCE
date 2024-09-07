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
static error_t SoftDepuncturer( float * ioBuffer, len_t inLenBi, len_t outLenBi, const uint8_t * punctVect, const cc_par_t * pParams );
static float EstimateEuclideanDist( const float * inBuf, uint8_t trlByte, uint8_t erasMask );
static uint8_t FindMinSurvPathSoft( const cc_soft_dec_info_t * inPaths);



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief Function for retrieving and listing convolution encoding parameters into dedicated structure.
 * 
 * @param ioParams : pointer to i/o parameters structure to be filled
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
  const len_t punLenBy = punLenBi>>BY2BI_SHIFT;                                     /** expected punctured coded length [b] */
  cc_encoder_info_t encInfo;
  byte_stream_t tmpStream = {.len = unpLenBy, .id = memory_type_byte};
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
    Memory_AllocateStream(&tmpStream,unpLenBy,memory_type_byte);

    if (punLenBy == outStream->len)
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
        tmpStream.pBuf[byteIdx] |= (ComputeEncBit(encState,encInfo.connVect[0],
          pParams->kLen)<<(BITIDX_1LAST-bitIdx));
        tmpStream.pBuf[byteIdx] |= (ComputeEncBit(encState,encInfo.connVect[1],
          pParams->kLen)<<(BITIDX_2LAST-bitIdx));
      }

      if (CC_RATE_12 != pParams->cRate)
      {                                                                              /**  apply puncturing if selected Rc is higher than 1/2 */
        for (j=0; j<unpLenBi; j++)
        {
          byteIdx = j>>BY2BI_SHIFT;
          bitIdx = j&LSBYTE_MASK;
          rdBit = (tmpStream.pBuf[byteIdx]>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK;      /** j-th bit of unpunctured output stream */
          if (encInfo.puncVect[j%(CC_NBRANCHES*pParams->cRate)])                    /** check if puncturation has to applied now */
          {
            byteIdx = wrIdx>>BY2BI_SHIFT;
            bitIdx = BITIDX_1LAST-(uint8_t)(wrIdx&LSBYTE_MASK);
            wrIdx++;
            if (0 == rdBit)
            {
              tmpStream.pBuf[byteIdx] &= ~(LSBIT_MASK<<bitIdx);
            }
            else
            {
              tmpStream.pBuf[byteIdx] |= (LSBIT_MASK<<bitIdx);
            }
          }
        }

        if (punLenBi != wrIdx)                                                      /** check if computed and theoretical punctured length match */
        {
          retErr = ERR_INV_BUFFER_SIZE;
        }
      }

      if (ERR_NONE == retErr)
      {
        memcpy(outStream->pBuf,tmpStream.pBuf,outStream->len);                      /** copy temporary buffer content to output one */
      }
    }
    else
    {
      retErr = ERR_INV_BUFFER_SIZE;
    }

    Memory_FreeStream(&tmpStream,memory_type_byte);
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
 * @param inStream : input stream
 * @param outStream : output stream
 * @param pParams : coding parameters
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
  
  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != outStream) && 
      (NULL != outStream->pBuf) && (NULL != pParams))
  {
    RetrieveConnectorPuncturationVectors(&encInfo,pParams);                                     /** retrieve convolutional encoder info */
    ComputeTrellisDiagram(&trDiagr,encInfo.connVect,pParams);                                   /** compute convolutional decoder trellis diagram */
    memcpy(tmpStream,inStream->pBuf,inStream->len);
    curPaths.iter[0] = 1;                                                                       /** enable only all-zero state at the beginning */

    if (CC_RATE_12 == pParams->cRate)                                                           /** check if depuncturing is needed */
    {
      erasMask = CC_INMASK;                                                                     /** use no-erasure mask for no-puncturing case */
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
            nextSt = trDiagr.trSt[j].nextSt[hypIdx];                                            /** compute next state assuming hypIdx input bit */
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
            outStream->pBuf[byteIdx] &= ~(LSBIT_MASK<<(BITIDX_1LAST-bitIdx));                   /** set output bit to '0' */
          }
          else
          {
            outStream->pBuf[byteIdx] |= (LSBIT_MASK<<(BITIDX_1LAST-bitIdx));                    /** set output bit to '1' */
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


/**
 * @brief Function for convolutional soft-decoding by implementing Viterbi algorithm (including depuncturing).
 * 
 * @param inStream : input stream
 * @param outStream : output stream
 * @param pParams : coding parameters
 * 
 * @return error ID
 */
error_t CnvCod_SoftDecoder( const float_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const len_t outLenBi = outStream->len<<BY2BI_SHIFT;
  const len_t unpLenBi = CC_NBRANCHES*outLenBi;
  const len_t punLenBi = inStream->len;
  float tmpStream[unpLenBi];
  cc_soft_dec_info_t curPaths = {.iter={0}, .dist={0.0}, .path={{0}}};
  cc_soft_dec_info_t prevPaths;
  cc_encoder_info_t encInfo;
  cc_trellis_t trDiagr;
  float eucliDist, candDist;
  len_t curIdx, wrIdx, finIdx;
  len_t byteIdx;
  len_t i;
  uint8_t nextSt, minDistState;
  uint8_t stateDep, stateArr;
  uint8_t j, bitIdx, hypIdx;
  uint8_t erasMask;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != outStream) &&
      (NULL != outStream->pBuf) && (NULL != pParams))
  {
    RetrieveConnectorPuncturationVectors(&encInfo,pParams);                                     /** retrieve convolutional encoder info */
    ComputeTrellisDiagram(&trDiagr,encInfo.connVect,pParams);                                   /** compute convolutional decoder trellis diagram */
    memcpy(tmpStream,inStream->pBuf,sizeof(float)*inStream->len);
    curPaths.iter[0] = 1;                                                                       /** enable only the all-zero state at the beginning */

    if (CC_RATE_12 == pParams->cRate)
    {
      erasMask = CC_INMASK;                                                                     /** use no-erasure mask for no-puncturing case */
    }
    else
    {
      SoftDepuncturer(tmpStream,punLenBi,unpLenBi,encInfo.puncVect,pParams);                    /** apply depuuncturing if needed */
    }

    for (i=CC_NBRANCHES; i<outLenBi+CC_NBRANCHES; i++)
    {
      curIdx = CC_NBRANCHES*(i-CC_NBRANCHES);
      prevPaths = curPaths;

      if (CC_RATE_12 != pParams->cRate)
      {
        erasMask = 0;
        erasMask |= (encInfo.puncVect[curIdx%(CC_NBRANCHES*pParams->cRate)]<<1);
        erasMask |= encInfo.puncVect[(curIdx+1)%(CC_NBRANCHES*pParams->cRate)];                 /** estimate specific erasure mask if depuncturing has been applied */
      }

      for (j=0; j<CC_NTRELSTATES; j++)
      {
        if (prevPaths.iter[j] == i-1)                                                           /** check if j-th state was active in the previous iteration */
        {
          for (hypIdx = 0; hypIdx<CC_NBRANCHES; hypIdx++)
          {
            eucliDist = EstimateEuclideanDist(&tmpStream[curIdx],
                          trDiagr.trSt[j].outBits[hypIdx],erasMask);                            /** compute Euclidean distance assuming hypIdx-value input bit */
            nextSt = trDiagr.trSt[j].nextSt[hypIdx];                                            /** compute trellis next state assuming hypIdx-value input bit */

            if (curPaths.iter[nextSt] < i)                                                      /** iIf there's not yet a survivor path for nextSt state at i-th cycle */
            {
              curPaths.iter[nextSt] = i;                                                        /** update the state iteration counter */
              curPaths.dist[nextSt] = prevPaths.dist[j]+eucliDist;                              /** update the state distance */
              if (i-1 < CC_MEM_DIM)
              {
                finIdx = i-CC_NBRANCHES;
              }
              else
              {
                finIdx = CC_MEM_DIM-1;
              }
              for (wrIdx = 0; wrIdx < finIdx; wrIdx++)                                          /** update the state path among previous states */
              {
                curPaths.path[nextSt][wrIdx] = prevPaths.path[j][wrIdx];
              }
              curPaths.path[nextSt][finIdx] = j;
            }
            else                                                                                /** if a survivor path for nextSt state at i-th cycle already exists, check if the new candidate is better */
            {
              candDist = prevPaths.dist[j]+eucliDist;
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

      if (outLenBi == i-1)                                                                      /** if input bit stream is over, flush the decoder memory and extract the final info bits */
      {
        minDistState = FindMinSurvPathSoft(&curPaths);                                          /** look for the minimum distance survivor path */
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
          stateDep = curPaths.path[minDistState][wrIdx];                                        /** departure state */
          if (wrIdx == finIdx-1)
          {
            stateArr = minDistState;                                                            /** arrival state */
          }
          else
          {
            stateArr = curPaths.path[minDistState][wrIdx+1];
          }
          byteIdx = (outLenBi-finIdx+wrIdx)>>BY2BI_SHIFT;
          bitIdx = (outLenBi-finIdx+wrIdx)&LSBYTE_MASK;
          if (trDiagr.trSt[stateDep].nextSt[0] == stateArr)
          {
            outStream->pBuf[byteIdx] &= ~(LSBIT_MASK<<(BITIDX_1LAST-bitIdx));                   /** set output bit to '0' */
          }
          else
          {
            outStream->pBuf[byteIdx] |= (LSBIT_MASK<<(BITIDX_1LAST-bitIdx));                    /** set output bit to '1' */
          }
        }
      }
      else if (i-1 >= CC_MEM_DIM)                                                               /** if input bit stream is not over but memory is full, extract the oldest info bit */
      {
        minDistState = FindMinSurvPathSoft(&curPaths);
        stateDep = curPaths.path[minDistState][0];
        stateArr = curPaths.path[minDistState][1];
        byteIdx = (i-CC_MEM_DIM-1)>>BY2BI_SHIFT;
        bitIdx = (uint8_t)((i-CC_MEM_DIM-1)&LSBYTE_MASK);
        if (trDiagr.trSt[stateDep].nextSt[0] == stateArr)
        {
          outStream->pBuf[byteIdx] &= ~(LSBIT_MASK<<(BITIDX_1LAST-bitIdx));                     /** set output bit to '0' */
        }
        else
        {
          outStream->pBuf[byteIdx] |= (LSBIT_MASK<<(BITIDX_1LAST-bitIdx));                      /** set output bit to '1' */
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
 * @brief Function for retrieving connection and puncturation vectors as a function of the selected parameters.
 * 
 * @param ioInfo : pointer to i/o structure to be filled
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
 * @brief Function to hard-depuncture a byte stream to base code rate.
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
 * @brief Function to find the hard survivor path with minimum distance.
 * 
 * @param inPaths : current Viterbi paths
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
 * @brief Function to soft-depuncture an LLR stream to base code rate.
 * 
 * @param ioBuffer : i/o buffer
 * @param inLenBi : input/punctured length [b]
 * @param outLenBi : output/unpunctured length [b]
 * @param punctVect : puncturing vector
 * @param pParams : coding parameters
 * 
 * @return error ID
 */
static error_t SoftDepuncturer( float * ioBuffer, len_t inLenBi, len_t outLenBi, const uint8_t * punctVect, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  len_t i = inLenBi-1;                                                    /** reading index over LLR array */
  len_t j;
  uint8_t k = CC_NBRANCHES*pParams->cRate-1;                              /** reading index within punturing vector */
  
  if (NULL != ioBuffer)
  {
    for (j=outLenBi; j>0; j--)
    {
      if (1 == punctVect[k])
      {
        ioBuffer[j-1] = ioBuffer[i];
        i--;
      }
      else
      {
        ioBuffer[j-1] = 0;                                                /** each erasure LLR restored has 0-value */
      }
      if (k > 0)
      {
        k--;
      }
      else
      {
        k = CC_NBRANCHES*pParams->cRate-1;
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
 * @brief Function for calculating Euclidean distance between LLR values and specific trellis state.
 * 
 * @param inBuf : input LLR buffer
 * @param trlByte : output bits for specific trellis state
 * @param erasMask : depuncturing erasure mask
 * 
 * @return estimated Euclidean distance
 */
static float EstimateEuclideanDist( const float * inBuf, uint8_t trlByte, uint8_t erasMask )
{
  uint8_t j;
  float Dist = 0;

  if (NULL != inBuf)
  {
    for (j=0; j<CC_NBRANCHES; j++)
    {
      if ((erasMask>>(1-j))&LSBIT_MASK)
      {
        Dist += fabs(CC_NBRANCHES*((float)((trlByte>>(1-j))&LSBIT_MASK))-1-inBuf[j]);
      }
    }
  }
  
  return Dist;
}


/**
 * @brief Function to find the soft survivor path with minimum distance.
 * 
 * @param InPaths : current Viterbi paths
 * 
 * @return index of minimum distance trellis state
 */
static uint8_t FindMinSurvPathSoft( const cc_soft_dec_info_t * inPaths)
{
  float minDist;
  uint8_t minStIdx;
  uint8_t j;

  if (NULL != inPaths)
  {
    minDist = inPaths->dist[0];
    minStIdx = 0;
    for (j=1; j<CC_NTRELSTATES; j++)
    {
      if ((inPaths->iter[j]>0) && (inPaths->dist[j]<minDist))
      {
        minDist = inPaths->dist[j];
        minStIdx = j;
      }
    }
  }

  return minStIdx;
}
