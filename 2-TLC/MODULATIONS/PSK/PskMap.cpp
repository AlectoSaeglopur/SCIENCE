
/*******************************************************************************************************************
 *** Title: M-PSK MAPPER AND HARD/SOFT DEMAPPER WITH GRAY CODING
 *** Author: Filippo Valmori
 *** Date: 28/11/2018
 *** Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Phase-shift_keying
 ***			[2] MathWorks - https://it.mathworks.com/help/comm/ug/phase-modulation.html#responsive_offcanvas
 *******************************************************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>														// Standard library
#include <stdint.h>														// To use well-defined integer types
#include <string.h>														// To allow the memset function usage
#include <stdlib.h>														// To generate random bytes
#include <time.h>														// To link random seed to actual time
#include <math.h>														// To use the sin, cos, log and exp functions



/*** PARAMETERS ***/

const uint8_t M = 8;													// Modulation order
const uint16_t ByteLen = 30;											// Source info stream length (in bytes)
const double EbN0 = 10;													// [dB] Energy-per-bit-to-noise-power-spectral-density ratio over AWGN channel (NB: SNR=Eb/N0*log2(M)/sps)



/*** CONSTANTS AND GLOBAL VARIABLES ***/
const double pi = 3.141593;												// π value
const uint8_t L = log2(M);												// Number of bits per symbol
const double PhOfst = pi/M;                                     		// Constellation phase offset
const uint16_t BitLen = ByteLen<<3;										// Source info stream length (in bits)
const uint16_t SymbLen = BitLen/L;										// Mapped stream length (in symbols)
#define TX 			0
#define RX 			1



/*** TYPEDEFS ***/

typedef struct TD1 {
	double Re;
	double Im;
} complex;

typedef struct TD2 {
	uint8_t Bits[M];
	complex Symbs[M];
} phasemap;



/*** FUNCTION PROTOTYPES ***/

void CheckParam( void );
void GetPskTable( phasemap *IoTable );
void GetGray( uint8_t *IoArray );
void Mapper( uint8_t *InBytes, complex *OutSymbs, phasemap *Table );
void HardDemapper( complex *InSymbs, uint8_t *OutBytes, phasemap *Table );
void SoftDemapper( complex *InSymbs, double *OutLLRs, phasemap *Table );

void RandGen( uint8_t *IoBytes );
void PrintParam( void );
void PrintBytes( uint8_t *Bytes, uint16_t Len, uint8_t Label );
void PrintSymbs( complex *Symbols, uint16_t Len, uint8_t Label );
void PrintLLRs( double *LLRs, uint16_t Len );
void PrintTable( phasemap *InTable );
void WriteSymbolsCsv( complex *InSymbs, uint16_t Len, uint8_t Type );
void ChanAWGN( complex *IoStream, double EbN0 );
double GetCpxSgnPower( complex *Stream, uint16_t Len );
void CheckWrongBits( uint8_t *ByteStreamA, uint8_t *ByteStreamB );



/*** MAIN FUNCTION ***/

int main(){

	uint8_t InfoBytes[ByteLen];
	uint8_t HardDemBytes[ByteLen];
	double SoftDemLLRs[BitLen];
	complex PskSymbs[SymbLen];
	phasemap PskTable;
	
	CheckParam();														// Check the parameters correctness
	RandGen(InfoBytes);													// Random generation of source stream
	GetPskTable(&PskTable);												// Retrieve the mapping table between bits and PSK constellation
	Mapper(InfoBytes,PskSymbs,&PskTable);								// Convert input bits into symbols
	//WriteSymbolsCsv(PskSymbs,SymbLen,TX);								// Write ideal Tx symbols into .csv file
	ChanAWGN(PskSymbs,EbN0);											// AWGN channel simulation
	//WriteSymbolsCsv(PskSymbs,SymbLen,RX);								// Write noisy Rx symbols into .csv file
	HardDemapper(PskSymbs,HardDemBytes,&PskTable);						// Hard-demapping of the PSK symbols	
	SoftDemapper(PskSymbs,SoftDemLLRs,&PskTable);						// Soft-demapping of the PSK symbols

	PrintParam();
	PrintTable(&PskTable);
	PrintBytes(InfoBytes,ByteLen,TX);
	//PrintSymbs(PskSymbs,SymbLen,TX);
	PrintBytes(HardDemBytes,ByteLen,RX);
	//PrintLLRs(SoftDemLLRs,BitLen);
	CheckWrongBits(InfoBytes,HardDemBytes);

}



/*** CODING FUNCTIONS ***/

/**
 *	Function for checking the parameters correctness.
 **/
void CheckParam( void ){
	
	if ( log2(M) != round(log2(M)) ){
		printf("\n ERROR : Invalid modulation order (M)\n");
		exit(1);
	} else if ( (ByteLen<<3)%L ){
		printf("\n ERROR : Invalid info stream length\n");
		exit(1);
	}
	
	
}


/**
 *	Function for getting the mapping table between bit sets and PSK symbols according
 *	to Gray Coding.
 **/
void GetPskTable( phasemap *IoTable ){
	
	uint8_t j;
	uint8_t GrayArray[M];
	
	GetGray(GrayArray);
	for ( j=0; j<M; j++ ){
		IoTable->Bits[j] = GrayArray[j];
		IoTable->Symbs[j].Re = cos(PhOfst+2*pi*j/M);
		IoTable->Symbs[j].Im = sin(PhOfst+2*pi*j/M);
	}

}


/**
 *	Function for retrieving the Gray coded vector of length M.
 **/
void GetGray( uint8_t *IoArray ){

	uint8_t i, WrIdx, Counter;
	uint8_t Nblk, Shift;
	uint8_t Mask = 0x01;
	
	memset(IoArray,0,M);

	for ( i=0; i<L; i++ ){

		Nblk = M/(1<<i);												// Number of bits per block at i-th iteration
		Shift = L-i-1;													// Bit shift value at i-th iteration								
		Counter = 0;													// Counter within each single block
		WrIdx = Nblk/2;													// Starting value of the writing index

		while ( WrIdx < M ){

			IoArray[WrIdx] |= (Mask<<Shift);

			if ( Counter < (Nblk-1) ){
				Counter++;
			} else {
				Counter = 0;
				WrIdx += Nblk;
			}

			WrIdx++;

		}
	}

}


/**
 * Function for mapping an input bit stream into the constellation
 * symbols specified by Table.
 **/
void Mapper( uint8_t *InBytes, complex *OutSymbs, phasemap *Table ){

	uint8_t i, BitIdx;
	uint16_t ByteIdx;
	uint16_t j = 0;
	int8_t CurBits = 0;
	uint8_t SymbIdx = 0;
	uint8_t Mask = 0x01;
	uint16_t BitLen = ByteLen<<3;

	while ( j < BitLen ){

		SymbIdx++;
		ByteIdx = j>>3;
		BitIdx = (uint8_t)(7-(j&0x0007));
		CurBits |= ((InBytes[ByteIdx]>>BitIdx)&Mask)<<(L-SymbIdx);

		if ( SymbIdx == L ){
			for ( i=0; i<M; i++ ){
				if ( Table->Bits[i] == CurBits ){
					OutSymbs[(j+1)/L-1] = Table->Symbs[i];
					break;
				}
			}
			SymbIdx = 0;
			CurBits = 0;
		}

		j++;
	}
    
}


/**
 * Function for hard-demapping an input symbol stream into bits accordig 
 * to the specified mapping table.
 **/
void HardDemapper( complex *InSymbs, uint8_t *OutBytes, phasemap *Table ){
	
	uint8_t i, MinIdx, BitIdx;
	uint16_t j, ByteIdx;
	uint8_t Mask = 0x01;
	uint16_t k = 0;														// Bit counter for output stream writing
	double MinDist, CurDist;

	memset(OutBytes,0,ByteLen);

	for ( j=0; j<SymbLen; j++ ){

		MinIdx = 0;
		MinDist = fabs(InSymbs[j].Re-Table->Symbs[0].Re)+fabs(InSymbs[j].Im-Table->Symbs[0].Im);

		for ( i=1; i<M; i++ ){
			CurDist = fabs(InSymbs[j].Re-Table->Symbs[i].Re)+fabs(InSymbs[j].Im-Table->Symbs[i].Im);
			if ( CurDist < MinDist ){
				MinDist = CurDist;
				MinIdx = i;
			}
		}

		for ( i=0; i<L; i++ ){
			if ( Table->Bits[MinIdx] & Mask<<(L-1-i) ){
				ByteIdx = k>>3;
				BitIdx = (uint8_t)(7-(k&0x0007));
				OutBytes[ByteIdx] |= Mask<<BitIdx; 
			}

			k++;

		}
	}

}


/**
 * Function for soft-demapping an input symbol stream into bits accordig to the
 * specified mapping table employing the exact log-likelihood (LLR) algorithm.
 **/
void SoftDemapper( complex *InSymbs, double *OutLLRs, phasemap *Table ){
	
	uint16_t k;
	uint8_t i, j;
	double Num, Den, Dist;
	uint8_t Mask = 0x01;
	double N0 = 4;										// Assumed noise variance in linear (i.e. 6 dB)

	if ( M == 2 ){

		for ( k=0; k<BitLen; k++ ){
			OutLLRs[k] = -InSymbs[k].Im;
		}

	} else {

		for ( k=0; k<SymbLen; k++ ){
			for ( i=0; i<L; i++ ){
				Num = 0;
				Den = 0;
				for ( j=0; j<M ; j++ ){
					Dist = exp(-(pow(InSymbs[k].Re-Table->Symbs[j].Re,2)+pow(InSymbs[k].Im-Table->Symbs[j].Im,2))/N0);
					if ( (Table->Bits[j]>>i) & Mask ){
						Num += Dist;
					} else {
						Den += Dist;
					}
				}
				OutLLRs[(k+1)*L-i-1] = N0/2*log(Num/Den);
			}
		}
	}

}



/*** EXTRA FUNCTIONS ***/

/**
 *	Function for filling the input array with random bytes (integer values from 0 to 255).
 **/
void RandGen( uint8_t *IoBytes ){

	uint16_t j;
	srand(time(NULL));													// Link random seed to actual time
	if ( IoBytes != NULL ){
		for ( j=0; j<ByteLen; j++ ){
			IoBytes[j] = (uint8_t)rand();
		} 
	}

}


/**
 *	Function for printing parameters on terminal.
 **/
void PrintParam( void ){

	printf("\n * PARAMETERS\n");
	printf("\tM = %d\n",M);
	printf("\tEb/N0 = %1.1f dB\n",EbN0);
	printf("\n");

}


/**
 *	Function for printing on terminal (in hexadecimal format) the input byte-array content.
 **/
void PrintBytes( uint8_t *Bytes, uint16_t Len, uint8_t Label ){

	uint16_t j;
	if ( Label == TX){
		printf(" - TX INPUT BITS (%d bytes)\n\t",Len);
	} else {
		printf(" - RX OUTPUT BITS (%d bytes)\n\t",Len);
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
 *	Function for printing on terminal the input complex symbol array content.
 **/
void PrintSymbs( complex *Symbols, uint16_t Len, uint8_t Label ){

	uint16_t j;
	if ( Label == TX ){
		printf(" - TX SYMBOLS\n\t");
	} else if ( Label == RX ){
		printf(" - RX SYMBOLS\n\t");
	}

	for ( j=0; j<Len; j++ ){
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
 *	Function for printing on terminal the input double LLR array content.
 **/
void PrintLLRs( double *LLRs, uint16_t Len ){

	uint16_t j;
	printf(" - SOFT DEMAPPING LLR VALUES\n\t");
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
 *	Function for printing on terminal the constellation mapping table.
 **/
void PrintTable( phasemap *InTable ){

	uint16_t j;
	printf(" - PSK MAPPING TABLE\n\t");
	for ( j=0; j<M; j++){
		printf("%2d : ",InTable->Bits[j]);
		if ( InTable->Symbs[j].Re >= 0){
			printf("+");
		}
		printf("%1.2f",InTable->Symbs[j].Re);

		if ( InTable->Symbs[j].Im >= 0){
			printf("+");
		}
		printf("%1.2fi | ",InTable->Symbs[j].Im);

		if ( (j%3 == 2) && (j<(M-1)) ) {
			printf("\n\t");

		}
	}
	printf("\n\n");

}


/**
 *	Function for writing the input complex symbol stream into a csv file.
 **/
void WriteSymbolsCsv( complex *InSymbs, uint16_t Len, uint8_t Label ){

	uint16_t j;
	FILE *fid;

	if ( Label == TX ){
		fid = fopen("TxCpxSymbs.csv","w");
	} else if ( Label == RX ){
		fid = fopen("RxCpxSymbs.csv","w");
	}

	if (fid != NULL){
		for ( j=0; j<Len; j++ ){
			fprintf(fid,"%1.4f,%1.4f",InSymbs[j].Re,InSymbs[j].Im);
			if ( j < Len-1 ){
				fprintf(fid,",");
			}
		}
	}
	fclose(fid);

}


/**
 *	Function for simulating an Additive White Gaussian Noise (AWGN) channel in order
 *	to introduce noise on the I/O complex stream with power fixed by parameter Eb/N0
 *	using the Box-Muller method.
 **/
void ChanAWGN( complex *IoStream, double EbN0 ){

	uint16_t j;
	double U1, U2;														// Random variables uniformly distributed between 0 and 1
	double Mu = 0;														// Noise mean value
	double SgnPwr = GetCpxSgnPower(IoStream,SymbLen);					// Signal mean power (in linear)
	double SNR = EbN0+10*log10(L);										// Signal-to-noise-ratio in dB
	double SqSigma = SgnPwr*pow(10,-SNR/10);							// Target noise variance, i.e. N0

	srand(time(NULL));													// Link random seed to actual time
	for ( j=0; j<SymbLen; j++ ){		
		U1 = rand()*(1.0/RAND_MAX);
		U2 = rand()*(1.0/RAND_MAX);
		IoStream[j].Re += sqrt(-2*log(U1))*cos(2*pi*U2)*sqrt(SqSigma/2)+Mu;
		IoStream[j].Im += sqrt(-2*log(U1))*sin(2*pi*U2)*sqrt(SqSigma/2)+Mu;
	}

}


/**
 *	Function for calculating the mean power of the input complex stream.
 **/
double GetCpxSgnPower( complex *Stream, uint16_t Len ){

	uint16_t j;
	double Energy = 0;

	for ( j=0; j<Len; j++ ){
		Energy += pow(Stream[j].Re,2)+pow(Stream[j].Im,2);
	}

	return Energy/(double)Len;
}


/**
 *	Function for estimating the number of mismatched bits between the two input byte-arrays.
 **/
void CheckWrongBits( uint8_t *ByteStreamA, uint8_t *ByteStreamB ){
	
	uint8_t BitIdx;
	uint16_t j, ByteIdx;
	uint16_t ErrCount = 0;
	uint8_t Mask = 0x01;
	uint16_t InLen = ByteLen<<3;
	
	if ( (ByteStreamA!= NULL) && (ByteStreamB!= NULL) ){
		
		ErrCount = 0;
		
		for ( j=0; j<InLen; j++){
			
			ByteIdx = (j>>3);
			BitIdx = (uint8_t)(j&0x0007);
			
			if ( (((ByteStreamA[ByteIdx])>>BitIdx)&Mask) != (((ByteStreamB[ByteIdx])>>BitIdx)&Mask) ){
				ErrCount++;
			}
		}
	}
	
	printf(" - ERRORS : %d out of %d bits -> BER = %1.6f\n",ErrCount,InLen,(double)ErrCount/InLen);
	
}
