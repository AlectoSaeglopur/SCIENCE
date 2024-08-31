/**
 * @file debug.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Debug library
 * 
 * Library containing all debug functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "debug.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static bool IsSrcLenValid( len_t lenBy );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for filling input buffer with random bytes. </i>
 * 
 * @param ioStream: i/o stream to be filled
 * @param len: i/o buffer length [B]
 * @param pSeed: poiter to seed value
 * 
 * @return error ID
 */
error_t Debug_GenerateRandomBytes( byte_stream_t * ioStream, const uint32_t * pSeed )
{
	uint32_t j;
  error_t retErr = ERR_NONE;

  if ((NULL != ioStream) && ((NULL != ioStream->pBuf)))
  {
    if (NULL == pSeed)
    {
      srand(time(NULL));															/** link random seed to current time */
    }
    else
    {
      srand(*pSeed);                                  /** link random seed to provided argument */
    }
    
    for (j=0; j<ioStream->len; j++)
    {
      ioStream->pBuf[j] = (uint8_t)rand();
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for printing on terminal a byte buffer content (in hexadecimal format). </i>
 * 
 * @param inBuffer : input byte buffer to be printed
 * @param len : input buffer length [B]
 * @param label : label ID
 * 
 * @return error ID
 */
error_t Debug_PrintBytes( const byte_stream_t * inStream, print_label_t label )
{
  error_t retErr = ERR_NONE;

  if ((NULL != inStream) && (NULL != inStream->pBuf))
  {
    switch (label)
    {
      case PID_TX_SRC:
        printf(" * TX SOURCE BYTES (%d)\n\t",inStream->len);
        break;

      case PID_RX_SRC:
        printf(" * RX SOURCE BYTES (%d)\n\t",inStream->len);
        break;

      case PID_TX_CNVCOD:
        printf(" * TX CONVOLUTIONAL CODED BYTES (%d)\n\t",inStream->len);
        break;

      case PID_RX_CNVCOD:
        printf(" * RX CONVOLUTIONAL CODED BYTES (%d)\n\t",inStream->len);
        break;

      default:
        retErr = ERR_INV_PRINTID;
        break;
    }

#ifdef VERBOSE
	len_t j;

	for (j=0; j<inStream->len; j++)
  {
		printf("%2X ",inStream->pBuf[j]);
		if (((PID_NCOLS-1) == (j%PID_NCOLS)) && (j<(inStream->len-1)))
    {
			printf("\n\t");
		}
	}
	printf("\n");
#endif

	printf("\n");
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for printing on terminal all simulation parameters. </i>
 * 
 * @param len : source buffer length [B]
 * 
 * @return error ID
 */
error_t Debug_PrintParameters( len_t len )
{
  error_t retErr = ERR_NONE;

  if (IsSrcLenValid(len))
  {
    printf("\n # PARAMETERS");
    printf("\n    * Convolutional Coding : \n");
    printf("      - Klen = %d\n",CC_KLEN);
    printf("      - Rc = %d/%d\n",CC_RATE,CC_RATE+1);
    printf("      - VDM = ");
    if ( CC_VITDM == CC_VITDM_HARD )
    {
      printf("Hard");
    }
    else if ( CC_VITDM == CC_VITDM_HARD )
    {
      printf("Soft");
    }
    else
    {
      printf("N/A");
    }
    printf("\n    * Modulation : \n");
  //  if ( ModType == PSK )
  //  	printf("PSK | ");
  //  else if ( ModType == QAM )
  //  	printf("QAM | ");
  //  printf("M = %d",M);
  //  printf("\n\t- Channel : ");
  //  printf("AWGN | ");
  //  printf("Eb/N0 = %1.1f dB",EbN0);
    printf("\n\n");
  }
  else
  {
    retErr = ERR_INV_BUFFER_SIZE;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief Function for estimating and printing on terminal the number of mismatched bits between two byte streams.
 * 
 * @param inStreamA : 1st input stream
 * @param inStreamB : 2nd input stream
 * @param label : label ID
 * 
 * @return error ID
 */
error_t Debug_CheckWrongBits( const byte_stream_t * inStreamA, const byte_stream_t * inStreamB, print_label_t label )
{
  error_t retErr = ERR_NONE;
  const len_t bitLen = inStreamA->len<<BY2BI_SHIFT;
  len_t bitErrCnt = 0;
  len_t minErrDist = bitLen;
  len_t curErrDist = 0;
  len_t j;
  len_t byteIdx;
	uint8_t bitIdx;

	if ((NULL != inStreamA) && (NULL != inStreamA->pBuf) && (NULL != inStreamB) && (NULL != inStreamB->pBuf))
  {
    if (inStreamA->len == inStreamB->len)
    {
      for (j=0; j<bitLen; j++)
      {
        byteIdx = j>>BY2BI_SHIFT;
        bitIdx = (uint8_t)(j&LSBYTE_MASK);
        curErrDist++;
        if ((((inStreamA->pBuf[byteIdx])>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK) !=
            (((inStreamB->pBuf[byteIdx])>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK))
        {
          bitErrCnt++;
          if ((bitErrCnt > 1) && (curErrDist < minErrDist))
          {
            minErrDist = curErrDist;
          }
          curErrDist = 0;
        }
      }
      if (bitErrCnt < 2)
      {
        minErrDist = 0;
      }

      switch (label)
      {
        case PID_TX_CNVCOD:
        case PID_RX_CNVCOD:
          printf(" * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\n\n",bitErrCnt,bitLen,minErrDist);
          break;

        case PID_TX_SRC:
        case PID_RX_SRC:
          printf(" * Errors at source level: %u out of %u bits (MD = %u)\n\n",bitErrCnt,bitLen,minErrDist);
          break;

        default:
          retErr = ERR_INV_PRINTID;
          break;
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
 * @brief Function for writing byte buffer content into CSV file.
 * 
 * @param inStream : input stream
 * @param label : label ID
 * 
 * @return error ID
 */
error_t Debug_WriteBytesToCsv( const byte_stream_t * inStream, print_label_t label )
{
  error_t retErr = ERR_NONE;
  FILE * fid = NULL;
	len_t j;
  
  if ((NULL != inStream) && (NULL != inStream->pBuf))
  {
    switch (label)
    {
      case PID_TX_SRC:
        fid = fopen("txSrcBytes.csv","w");
        break;

      case PID_RX_SRC:
        fid = fopen("rxSrcBytes.csv","w");
        break;

      default:
        retErr = ERR_INV_PRINTID;
        break;
    }

    if ((ERR_NONE == retErr) && (NULL != fid))
    {
      for (j=0; j<inStream->len; j++)
      {
        fprintf(fid,"%d",inStream->pBuf[j]);
        if (j < inStream->len-1)
        {
          fprintf(fid,",");
        }
      }
      fclose(fid);
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return retErr;
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

/**
 * @brief <i> Function for checking source stream length correctness. </i>
 * 
 * @param lenBy : source buffer length [B]
 * 
 * @return validity outcome
 */
static bool IsSrcLenValid( len_t lenBy )
{
  bool bRet = false;
  len_t lenBi = lenBy<<BY2BI_SHIFT;
  
  if (((lenBi%CC_RATE) == 0) &&                                               /** source bit length shall be divisible by code rate denominator */
      (((lenBi/CC_RATE*(1+CC_RATE))%NUM_BITS_PER_BYTE) == 0))                 /** coded bit length shall be a multiple of NUM_BITS_PER_BYTE */
  {
    bRet = true;
  }

  return bRet;
}






/**
 * @brief Function for checking the parameters correctness.
 * @return none
 */
//void CheckParam( void ){
//	if( (K < 3) || (K>8) ){
//		printf("\n Error-CC : Invalid constrain length!\n");
//		exit(1);
//	} else if ( (Rc != RATE_12) && (Rc != RATE_23) && (Rc != RATE_34) && (Rc != RATE_56) && (Rc != RATE_78) ){
//		printf("\n Error-CC : Invalid code rate!\n");
//		exit(1);
//	} else if ( (SrcBytLen < 1) || (SrcBytLen%Rc != 0) ){
//		printf("\n Error-CC : Invalid info stream length\n");
//		exit(1);
//	} else if ( (VitDecMth != HARD) && (VitDecMth != SOFT) ){
//		printf("\n Error-CC : Invalid decoding method!\n");
//		exit(1);
//	} else if ( (ModType != PSK) && (ModType != QAM) ){
//		printf("\n Error-MOD : Invalid modulation type!\n");
//		exit(1);
//	} else if ( (ModType == PSK) && (log2(M) != round(log2(M))) ){
//		printf("\n Error-MOD : Invalid modulation order!\n");
//		exit(1);
//	} else if ( (ModType == QAM) && ((log2(M) != round(log2(M))) || (L % 2)) ){
//		printf("\n Error-MOD : Invalid modulation order!\n");
//		exit(1);
//	} else if ( PunBitLen % L ){
//		printf("\n Error-MOD : Invalid info stream length\n");
//		exit(1);
//	}
//}






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


/**
 * @brief Function for printing on terminal a complex symbol stream.
 * @param Bytes : Input symbol stream to be printed.
 * @param Len : Stream length.
 * @param Label : TX/RX ID label.
 * @return none
 */
//void PrintSym( complex *Symbols, uint32_t Len, uint8_t Label ){
//	uint32_t j;
//	if ( Label == PRID_TXSYMB ){
//		printf(" * TX SYMBOLS\n\t");
//	} else if ( Label == PRID_RXSYMB ){
//		printf(" * RX SYMBOLS\n\t");
//	}
//	for ( j=0; j<Len; j++){
//		if ( Symbols[j].Re >= 0){
//			printf("+");
//		}
//		printf("%1.2f",Symbols[j].Re);
//
//		if ( Symbols[j].Im >= 0){
//			printf("+");
//		}
//		printf("%1.2fi | ",Symbols[j].Im);
//
//		if ( (j%4 == 3) && (j<(Len-1)) ) {
//			printf("\n\t");
//
//		}
//	}
//	printf("\n\n");
//}


/**
 * @brief Function for printing on terminal a float LLR stream.
 * @param Bytes : Input LLR stream to be printed.
 * @param Len : Stream length.
 * @return none
 */
//void PrintLLRs( float *LLRs, uint32_t Len ){
//	uint32_t j;
//	printf(" * SOFT DEMAPPING LLR VALUES\n\t");
//	for ( j=0; j<Len; j++){
//		if ( LLRs[j] >= 0){
//			printf("+");
//		}
//		printf("%1.3f ",LLRs[j]);
//		if ( (j%8 == 7) && (j<(Len-1)) ) {
//			printf("\n\t");
//		}
//	}
//	printf("\n\n");
//}


/**
 * @brief Function for printing on terminal a convultional coding trellis diagram.
 * @param ConvDiagr : Pointer to trellis diagram to be printed.
 * @return none
 */
//void PrintConvDiagr( trellis *ConvDiagr ){
//	uint8_t j;
//	for ( j=0; j<N_TSTAT; j++ ){
//		printf("State#%2d",j);
//		printf("\t0 -> %d %d |",ConvDiagr->States[j].OutBits[0],ConvDiagr->States[j].NextState[0]);
//		printf(" 1 -> %d %d\n",ConvDiagr->States[j].OutBits[1],ConvDiagr->States[j].NextState[1]);
//	}
//	printf("\n");
//}


/**
 * @brief Function for printing on terminal a constellation mapping table.
 * @param MapTable : Pointer to mapping table to be printed.
 * @return none
 */
//void PrintTable( phasemap *MapTable ){
//	uint8_t j;
//	printf(" * MAPPING TABLE\n\t");
//	for ( j=0; j<M; j++){
//		printf("%2d: ",MapTable->Bits[j]);
//		if ( MapTable->Symbs[j].Re >= 0){
//			printf("+");
//		}
//		printf("%1.2f",MapTable->Symbs[j].Re);
//
//		if ( MapTable->Symbs[j].Im >= 0){
//			printf("+");
//		}
//		printf("%1.2fi",MapTable->Symbs[j].Im);
//
//		if ( (j%4 == 3) && (j<(M-1)) ) {
//			printf("\n\t");
//		} else if ( j < M-1 ){
//			printf(" | ");
//		}		
//	}
//	printf("\n\n");
//}


 /**
 * @brief Function for writing input symbol stream into .csv file.
 * @param Symbols : Input symbol stream to stored.
 * @param Len : Stream length.
 * @param Label : TX/RX ID label.
 * @return none
 */
//void WriteSymCsv( complex *Symbols, uint32_t Len, uint8_t Label ){
//	uint32_t j;
//	FILE *fid;
//	if ( Label == PRID_TXSYMB ){
//		fid = fopen("TxCpxSymbs.csv","w");
//	} else if ( Label == PRID_RXSYMB ){
//		fid = fopen("RxCpxSymbs.csv","w");
//	}
//	if (fid != NULL){
//		for ( j=0; j<Len; j++ ){
//			fprintf(fid,"%1.4f,%1.4f",Symbols[j].Re,Symbols[j].Im);
//			if ( j < Len-1 ){
//				fprintf(fid,",");
//			}
//		}
//	}
//	fclose(fid);
//}
