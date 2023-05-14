
/*************************************************************************
 *** Title: BLOCK AND CONVOLUTIONAL INTERLEAVING
 *** Author: Filippo Valmori
 *** Date: 10/08/2019
 *** Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.8)
 *************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>														// Standard library
#include <stdint.h>														// To use well-defined integer types
#include <string.h>														// To allow the memcpy and memset functions usage
#include <math.h>


/*** PARAMETERS ***/

const uint16_t Nrows = 7;												// Block interleaving depth



/*** FUNCTION PROTOTYPES ***/

void BlkIntrlvRS( double *IoStream, uint16_t Len, uint16_t Nrows );
void BlkDeintrlvRS( double *IoStream, uint16_t Len, uint16_t Nrows );
void BlkIntrlvB( uint8_t *IoStream, uint16_t Len, uint16_t Nrows );
void BlkDeintrlvB( uint8_t *IoStream, uint16_t Len, uint16_t Nrows );
void BlkIntrlvb( uint8_t *IoStream, uint16_t ByteLen, uint16_t Nrows );
void BlkDeintrlvb( uint8_t *IoStream, uint16_t Len, uint16_t Nrows );

void PrintBytes( uint8_t *InBytes, uint16_t InLen );
void PrintSymbs( double *Symbols, uint16_t Len );
void GenStepArray( double *IoArray, uint16_t Len, double Step, double Offset );



/*** MAIN FUNCTION ***/

int main(){

#if 1
	uint16_t Len = 5;													// Info stream length (in bytes)
	uint8_t ByteStream[Len] = {1,176,225,22, 14};						// Info byte stream
	
	printf("\n * Interleaving type : Block");
	printf("\n * Block depth = %d",Nrows);
	printf("\n * Info stream length = %d bytes\n",Len);
	printf("\n INF :\t");
	PrintBytes(ByteStream,Len);											// Print the original info symbols
	BlkIntrlvb(ByteStream,Len,Nrows);									// Apply block interleaving
	printf("\n INT :\t");
	PrintBytes(ByteStream,Len);											// Print the interleaved bits
	BlkDeintrlvb(ByteStream,Len,Nrows);									// Apply block deinterleaving										// Apply additive descrambling
	printf("\n DEI :\t");
	PrintBytes(ByteStream,Len);											// Print the deinterleaved bits

	printf("\n       --------------------------------\n");

#else

	
	uint16_t SymbLen = 32;												// Info stream length (in symbols)
	double SymbStream[SymbLen];											// Info symbol stream
	
	printf("\n * Interleaving type : Block");
	printf("\n * Block depth = %d",Nrows);
	printf("\n * Info stream length = %d symbols\n",SymbLen);
	printf("\n INF :\t");
	GenStepArray(SymbStream,SymbLen,1,1);
	PrintSymbs(SymbStream,SymbLen);										// Print the original info symbols
	BlkIntrlvRS(SymbStream,SymbLen,Nrows);								// Apply block interleaving
	printf("\n INT :\t");
	PrintSymbs(SymbStream,SymbLen);										// Print the interleaved symbols
	BlkDeintrlvRS(SymbStream,SymbLen,Nrows);								// Apply block deinterleaving										// Apply additive descrambling
	printf("\n DEI :\t");
	PrintSymbs(SymbStream,SymbLen);										// Print the deinterleaved symbols

	printf("\n       --------------------------------\n");

#endif


}



/*** INTERLEAVING FUNCTIONS ***/

/**
 *	Function for implementing a block interleaver (at real symbol level) where
 *	matrix is filled column by column and then emptied row by row. As input
 *	parameter, the algorithm needs only the number of rows (aka interleaving
 *	depth) and adapts the number of columns to the input array size and so
 *	can handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).    
 **/
void BlkIntrlvRS( double *IoStream, uint16_t Len, uint16_t Nrows ){

	uint16_t i;
	uint16_t j = 0;
	uint16_t CurRow = 0;
	double TmpStream[Len];

	memcpy(TmpStream,IoStream,Len*sizeof(double));

	for ( i=0; i<Len; i++ ){
		IoStream[i] = TmpStream[j];
		j += Nrows;
		if ( j >= Len ){
			CurRow++;
			j = CurRow;
		}
	}

}


/**
 * Function for implementing a block deinterleaver (at real symbol level) where
 * matrix is filled row by row and then emptied column by column. As input
 * parameter, the algorithm needs only the number of rows (aka interleaving
 * depth) and adapts the number of columns to the input array size and so
 * can handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).
 **/
void BlkDeintrlvRS( double *IoStream, uint16_t Len, uint16_t Nrows ){

	uint16_t i, Ncols, Extra;
	uint16_t j = 0;
	uint16_t CurRow = 0;
	uint16_t CurCol = 0;
	double TmpStream[Len];

    Ncols = floor(Len/Nrows);
    Extra = Len-Nrows*Ncols;
	memcpy(TmpStream,IoStream,Len*sizeof(double));
    
    for ( i=0; i<Len; i++ ){
        IoStream[i] = TmpStream[j];
        j += Ncols;
        if ( CurRow < Extra ){
            j++;
            CurRow++;
		}
        if ( j >= Len ){
            CurCol++;
            j = CurCol;
            CurRow = 0;
		}
	}
    
}


/**
 *	Function for implementing a block interleaver (at byte level) where
 *	matrix is filled column by column and then emptied row by row. As input
 *	parameter, the algorithm needs only the number of rows (aka interleaving
 *	depth) and adapts the number of columns to the input array size and so
 *	can handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).    
 **/
void BlkIntrlvB( uint8_t *IoStream, uint16_t Len, uint16_t Nrows ){

	uint16_t i;
	uint16_t j = 0;
	uint16_t CurRow = 0;
	uint8_t TmpStream[Len];

	memcpy(TmpStream,IoStream,Len);

	for ( i=0; i<Len; i++ ){
		IoStream[i] = TmpStream[j];
		j += Nrows;
		if ( j >= Len ){
			CurRow++;
			j = CurRow;
		}
	}

}


/**
 * Function for implementing a block deinterleaver (at byte level) where
 * matrix is filled row by row and then emptied column by column. As input
 * parameter, the algorithm needs only the number of rows (aka interleaving
 * depth) and adapts the number of columns to the input array size and so
 * can handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).
 **/
void BlkDeintrlvB( uint8_t *IoStream, uint16_t Len, uint16_t Nrows ){

	uint16_t i, Ncols, Extra;
	uint16_t j = 0;
	uint16_t CurRow = 0;
	uint16_t CurCol = 0;
	uint8_t TmpStream[Len];

    Ncols = floor(Len/Nrows);
    Extra = Len-Nrows*Ncols;
	memcpy(TmpStream,IoStream,Len);
    
    for ( i=0; i<Len; i++ ){
        IoStream[i] = TmpStream[j];
        j += Ncols;
        if ( CurRow < Extra ){
            j++;
            CurRow++;
		}
        if ( j >= Len ){
            CurCol++;
            j = CurCol;
            CurRow = 0;
		}
	}
    
}


/**
 *	Function for implementing a block interleaver (at bit level) where
 *	matrix is filled column by column and then emptied row by row. As input
 *	parameter, the algorithm needs only the number of rows (aka interleaving
 *	depth) and adapts the number of columns to the input array size and so
 *	can handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).    
 **/
void BlkIntrlvb( uint8_t *IoStream, uint16_t ByteLen, uint16_t Nrows ){

	uint8_t BitIdx, BitRd;
	uint16_t i, ByteIdx;
	uint16_t j = 0;
	uint16_t CurRow = 0;
	uint16_t BitLen = (ByteLen<<3);
	uint8_t TmpStream[ByteLen] = {0};

	for ( i=0; i<BitLen; i++ ){
		ByteIdx = (j>>3);
		BitIdx = (uint8_t)(7-(j&0x0007));
		BitRd = (IoStream[ByteIdx]>>BitIdx)&0x01; 
		ByteIdx = (i>>3);
		BitIdx = (uint8_t)(7-(i&0x0007));
		TmpStream[ByteIdx] |= (BitRd<<BitIdx);
		j += Nrows;
		if ( j >= BitLen ){
			CurRow++;
			j = CurRow;
		}
	}
	
	memcpy(IoStream,TmpStream,ByteLen);

}


/**
 * Function for implementing a block deinterleaver (at bit level) where
 * matrix is filled row by row and then emptied column by column. As input
 * parameter, the algorithm needs only the number of rows (aka interleaving
 * depth) and adapts the number of columns to the input array size and so
 * can handle partially-filled matrices too (i.e. ArraySize ~= Nrows*Ncols).
 **/
void BlkDeintrlvb( uint8_t *IoStream, uint16_t ByteLen, uint16_t Nrows ){

	uint8_t BitIdx, BitRd;
	uint16_t i, ByteIdx, Ncols, Extra;
	uint16_t j = 0;
	uint16_t CurRow = 0;
	uint16_t CurCol = 0;
	uint16_t BitLen = (ByteLen<<3);
	uint8_t TmpStream[ByteLen] = {0};

    Ncols = floor(BitLen/Nrows);
    Extra = BitLen-Nrows*Ncols;
    
    for ( i=0; i<BitLen; i++ ){
		ByteIdx = (j>>3);
		BitIdx = (uint8_t)(7-(j&0x0007));
		BitRd = (IoStream[ByteIdx]>>BitIdx)&0x01; 
		ByteIdx = (i>>3);
		BitIdx = (uint8_t)(7-(i&0x0007));
		TmpStream[ByteIdx] |= (BitRd<<BitIdx);
        j += Ncols;
        if ( CurRow < Extra ){
            j++;
            CurRow++;
		}
        if ( j >= BitLen ){
            CurCol++;
            j = CurCol;
            CurRow = 0;
		}
	}

	memcpy(IoStream,TmpStream,ByteLen);
    
}



/*** EXTRA FUNCTIONS ***/

/**
 *	Function for printing on terminal (in hexadecimal format) the input byte-array content.
 **/
void PrintBytes( uint8_t *InBytes, uint16_t InLen ){

	uint16_t j;
	for ( j=0; j<InLen; j++){
		printf("%2X ",InBytes[j]);
		if ( (j%10 == 9) && (j<(InLen-1)) ) {
			printf("\n\t");

		}
	}
	printf("\n");

}


/**
 *	Function for printing on terminal the input complex symbol array content.
 **/
void PrintSymbs( double *Symbols, uint16_t Len ){

	uint16_t j;

	for ( j=0; j<Len; j++ ){

		printf("%2.0f ",Symbols[j]);

		if ( (j%10 == 9) && (j<(Len-1)) ) {
			printf("\n\t");

		}
	}
	printf("\n\n");

}


void GenStepArray( double *IoArray, uint16_t Len, double Step, double Offset ){

	uint16_t j;
	for ( j=0; j<Len; j++ ){
		IoArray[j] = Offset+j*Step;
	}

}


// fai interleaver convoluzionale
