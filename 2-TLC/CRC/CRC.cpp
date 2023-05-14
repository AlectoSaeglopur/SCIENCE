
/***************************************************************************************
 *** Title: CYCLIC REDUNDANCY CHECK (CRC) CALCULATOR
 *** Author: Filippo Valmori
 *** Date: 12/11/2018
 *** Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Cyclic_redundancy_check		
 ***************************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>															// Standard library
#include <stdint.h>															// To use well-defined integer types
#include <string.h>															// To allow the memcpy and memset functions usage
#include <stdlib.h>															// To generate random bytes
#include <time.h>															// To link random seed to actual time



/*** PARAMETERS ***/

const uint8_t CrcDeg = 16;													// CRC degree (i.e. the number of CRC bits)
const uint16_t MsgLen = 10;													// Message length (in bytes)



/*** CONSTANTS AND GLOBAL VARIABLES ***/

const uint8_t GPLEN = 14;													// Length of the generator polynomial array
const uint8_t GENPOLY8[] = {0,2,4,6,7};										// Generator polynomial for 8-bit CRC (ITU standard)
const uint8_t GENPOLY16[] = {0,5,12};										// Generator polynomial for 16-bit CRC (DVB-S2 standard)
const uint8_t GENPOLY24[] = {0,1,5,6,23};									// Generator polynomial for 24-bit CRC (UMTS standard)
const uint8_t GENPOLY32[] = {0,1,2,4,5,7,8,10,11,12,16,22,23,26};			// Generator polynomial for 32-bit CRC (MPEG-2 standard)
const uint8_t GENPOLY64[] = {0,1,3,4};										// Generator polynomial for 64-bit CRC (ISO standard)



/*** TYPEDEFS ***/

typedef struct TD1 {
	uint8_t Len;
	uint8_t Deg[GPLEN];
} genpoly;



/*** FUNCTION PROTOTYPES ***/

bool CheckParam( void );
genpoly GetGenPoly( void );
void CrcCalc( uint8_t *InBytes, uint8_t *CrcBytes, genpoly *GenPoly );
int16_t FindMaxDeg( uint8_t *Poly, uint16_t Len );

void RandGen( uint8_t *IoBytes );
void PrintArray( uint8_t *ByteArray, uint16_t InLen );



/*** MAIN FUNCTION ***/

int main(){

	genpoly GenPoly;
	uint8_t SrcBytes[MsgLen];
	uint8_t CrcBytes[CrcDeg>>3];

	if ( CheckParam() ){

		srand(time(NULL));													// Link random seed to actual time
		RandGen(SrcBytes);													// Random generation of source bytes
		GenPoly = GetGenPoly();												// Retrieve the CRC generator polynomial
		CrcCalc(SrcBytes,CrcBytes,&GenPoly);								// Estimate the CRC bytes related to the source message

		printf("\n * CRC degree = %d\n",CrcDeg);
		printf("\n SRC (%d bytes) :\t",MsgLen);
		PrintArray(SrcBytes,MsgLen);
		printf("\n CRC (%d bytes) :\t",CrcDeg>>3);
		PrintArray(CrcBytes,CrcDeg>>3);

	}

}



/*** ENCODING-DECODING FUNCTIONS ***/

/**
 *	Function for checking the parameters correcteness.
 **/
bool CheckParam( void ){

	bool CheckOk = true;

	if ( (CrcDeg != 8) && (CrcDeg!=16) && (CrcDeg != 24) && (CrcDeg!=32) && (CrcDeg!=64) ){
		CheckOk = false;
		printf("\n ERROR : Invalid CRC degree (CrcDeg)\n");
	}

	return CheckOk;

}

/**
 *	Function for retrieving the generator polynomial (maximum degree is implied) as a
 *  function of the chosen CrcDeg.
 **/
genpoly GetGenPoly( void ){

	genpoly GenPoly;

	switch ( CrcDeg ){

		case 8:
			GenPoly.Len = 5;
			memcpy(GenPoly.Deg,GENPOLY8,GPLEN);
			break;

		case 16:
			GenPoly.Len = 3;
			memcpy(GenPoly.Deg,GENPOLY16,GPLEN);
			break;

		case 24:
			GenPoly.Len = 5;
			memcpy(GenPoly.Deg,GENPOLY24,GPLEN);
			break;

		case 32:
			GenPoly.Len = 14;
			memcpy(GenPoly.Deg,GENPOLY32,GPLEN);
			break;

		case 64:
			GenPoly.Len = 4;
			memcpy(GenPoly.Deg,GENPOLY64,GPLEN);
			break;

	}

	return GenPoly;

}


/**
 *	Function for calculating the CRC of the input byte stream in accordance with
 *	the selected generator polynomial.
 **/
void CrcCalc( uint8_t *InBytes, uint8_t *CrcBytes, genpoly *GenPoly ){

	uint16_t BitLen = (MsgLen<<3)+CrcDeg;									// TmpPoly length (in bits)
	uint16_t ByteLen = (BitLen>>3);											// TmpPoly length (in bytes)
	uint8_t TmpPoly[ByteLen] = {0};											// Polynomial used for iterative division operations
	int16_t MaxDeg, QuotDeg;
	uint8_t BitIdx, Mask, j;
	uint16_t ByteIdx;

	if ( (InBytes != NULL) && (CrcBytes != NULL) && (GenPoly != NULL) ){

		memcpy(TmpPoly,InBytes,MsgLen);										// Upshift the message polynomial into TmpPoly(x)
		MaxDeg = BitLen-FindMaxDeg(TmpPoly,ByteLen)-1;						// Search for the maximum degree of TmpPoly(x) at 1st iteration
		QuotDeg = MaxDeg-CrcDeg;											// Estimate the quotient degree at 1st iteration

		if ( MaxDeg < BitLen ){												// Check if InBytes is an all-zero array

			while ( QuotDeg >= 0 ){											// Exit if at current iteration TmpPoly(x) has a maximum degree less than CrcDeg

				ByteIdx = (BitLen-MaxDeg-1)>>3;
				BitIdx = (BitLen-MaxDeg-1)&0x0007;
				Mask = ~(0x80>>BitIdx);
				TmpPoly[ByteIdx] &= Mask;									// Reset the maximum degree of TmpPoly(x) at current iteration

				for ( j=0; j<GenPoly->Len; j++ ){

					ByteIdx = (BitLen-QuotDeg-GenPoly->Deg[j]-1)>>3;
					BitIdx = (uint8_t)((BitLen-QuotDeg-GenPoly->Deg[j]-1)&0x0007);
					Mask = (0x80>>BitIdx);
					TmpPoly[ByteIdx] ^= Mask;								// Compute division remainder at current iteration

				}

				MaxDeg = BitLen-FindMaxDeg(TmpPoly,ByteLen)-1;				// Search for the maximum degree of TmpPoly(x) at current iteration
				QuotDeg = MaxDeg-CrcDeg;									// Estimate the quotient degree at current iteration

			}
		}

		memcpy(CrcBytes,&TmpPoly[ByteLen-(CrcDeg>>3)],CrcDeg>>3);			// Copy the computed CRC bytes into the output pointer

	}
	
}



/**
 *	Function for finding the maximum degree of the input polynomial (in MSB endianess).
 *	A -1 return means that the input is an all-zero array.
 **/
int16_t FindMaxDeg( uint8_t *Poly, uint16_t Len ){

	uint16_t j, ByteIdx;
	uint8_t BitIdx;
	int16_t MaxDeg = -1;
	uint16_t BitLen = Len<<3;
	uint8_t Mask = 0x01;

	for ( j=0; j<BitLen; j++ ){

		ByteIdx = (j>>3);
		BitIdx = (j&0x0007);

		if ( (Poly[ByteIdx]>>(7-BitIdx))&Mask ){
			MaxDeg = (int16_t)j;
			break;
		}

	}

	return MaxDeg;

}



/*** EXTRA FUNCTIONS ***/

/**
 *	Function for filling the input array with random bytes (integer values from 0 to 255).
 **/
void RandGen( uint8_t *IoBytes ){

	uint16_t j;

	if ( IoBytes != NULL ){
		for ( j=0; j<MsgLen; j++ ){
			IoBytes[j] = (uint8_t)rand();
		} 
	}

}


/**
 *	Function for printing (in hexadecimal format) on terminal the input array content.
 **/
void PrintArray( uint8_t *ByteArray, uint16_t InLen ){

	uint16_t j;

	if ( ByteArray != NULL ){
		for ( j=0; j<InLen; j++){
			printf("%2X ",ByteArray[j]);
			if ( (j%10 == 9) && (j<(InLen-1)) ) {
				printf("\n\t\t\t");

			}
		}
		printf("\n");
	}

}
