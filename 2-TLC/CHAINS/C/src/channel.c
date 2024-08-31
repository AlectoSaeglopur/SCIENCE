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



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

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
error_t Channel_BSC( const byte_stream_t * inStream, byte_stream_t *outStream, float Peb, const uint32_t * pSeed )
{
  error_t retErr = ERR_NONE;
  uint32_t j;
	uint32_t byteIdx;
	uint8_t bitIdx;

	if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != outStream) && (NULL != outStream->pBuf))
  {
    if (inStream->len == outStream->len)
    {
      memcpy(outStream->pBuf,inStream->pBuf,inStream->len);
      if (NULL == pSeed)
      {
        srand(time(NULL));															  /** link random seed to current time */
      }
      else
      {
        srand(*pSeed);                                    /** link random seed to provided argument */
      }
      for (j=0; j<inStream->len; j++)
      {
        if ((float)rand()/RAND_MAX < Peb)
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
 * @brief Function for simulating Additive White Gaussian Noise (AWGN) channel using Box-Muller method.
 * @param IoStream : I/O complex stream to be read/written.
 * @return none
 */
//void ChanAWGN( complex *IoStream ){
//	uint32_t j;
//	float U1, U2;																/** Random variables uniformly distributed between 0 and 1 */
//	float ReN, ImN;																/** Random variables normally distributed as (Mu,SqSigma) */
//	float Mu = 0;																/** Noise mean value */
//	float SgnPwr = GetCpxSgnPower(IoStream,SymLen);								/** Signal mean power (linear) */
//	float SNR = EbN0+10*log10(L);												/** Signal-to-noise-ratio [dB] */
//	float SqSigma = SgnPwr*pow(10,-SNR/10);										/** Target noise variance (N0) */
//	srand(time(NULL));															/** Link random seed to current time */
//	for ( j=0; j<SymLen; j++ ){		
//		U1 = rand()*(1.0/RAND_MAX);
//		U2 = rand()*(1.0/RAND_MAX);
//		ReN = sqrt(-2*log(U1))*cos(2*M_PI*U2)*sqrt(SqSigma/2)+Mu;
//		ImN = sqrt(-2*log(U1))*sin(2*M_PI*U2)*sqrt(SqSigma/2)+Mu;
//		if ( (fabs(ReN) != INFINITY) && (fabs(ImN) != INFINITY) ){
//			IoStream[j].Re += ReN;
//			IoStream[j].Im += ImN;
//		}
//	}
//}


/**
 * @brief Function for calculating mean power of an input complex stream.
 * @param Stream : Input complex stream.
 * @param Len : Complex stream length.
 * @return signal power
 */
//float GetCpxSgnPower( complex *Stream, uint32_t Len ){
//	uint32_t j;
//	float Energy = 0;
//	for ( j=0; j<Len; j++ ){
//		Energy += pow(Stream[j].Re,2)+pow(Stream[j].Im,2);
//	}
//	return Energy/(float)Len;
//}
