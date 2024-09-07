/**
 * @file channel.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Channel library
 * 
* Library containing channel functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "channel.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static float GetComplexSgnPower( const complex_stream_t * inStream );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief Function for retrieving and listing channel parameters into dedicated structure.
 * 
 * @param ioParams : pointer to i/o parameters structure to be filled
 * 
 * @return error ID
 */
error_t Channel_ListParameters( chan_par_t * ioParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != ioParams)
  {
    ioParams->type = CHAN_TYPE;
    ioParams->bps = MOD_BPS;
    ioParams->seed = CHAN_SEED;

    if (CHAN_BSC == CHAN_TYPE)
    {
      ioParams->Peb = BSC_PEB;
    }
    else
    {
      ioParams->EbN0 = AWGN_EBN0;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for applying Binary Symmetric Channel (BSC) corruption.
 * 
 * @param inStream : input stream
 * @param outStream : output stream
 * @param Peb : bit error probability
 * @param pSeed : poiter to seed value
 * 
 * @return error ID
 */
error_t Channel_BSC( const byte_stream_t * inStream, byte_stream_t *outStream, const chan_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint32_t j;
  uint32_t byteIdx;
  uint8_t bitIdx;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != outStream) && (NULL != outStream->pBuf))
  {
    if (inStream->len == outStream->len)
    {
      if (CHAN_BSC == pParams->type)
      {
        memcpy(outStream->pBuf,inStream->pBuf,inStream->len);
        if (SEED2TIME == pParams->seed)
        {
          srand(time(NULL));                                      /** link random seed to current time */
        }
        else
        {
          srand(pParams->seed);                                   /** link random seed to provided argument */
        }
        for (j=0; j<inStream->len; j++)
        {
          if ((float)rand()/RAND_MAX < pParams->Peb)
          {
            byteIdx = (j>>BY2BI_SHIFT);
            bitIdx  = BITIDX_1LAST-(uint8_t)(j&LSBYTE_MASK);
            if (outStream->pBuf[byteIdx] & (LSBIT_MASK<<bitIdx))
            {
              outStream->pBuf[byteIdx] &= ~(LSBIT_MASK<<bitIdx);
            }
            else
            {
              outStream->pBuf[byteIdx] |= (LSBIT_MASK<<bitIdx);
            }
          }
        }
      }
      else
      {
        retErr = ERR_INV_CHANNEL_TYPE;
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
 * @brief Function for applying Additive White Gaussian Noise (AWGN) corruption based on Box-Muller method.
 * 
 * @param inStream : input stream
 * @param outStream : output stream
 * @param EbN0 : Eb/N0 (adjusted on signal power level)
 * @param pParams : poiter to parameters structure
 * 
 * @return error ID
 */
error_t Channel_AWGN( const complex_stream_t * inStream, complex_stream_t * outStream, const chan_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const float mu = 0;                                           /** noise mean value */
  const float sgnPwr = GetComplexSgnPower(inStream);            /** signal average power [lin] */
  const float SNR = pParams->EbN0+10*log10(pParams->bps);       /** signal-to-noise-ratio [dB] */
  const float SqSigma = sgnPwr*pow(10,-SNR/10);                 /** target noise variance (N0) */
  float nU1, nU2;                                               /** random variables uniformly distributed between 0 and 1 */
  float nReN, nIm;                                              /** random variables normally distributed as Mu|Sigma2 */
  len_t j;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != outStream) && (NULL != outStream->pBuf))
  {
    if (inStream->len == outStream->len)
    {
      if (CHAN_AWGN == pParams->type)
      {
        memcpy(outStream->pBuf,inStream->pBuf,sizeof(complex_t)*inStream->len);
        if (SEED2TIME == pParams->seed)
        {
          srand(time(NULL));                                    /** link random seed to current time */
        }
        else
        {
          srand(pParams->seed);                                 /** link random seed to provided argument */
        }
        for (j=0; j<inStream->len; j++)
        {    
          nU1 = rand()*(1.0/RAND_MAX);
          nU2 = rand()*(1.0/RAND_MAX);
          nReN = sqrt(-2*log(nU1))*cos(2*MATH_PI*nU2)*sqrt(SqSigma/2)+mu;
          nIm = sqrt(-2*log(nU1))*sin(2*MATH_PI*nU2)*sqrt(SqSigma/2)+mu;
          if ((INFINITY != fabs(nReN)) && (INFINITY !=fabs(nIm)))
          {
            outStream->pBuf[j].re += nReN;
            outStream->pBuf[j].im += nIm;
          }
        }
      }
      else
      {
        retErr = ERR_INV_CHANNEL_TYPE;
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



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

/**
 * @brief Function for estimating the average power of a complex stream.
 * 
 * @param Stream : Input complex stream.
 * @param Len : Complex stream length.
 * 
 * @return signal linea average power
 */
static float GetComplexSgnPower( const complex_stream_t * inStream )
{
  float energy = 0;
  len_t j;

  for (j=0; j<inStream->len; j++)
  {
    energy += inStream->pBuf[j].re*inStream->pBuf[j].re+ \
              inStream->pBuf[j].im*inStream->pBuf[j].im;
  }

  return (energy/inStream->len);
}
