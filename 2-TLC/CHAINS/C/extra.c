
/**
 * @file extra.c
 * @author Filippo Valmori
 * @date 14/12/2018
 * @brief Implementation of simulation and debug functions.
 */

/****************/
/*** INCLUDES ***/
/****************/

#include "extra.h"



/******************/
/*** PROTOTYPES ***/
/******************/

static float GetCpxSgnPower( complex *Stream, uint32_t Len );



/*****************/
/*** FUNCTIONS ***/
/*****************/

/**
 * @brief Function for checking the parameters correctness.
 * @return none
 */
void CheckParam( void ){
	if( (K < 3) || (K>8) ){
		printf("\n Error-CC : Invalid constrain length!\n");
		exit(1);
	} else if ( (Rc != RATE_12) && (Rc != RATE_23) && (Rc != RATE_34) && (Rc != RATE_56) && (Rc != RATE_78) ){
		printf("\n Error-CC : Invalid code rate!\n");
		exit(1);
	} else if ( (SrcBytLen < 1) || (SrcBytLen%Rc != 0) ){
		printf("\n Error-CC : Invalid info stream length\n");
		exit(1);
	} else if ( (VitDecMth != HARD) && (VitDecMth != SOFT) ){
		printf("\n Error-CC : Invalid decoding method!\n");
		exit(1);
	} else if ( (ModType != PSK) && (ModType != QAM) ){
		printf("\n Error-MOD : Invalid modulation type!\n");
		exit(1);
	} else if ( (ModType == PSK) && (log2(M) != round(log2(M))) ){
		printf("\n Error-MOD : Invalid modulation order!\n");
		exit(1);
	} else if ( (ModType == QAM) && ((log2(M) != round(log2(M))) || (L % 2)) ){
		printf("\n Error-MOD : Invalid modulation order!\n");
		exit(1);
	} else if ( PunBitLen % L ){
		printf("\n Error-MOD : Invalid info stream length\n");
		exit(1);
	}
}


/**
 * @brief Function for printing chosen parameters on terminal.
 * @return none
 */
void PrintParam( void ){
	printf("\n * PARAMETERS");
	printf("\n\t* Convolutional Coding : ");
	printf("K = %d | ",K);
	printf("Rc = %d/%d | ",Rc,Rc+1);
	if ( VitDecMth == HARD )
		printf("Hard");
	else if ( VitDecMth == SOFT )
		printf("Soft");
	printf("\n\t* Modulation : ");
	if ( ModType == PSK )
		printf("PSK | ");
	else if ( ModType == QAM )
		printf("QAM | ");
	printf("M = %d",M);
	printf("\n\t- Channel : ");
	printf("AWGN | ");
	printf("Eb/N0 = %1.1f dB",EbN0);
	printf("\n\n");
}


/**
 * @brief Function for filling input array with random bytes.
 * @param IoBytes : I/O byte stream to be written.
 * @return none
 */
void RandBytGen( uint8_t *IoBytes ){
	uint32_t j;
	srand(time(NULL));															/** Link random seed to current time */
	for ( j=0; j<SrcBytLen; j++ ){
		IoBytes[j] = (uint8_t)rand();
	}
}


/**
 * @brief Function for simulating a Binary Symmetric Channel (BSC).
 * @param InByt : Input byte stream before channel.
 * @param OutByt : Output byte stream after channel.
 * @param Peb : Channel error probability.
 * @return none
 */
void ChanBSC( uint8_t *InByt, uint8_t *OutByt, float Peb ){
	uint32_t j, ByteIdx;
	uint8_t BitIdx;
	uint8_t Mask = 0x01;
	if ( (InByt != NULL) && (OutByt != NULL) ){
		memcpy(OutByt,InByt,PunBytLen);
		srand(time(NULL));														/** Link random seed to current time */
		for ( j=0; j<PunBitLen; j++ ){
			if ( (float)rand( )/(float)RAND_MAX < Peb ){
				ByteIdx = (j>>3);
				BitIdx  = 7-(uint8_t)(j&0x0007);
				if ( OutByt[ByteIdx] & (Mask<<BitIdx) ){
					OutByt[ByteIdx] &= ~(Mask<<BitIdx);
				} else {
					OutByt[ByteIdx] |= (Mask<<BitIdx);
				}
			}
		}
	}
}


/**
 * @brief Function for simulating Additive White Gaussian Noise (AWGN) channel using Box-Muller method.
 * @param IoStream : I/O complex stream to be read/written.
 * @return none
 */
void ChanAWGN( complex *IoStream ){
	uint32_t j;
	float U1, U2;																/** Random variables uniformly distributed between 0 and 1 */
	float ReN, ImN;																/** Random variables normally distributed as (Mu,SqSigma) */
	float Mu = 0;																/** Noise mean value */
	float SgnPwr = GetCpxSgnPower(IoStream,SymLen);								/** Signal mean power (linear) */
	float SNR = EbN0+10*log10(L);												/** Signal-to-noise-ratio [dB] */
	float SqSigma = SgnPwr*pow(10,-SNR/10);										/** Target noise variance (N0) */
	srand(time(NULL));															/** Link random seed to current time */
	for ( j=0; j<SymLen; j++ ){		
		U1 = rand()*(1.0/RAND_MAX);
		U2 = rand()*(1.0/RAND_MAX);
		ReN = sqrt(-2*log(U1))*cos(2*M_PI*U2)*sqrt(SqSigma/2)+Mu;
		ImN = sqrt(-2*log(U1))*sin(2*M_PI*U2)*sqrt(SqSigma/2)+Mu;
		if ( (fabs(ReN) != INFINITY) && (fabs(ImN) != INFINITY) ){
			IoStream[j].Re += ReN;
			IoStream[j].Im += ImN;
		}
	}
}


/**
 * @brief Function for calculating mean power of an input complex stream.
 * @param Stream : Input complex stream.
 * @param Len : Complex stream length.
 * @return none
 */
static float GetCpxSgnPower( complex *Stream, uint32_t Len ){
	uint32_t j;
	float Energy = 0;
	for ( j=0; j<Len; j++ ){
		Energy += pow(Stream[j].Re,2)+pow(Stream[j].Im,2);
	}
	return Energy/(float)Len;
}


/**
 * @brief Function for printing on terminal (in hexadecimal format) a byte stream.
 * @param Bytes : Input byte-stream to be printed.
 * @param Len : Stream length.
 * @param Label : TX/RX ID label.
 * @return none
 */
void PrintByt( uint8_t *Bytes, uint32_t Len, uint8_t Label ){
	uint32_t j;
	if ( Label == TXINFOB){
		printf(" * TX INFO BITS (%d bytes)\n\t",Len);
	} else if ( Label == RXINFOB){
		printf(" * RX INFO BITS (%d bytes)\n\t",Len);
	}
	for ( j=0; j<Len; j++){
		printf("%2X ",Bytes[j]);
		if ( (j%20 == 19) && (j<(Len-1)) ) {
			printf("\n\t");

		}
	}
	printf("\n\n");
}


/**
 * @brief Function for printing on terminal a complex symbol stream.
 * @param Bytes : Input symbol stream to be printed.
 * @param Len : Stream length.
 * @param Label : TX/RX ID label.
 * @return none
 */
void PrintSym( complex *Symbols, uint32_t Len, uint8_t Label ){
	uint32_t j;
	if ( Label == TXSYMB ){
		printf(" * TX SYMBOLS\n\t");
	} else if ( Label == RXSYMB ){
		printf(" * RX SYMBOLS\n\t");
	}
	for ( j=0; j<Len; j++){
		if ( Symbols[j].Re >= 0){
			printf("+");
		}
		printf("%1.2f",Symbols[j].Re);

		if ( Symbols[j].Im >= 0){
			printf("+");
		}
		printf("%1.2fi | ",Symbols[j].Im);

		if ( (j%4 == 3) && (j<(Len-1)) ) {
			printf("\n\t");

		}
	}
	printf("\n\n");
}


/**
 * @brief Function for printing on terminal a float LLR stream.
 * @param Bytes : Input LLR stream to be printed.
 * @param Len : Stream length.
 * @return none
 */
void PrintLLRs( float *LLRs, uint32_t Len ){
	uint32_t j;
	printf(" * SOFT DEMAPPING LLR VALUES\n\t");
	for ( j=0; j<Len; j++){
		if ( LLRs[j] >= 0){
			printf("+");
		}
		printf("%1.3f ",LLRs[j]);
		if ( (j%8 == 7) && (j<(Len-1)) ) {
			printf("\n\t");
		}
	}
	printf("\n\n");
}


/**
 * @brief Function for printing on terminal a convultional coding trellis diagram.
 * @param ConvDiagr : Pointer to trellis diagram to be printed.
 * @return none
 */
void PrintConvDiagr( trellis *ConvDiagr ){
	uint8_t j;
	for ( j=0; j<N_TSTAT; j++ ){
		printf("State#%2d",j);
		printf("\t0 -> %d %d |",ConvDiagr->States[j].OutBits[0],ConvDiagr->States[j].NextState[0]);
		printf(" 1 -> %d %d\n",ConvDiagr->States[j].OutBits[1],ConvDiagr->States[j].NextState[1]);
	}
	printf("\n");
}


/**
 * @brief Function for printing on terminal a constellation mapping table.
 * @param MapTable : Pointer to mapping table to be printed.
 * @return none
 */
void PrintTable( phasemap *MapTable ){
	uint8_t j;
	printf(" * MAPPING TABLE\n\t");
	for ( j=0; j<M; j++){
		printf("%2d: ",MapTable->Bits[j]);
		if ( MapTable->Symbs[j].Re >= 0){
			printf("+");
		}
		printf("%1.2f",MapTable->Symbs[j].Re);

		if ( MapTable->Symbs[j].Im >= 0){
			printf("+");
		}
		printf("%1.2fi",MapTable->Symbs[j].Im);

		if ( (j%4 == 3) && (j<(M-1)) ) {
			printf("\n\t");
		} else if ( j < M-1 ){
			printf(" | ");
		}		
	}
	printf("\n\n");
}


/**
 * @brief Function for writing input byte stream into .csv file.
 * @param Bytes : Input byte stream to stored.
 * @param Len : Stream length.
 * @param Label : TX/RX ID label.
 * @return none
 */
void WriteBytCsv( uint8_t *Bytes, uint32_t Len, uint8_t Label ){
	uint32_t j;
	FILE *fid;
	if ( Label == TXINFOB ){
		fid = fopen("TxInfoBytes.csv","w");
	} else if ( Label == RXINFOB ){
		fid = fopen("RxInfoBytes.csv","w");
	}
	if (fid != NULL){
		for ( j=0; j<Len; j++ ){
			fprintf(fid,"%d",Bytes[j]);
			if ( j < Len-1 ){
				fprintf(fid,",");
			}
		}
	}
	fclose(fid);
}


 /**
 * @brief Function for writing input symbol stream into .csv file.
 * @param Symbols : Input symbol stream to stored.
 * @param Len : Stream length.
 * @param Label : TX/RX ID label.
 * @return none
 */
void WriteSymCsv( complex *Symbols, uint32_t Len, uint8_t Label ){
	uint32_t j;
	FILE *fid;
	if ( Label == TXSYMB ){
		fid = fopen("TxCpxSymbs.csv","w");
	} else if ( Label == RXSYMB ){
		fid = fopen("RxCpxSymbs.csv","w");
	}
	if (fid != NULL){
		for ( j=0; j<Len; j++ ){
			fprintf(fid,"%1.4f,%1.4f",Symbols[j].Re,Symbols[j].Im);
			if ( j < Len-1 ){
				fprintf(fid,",");
			}
		}
	}
	fclose(fid);
}


/**
 * @brief Function for estimating and printing the number of mismatched bits between two byte streams.
 * @param Stream_A : Input byte stream #1.
 * @param Stream_B : Input byte stream #2.
 * @param Len : Streams length.
 * @param Label : Info/coded ID label.
 * @return none
 */
void CheckWrongBits( uint8_t *Stream_A, uint8_t *Stream_B, uint32_t Len, uint8_t Label ){
	uint8_t BitIdx;
	uint32_t j, ByteIdx;
	uint32_t ErrCount = 0;
	uint8_t Mask = 0x01;
	uint32_t BitLen = Len<<3;
	if ( (Stream_A != NULL) && (Stream_B != NULL) ){
		for ( j=0; j<BitLen; j++){
			ByteIdx = (j>>3);
			BitIdx = (uint8_t)(j&0x0007);
			if ( (((Stream_A[ByteIdx])>>BitIdx)&Mask) != (((Stream_B[ByteIdx])>>BitIdx)&Mask) ){
				ErrCount++;
			}
		}
	}
	if ( Label == RXCCB ){
		printf(" * Errors before decoding : %d out of %d bits\n\n",ErrCount,BitLen);
	} else if ( Label == RXINFOB ){
		printf(" * Errors after decoding : %d out of %d bits",ErrCount,BitLen);
		printf(" (BER = %1.2e)\n\n",((float)ErrCount)/BitLen);
	}
}
