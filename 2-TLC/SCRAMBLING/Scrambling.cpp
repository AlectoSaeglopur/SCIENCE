
/*************************************************************************
 *** Title: ADDITIVE AND MULTIPLICATIVE SCRAMBLING
 *** Author: Filippo Valmori
 *** Date: 16/10/2018
 *** Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Scrambler
 *************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>														// Standard library
#include <stdint.h>														// To use well-defined integer types



/*** PARAMETERS ***/

const uint8_t NcA = 15;													// Number of additive LFSR cells
const uint32_t ConVectA = 0x00060000; 									// Connection vector of additive LFSRs, i.e. (1+)z^-14+z^-15 - DVB standard
const uint32_t InitStA = 0x95000000;									// Initial state of additive LFSRs

const uint8_t NcM = 17;													// Number of multiplicative LFSR cells
const uint32_t ConVectM = 0x00108000; 									// Connection vector of multiplicative LFSRs, i.e. (1+)z^-12+z^-17
const uint32_t InitStM = 0x2C350000;									// Initial state of the multiplicative LFSRs



/*** FUNCTION PROTOTYPES ***/

void AddScramb( uint8_t *IoBytes, uint16_t ByteLen );
void MultScramb( uint8_t *IoBytes, uint16_t ByteLen );
void MultDescramb( uint8_t *IoBytes, uint16_t ByteLen );
uint8_t ComputeRegBit( uint32_t State, uint8_t Nc, uint32_t ConVect );

void PrintArray( uint8_t *InBytes, uint16_t InLen );



/*** MAIN FUNCTION ***/

int main(){
	
	uint16_t Len = 50;													// Info stream length (in bytes)
	uint8_t ByteStream[Len] = {0};										// All-zero info stream generation
	
	printf("\n * Scrambling type : Additive");
	printf("\n * Number of LFSR cells = %d",NcA);
	printf("\n * Info stream length = %d bytes\n",Len);
	printf("\n INF :\t");
	PrintArray(ByteStream,Len);											// Print the original info bytes
	AddScramb(ByteStream,Len);											// Apply additive scrambling
	printf("\n SCR :\t");
	PrintArray(ByteStream,Len);											// Print the scrambled bytes
	AddScramb(ByteStream,Len);											// Apply additive descrambling
	printf("\n DES :\t");
	PrintArray(ByteStream,Len);											// Print the descrambled bytes

	printf("\n       --------------------------------\n");

	printf("\n * Scrambling type : Multiplicative");
	printf("\n * Number of LFSR cells = %d",NcM);
	printf("\n * Info stream length = %d bytes\n",Len);
	printf("\n INF :\t");
	PrintArray(ByteStream,Len);											// Print the original info bytes
	MultScramb(ByteStream,Len);											// Apply multiplicative scrambling
	printf("\n SCR :\t");
	PrintArray(ByteStream,Len);											// Print the scrambled bytes
	MultDescramb(ByteStream,Len);										// Apply multiplicative descrambling
	printf("\n DES :\t");
	PrintArray(ByteStream,Len);											// Print the descrambled bytes


}



/*** SCRAMBLING-DESCRAMBLING FUNCTIONS ***/

/**
 *	Function for implementing an additive (aka synchronous) scrambler / descrambler.
 **/
void AddScramb( uint8_t *IoBytes, uint16_t ByteLen ){
	
	uint16_t j,ByteIdx;
	uint8_t BitIdx, ScrBit;
	uint8_t Mask = 0x01;
	uint32_t LfsrState = InitStA;
	uint16_t BitLen = (ByteLen<<3);
	
	for ( j=0; j<BitLen; j++ ){
		
		ByteIdx = (j>>3);
		BitIdx = (uint8_t)(7-(j&0x0007));
		ScrBit = ComputeRegBit(LfsrState,NcA,ConVectA);					// Bit outgoing from shift register connections
		LfsrState >>= 1;												// Update scrambler shift register
		
		if( ScrBit ){													// If LFSR bit is 1
		
			LfsrState |= 0x80000000;									// Update content of shift register first cell
			ScrBit ^= (IoBytes[ByteIdx]>>BitIdx) & Mask;				// Output bit at j-th cycle
			
			if ( ScrBit )												// If Output bit is 1
				IoBytes[ByteIdx] |= (Mask<<BitIdx);						// Write the the output bit into the I/O stream
			else														// If Output bit is 0
				IoBytes[ByteIdx] &= ~(Mask<<BitIdx);
			
		} else {														// If LFSR bit is 0
		
			LfsrState &= 0x7FFFFFFF;
			ScrBit ^= (IoBytes[ByteIdx]>>BitIdx) & Mask;
			
			if ( ScrBit )
				IoBytes[ByteIdx] |= (Mask<<BitIdx);
			else
				IoBytes[ByteIdx] &= ~(Mask<<BitIdx);
			
		}
	}
	
}


/**
 *	Function for implementing a multiplicative (aka self-synchronizing) scrambler.
 **/
void MultScramb( uint8_t *IoBytes, uint16_t ByteLen ){
	
	uint16_t j,ByteIdx;
	uint8_t BitIdx, OutBit, InBit;
	uint8_t Mask = 0x01;
	uint32_t LfsrState = InitStM;
	uint16_t BitLen = (ByteLen<<3);
	
	for ( j=0; j<BitLen; j++ ){
		
		ByteIdx = (j>>3);
		BitIdx = (uint8_t)(7-(j&0x0007));
		InBit = ((IoBytes[ByteIdx]>>BitIdx) & Mask);					// Input bit at j-th cycle
		OutBit = ComputeRegBit(LfsrState,NcM,ConVectM)^InBit;			// Output bit at j-th cycle
		LfsrState >>= 1;												// Right-shift the LFSR
		
		if( OutBit ){													// If output bit is 1
		
			LfsrState |= 0x80000000;									// Update content of LFSR first cell to 1
			IoBytes[ByteIdx] |= (Mask<<BitIdx);							// Write the output bit into the I/O stream

		} else {														// If LFSR bit is 0
		
			LfsrState &= 0x7FFFFFFF;									// Update content of LFSR first cell to 0
			IoBytes[ByteIdx] &= ~(Mask<<BitIdx);
			
		}
	}
	
}


/**
 *	Function for implementing a multiplicative (aka self-synchronizing) descrambler.
 **/
void MultDescramb( uint8_t *IoBytes, uint16_t ByteLen ){
	
	uint16_t j,ByteIdx;
	uint8_t BitIdx, OutBit, InBit;
	uint8_t Mask = 0x01;
	uint32_t LfsrState = InitStM;
	uint16_t BitLen = (ByteLen<<3);
	
	for ( j=0; j<BitLen; j++ ){
		
		ByteIdx = (j>>3);
		BitIdx = (uint8_t)(7-(j&0x0007));
		InBit = ((IoBytes[ByteIdx]>>BitIdx) & Mask);
		OutBit = ComputeRegBit(LfsrState,NcM,ConVectM)^InBit;			// Output bit at j-th cycle
		LfsrState >>= 1;												// Right-shift the LFSR

		if ( OutBit ){													// If output bit is 1
			IoBytes[ByteIdx] |= (Mask<<BitIdx);							// Write the output bit into the I/O stream
		} else {
			IoBytes[ByteIdx] &= ~(Mask<<BitIdx);
		}

		if ( InBit ){
			LfsrState |= 0x80000000;									// Update content of the LFSR first cell to 1
		} else {
			LfsrState &= 0x7FFFFFFF;									// Update content of the LFSR first cell to 0
		}
	}
	
}


/**
 *	Function for computing the bit outgoing from shift register connections
 *  as a function of the current state and connection vector.
 **/
uint8_t ComputeRegBit( uint32_t State, uint8_t Nc, uint32_t ConVect ){

	uint8_t j;
	uint8_t OutBit = 0;
	uint32_t Mask = 0x80000000;

	for ( j=0; j<Nc; j++ ){
		if ( ((State<<j) & Mask) & ((ConVect<<j) & Mask) ){
			OutBit++;
		}
	}
	
	return (OutBit%2);

}



/*** EXTRA FUNCTIONS ***/

/**
 *	Function for printing on terminal (in hexadecimal format) the input byte-array content.
 **/
void PrintArray( uint8_t *InBytes, uint16_t InLen ){

	uint16_t j;
	for ( j=0; j<InLen; j++){
		printf("%2X ",InBytes[j]);
		if ( (j%10 == 9) && (j<(InLen-1)) ) {
			printf("\n\t");

		}
	}
	printf("\n");

}
