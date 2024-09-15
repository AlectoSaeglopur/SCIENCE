/**
 * @file crc.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief CRC ibrary
 * 
 * Library containing cyclic redundancy check (CRC) functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "crc.h"



/*** PARAMETERS ***/

const uint8_t CrcDeg = 16;													// CRC degree (i.e. the number of CRC bits)
const uint16_t MsgLen = 10;													// Message length (in bytes)



/*** CONSTANTS AND GLOBAL VARIABLES ***/

const uint8_t GPLEN = 14;													// Length of the generator polynomial array



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



/*** MAIN FUNCTION ***/

int main(){

	genpoly GenPoly;
	uint8_t SrcBytes[MsgLen];
	uint8_t CrcBytes[CrcDeg>>3];

	if ( CheckParam() ){


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
