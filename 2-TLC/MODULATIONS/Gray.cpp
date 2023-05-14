
/*************************************************************************
 *** Title: GRAY CODING
 *** Author: Filippo Valmori
 *** Date: 21/10/2018
 *** Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Gray_code
 *************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>											// Standard library
#include <stdint.h>											// To use well-defined integer types
#include <string.h>											// To allow the memset function usage
#include <math.h>											// To use the logarithm function


/*** PARAMETERS AND CONSTANTS ***/

const uint8_t M	= 16;										// Modulation order
const uint8_t L = log2(M);									// Number of bits per symbol



/*** FUNCTION PROTOTYPES ***/

bool CheckParam( void );
void GetGray( uint8_t *IoArray );
void PrintArray( uint8_t *Bytes, uint16_t Len );



/*** MAIN FUNCTION ***/

int main(){

	uint8_t GrayArray[M];

	if ( CheckParam() ){
		
		GetGray(GrayArray);
		PrintArray(GrayArray,M);
		
	}

}



/*** CODING FUNCTIONS ***/

/**
 *	Function for checking the parameters correctness.
 **/
bool CheckParam( void ){
	
	bool CheckOk = true;

	if ( log2(M) != round(log2(M)) ){
		printf("\n ERROR : Invalid modulation order (M)\n");
		CheckOk = false;
	}
	
	return CheckOk;
	
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

		Nblk = M/(1<<i);									// Number of bits per block at i-th iteration
		Shift = L-i-1;										// Bit shift value at i-th iteration								
		Counter = 0;										// Counter within each single block
		WrIdx = Nblk/2;										// Starting value of the writing index

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


/*** EXTRA FUNCTIONS ***/

/**
 *	Function for printing on terminal (in hexadecimal format) the input byte-array content.
 **/
void PrintArray( uint8_t *Bytes, uint16_t Len ){

	uint16_t WrIdx;
	for ( WrIdx=0; WrIdx<Len; WrIdx++){
		printf("%2X ",Bytes[WrIdx]);
		if ( (WrIdx%10 == 9) && (WrIdx<(Len-1)) ) {
			printf("\n");

		}
	}
	printf("\n");

}
