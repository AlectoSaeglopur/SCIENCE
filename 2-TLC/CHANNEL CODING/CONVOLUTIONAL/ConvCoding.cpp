
/************************************************************************
 *** Title: CONVOLUTIONAL ENCODER AND VITERBI DECODER
 *** Author: Filippo Valmori
 *** Date: 06/10/2018
 *** Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.7)
 ************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>															// Standard library
#include <stdint.h>															// To use well-defined integer types
#include <string.h>															// To allow the memcpy function usage
#include <stdlib.h>															// To generate random bytes
#include <time.h>															// To link random seed to actual time



/*** PARAMETERS ***/

#define Rc			RATE23													// Code rate, Rc = k/n
const uint8_t K = 5;														// Constrain length
const uint16_t InfoByteLen = 300;											// Source stream byte-length (NB: Max value = 4095)
const uint16_t MemFact = 10;												// Memory factor of Viterbi decoding algorithm
const float Peb = 0.005;													// Bit error probability for BSC simulation



/*** CONSTANTS AND GLOBAL VARAIBLES ***/

const uint8_t RATE12 =	1;													// Code Rate = 1/2
const uint8_t RATE23 =	2;													// Code Rate = 2/3
const uint8_t RATE34 =	3;													// Code Rate = 3/4
const uint8_t RATE56 =	5;													// Code Rate = 5/6
const uint8_t Nstates =	(1<<(K-1));											// Number of trellis states
const uint8_t CV[6][2] = {{7,5},{15,11},{23,25},							// Connector vectors for each K
						{47,53},{79,109},{159,229}};
const uint8_t PUNCT23[] = {1,1,0,1};										// Puncturing vector for Rc = 2/3
const uint8_t PUNCT34[] = {1,1,0,1,1,0};									// Puncturing vector for Rc = 3/4
const uint8_t PUNCT56[] = {1,1,0,1,1,0,0,1,1,0};							// Puncturing vector for Rc = 5/6
const uint16_t MemDim = Nstates*MemFact;									// Viterbi decoder memory dimension for survivor paths storage 
const uint16_t InfoBitLen = InfoByteLen<<3;									// Source stream bit-length
const uint16_t UnpCodByteLen = 2*InfoByteLen;								// Unpunctured coded byte-length
const uint16_t UnpCodBitLen = UnpCodByteLen<<3;								// Unpunctured coded bit-length
const uint16_t PunCodByteLen = InfoByteLen*(Rc+1)/Rc;						// Punctured coded byte-length
const uint16_t PunCodBitLen = PunCodByteLen<<3;								// Punctured coded bit-length

const uint8_t TXINFO = 0;													// Label for the Tx uncoded stream printing
const uint8_t RXINFO = 1;													// Label for the Rx uncoded stream printing
const uint8_t TXCOD = 2;													// Label for the Tx encoded stream printing
const uint8_t RXCOD = 3;													// Label for the Rx encoded stream printing



/*** TYPEDEFS ***/

typedef struct TD1 {
	uint8_t OutBits[2];
	uint8_t NextState[2];
} info;

typedef struct TD2 {
	info States[Nstates];
} trellis;

typedef struct TD3 {
	uint16_t Iter[Nstates];
	uint16_t Dist[Nstates];
	uint8_t Path[Nstates][MemDim];
} vitdech;

typedef struct TD4 {
	uint16_t Iter[Nstates];
	float Dist[Nstates];
	uint8_t Path[Nstates][MemDim];
} vitdecs;



/*** FUNCTION PROTOTYPES ***/

void CheckParam( void );
void GetConPuncVect( uint8_t *ConVect, uint8_t *PuncVect );
void GetTrellis( uint8_t *ConVect, trellis *CodeDiagr );
void ConvEncoder( uint8_t *InBits, uint8_t *OutBits, uint8_t *ConVect, uint8_t *PunctVect );
void HardConvDecoder( uint8_t *InBits, uint8_t *OutBits, trellis *CodeDiagr, uint8_t *PunctVect );
void HardUnpuncturing( uint8_t *IoBytes, uint8_t *PunctVect );
uint8_t ComputeEncBit( uint8_t State, uint8_t ConVal );
uint8_t CountByteOnes( uint8_t InByte );
uint8_t FindMinIndexHard( vitdech *InPaths );
uint8_t FindMinIndexSoft( vitdecs *InPaths );

void RandByteGen( uint8_t *RandBytes );
void ChanBSC( uint8_t *InBytes, uint8_t *OutBytes, float Peb );
void CheckWrongBits( uint8_t *ByteStreamA, uint8_t *DecBytes, uint16_t Len, uint8_t Label );
void PrintParam( void );
void PrintArray( uint8_t *Bytes, uint16_t Len, uint8_t Label );



/*** MAIN FUNCTION ***/

int main(){

	uint8_t ConVect[2], PunctVect[2*Rc];
	uint8_t TxInfoStream[InfoByteLen], RxInfoStream[InfoByteLen];
	uint8_t TxCodedStream[UnpCodByteLen], RxCodedStream[UnpCodByteLen];
	trellis CodeDiagr;
	
	CheckParam();															// Check the parameters correctness
	PrintParam();
	RandByteGen(TxInfoStream);												// Random generation of source stream
	PrintArray(TxInfoStream,InfoByteLen,TXINFO);
	GetConPuncVect(ConVect,PunctVect);										// Retrieve connection and puncturing vectors
	GetTrellis(ConVect,&CodeDiagr);											// Retrieve trellis diagram information
	ConvEncoder(TxInfoStream,TxCodedStream,ConVect,PunctVect);				// Convolution encoding
	PrintArray(TxCodedStream,PunCodByteLen,TXCOD);
	ChanBSC(TxCodedStream,RxCodedStream,Peb);								// BSC channel simulation
	PrintArray(RxCodedStream,PunCodByteLen,RXCOD);
	CheckWrongBits(TxCodedStream,RxCodedStream,PunCodByteLen,RXCOD);		// Check number of corrupted bits before decoding
	HardConvDecoder(RxCodedStream,RxInfoStream,&CodeDiagr,PunctVect);		// Viterbi hard-decoding
	PrintArray(RxInfoStream,InfoByteLen,RXINFO);
	CheckWrongBits(TxInfoStream,RxInfoStream,InfoByteLen,RXINFO);			// Check number of corrupted bits after decoding

}



/*** CODING FUNCTIONS ***/

/**
 *	Function for checking the parameters correctness.
 **/
void CheckParam( void ){
	
	if ( (K != 3) && (K != 4) && (K != 5) && (K != 6) && (K != 7) && (K != 8) ){
		printf("\n ERROR : Invalid constrain length (K)\n");
		exit(1);
	} else if ( (Rc != RATE12) && (Rc != RATE23) && (Rc != RATE34) && (Rc != RATE56) ){
		printf("\n ERROR : Invalid code rate (Rc)\n");
		exit(1);
	} else if ( (InfoByteLen < 1) || (InfoByteLen > 4095) || (InfoByteLen%Rc != 0) ){
		printf("\n ERROR : Source byte-length must be positive, not greater than 4095 and multiple of k\n");
		exit(1);
	}
	
}


/**
 *	Function for retrieving connection and puncturing vectors as a function
 *  of the selected parameters K and Rc.
 **/
void GetConPuncVect( uint8_t *ConVect, uint8_t *PuncVect ){

	uint8_t PuncLen = 2*Rc;

	if ( ConVect != NULL ){
		memcpy(ConVect,CV[K-3],2);
	}

	if ( PuncVect != NULL ){
		switch ( Rc ){
			case RATE23:
				memcpy(PuncVect,PUNCT23,PuncLen);
				break;
			case RATE34:
				memcpy(PuncVect,PUNCT34,PuncLen);
				break;
			case RATE56:
				memcpy(PuncVect,PUNCT56,PuncLen);
				break;
		}
	}

}


/**
 *	Function for retrieving trellis diagram information (encoded bits and
 *	state transitions as a function of input bit) for Rc = 1/2.
 **/
void GetTrellis( uint8_t *ConVect, trellis *CodeDiagr ){

	uint8_t i, j;
	uint8_t StBin[Nstates];
	uint8_t State0, State1, OutBit;
	uint8_t Mask = 0x01;

	for ( j=0; j<Nstates; j++ ){
		StBin[j] = j;														// State IDs
	}

	if ( CodeDiagr != NULL ){
		for ( j=0; j<Nstates; j++ ){
			State0 = StBin[j];												// State update due to new 0-bit input
			for ( i=0; i<2; i++ ){
				OutBit = ComputeEncBit(State0,ConVect[i]);					// Estimate encoded bit from i-th connection branch
				if ( i == 0 ){
					CodeDiagr->States[j].OutBits[0] = (OutBit<<1);			// Store 1st encoded bit into trellis
				} else {
					CodeDiagr->States[j].OutBits[0] += OutBit;				// Store 2nd encoded bit into trellis
				}
			}
			CodeDiagr->States[j].NextState[0] = (State0>>1);				// Store next state into trellis (due to 0-bit input from j-th state)

			State1 = State0|(Mask<<(K-1));									// State update due to new 1-bit input
			for ( i=0; i<2; i++ ){
				OutBit = ComputeEncBit(State1,ConVect[i]);
				if ( i == 0 ){
					CodeDiagr->States[j].OutBits[1] = (OutBit<<1);
				} else {
					CodeDiagr->States[j].OutBits[1] += OutBit;
				}
			}
			CodeDiagr->States[j].NextState[1] = (State1>>1);				// Store next state into trellis (due to 1-bit input from j-th state)
		}
	}

}


/**
 *	Function for computing encoded bit as a function of the input current state
 *	state and connection vector.
 **/
uint8_t ComputeEncBit( uint8_t State, uint8_t ConVal ){

	uint8_t j;
	uint8_t OutBit = 0;
	uint8_t Mask = 0x01;

	for ( j=0; j<K; j++ ){
		OutBit += (((State>>j) & Mask) & ((ConVal>>j) & Mask));
	}

	return (OutBit%2);

}


/**
 *	Function for convolutional encoding the input byte stream according to the specified
 *	connection vectors and applying puncturing if target code rate is higher than 1/2.
 **/
void ConvEncoder( uint8_t *InBits, uint8_t *OutBits, uint8_t *ConVect, uint8_t *PunctVect ){

	uint8_t EncState = 0;
	uint8_t Mask = 0x01;
	uint16_t j, ByteIdx;
	uint8_t BitIdx;
									
	memset(OutBits,0,UnpCodByteLen);

	for ( j=0; j<InfoBitLen; j++ ){
		ByteIdx = j>>3;														// Update byte-index for input stream reading
		BitIdx = (uint8_t)(j&0x0007);										// Update bit-index for input stream reading
		EncState >>= 1;
		EncState |= ((InBits[ByteIdx]>>(7-BitIdx))&Mask)<<(K-1);			// Update the encoder state with the latest input bit
		ByteIdx = (2*j)>>3;																// Update byte-index for output stream writing
		BitIdx = (2*j)&0x0007;															// Update bit-index for output stream writing
		OutBits[ByteIdx] |= (ComputeEncBit(EncState,ConVect[0])<<(7-BitIdx));
		OutBits[ByteIdx] |= (ComputeEncBit(EncState,ConVect[1])<<(6-BitIdx));
	}

	if ( Rc != RATE12 ){													//  Apply puncturing if selected Rc is higher than 1/2

		uint16_t WrIdx = 0;
		uint8_t RdBit;

		for ( j=0; j<UnpCodBitLen; j++ ){

			ByteIdx = (j>>3);
			BitIdx = (j&0x0007);
			RdBit = (OutBits[ByteIdx]>>(7-BitIdx))&Mask;					// j-th bit of the unpunctured output stream

			if ( PunctVect[j%(2*Rc)] ){

				ByteIdx = WrIdx>>3;
				BitIdx = 7-(uint8_t)(WrIdx&0x0007);
				WrIdx++;

				if ( RdBit == 0 )
					OutBits[ByteIdx] &= ~(0x01<<BitIdx);
				else
					OutBits[ByteIdx] |= (0x01<<BitIdx);

			}
		}

	}

}


/**
 *	Function for convolutional decoding (employing the Viterbi hard algorithm) the input
 *	byte stream according to the specified trellis diagram and applying unpuncturing if
 *	code rate is higher than 1/2.
 **/
void HardConvDecoder( uint8_t *InBits, uint8_t *OutBits, trellis *CodeDiagr, uint8_t *PunctVect ){

	uint16_t i, ByteIdx, InIdx, WrIdx, IdxFin, CandDist;
	uint8_t j, CycleBits, BitIdx, MaskEras, HypIdx, HamDist;
	uint8_t NextSt, MinDistState, StateDep, StateArr;
	uint8_t Mask = 0x01;

	vitdech CurPaths = {.Iter = {0}, .Dist = {0}, .Path = {{0}}};
	CurPaths.Iter[0] = 1;													// Enable only the all-zero state at the beginning
	vitdech PrevPaths;

	if ( Rc == RATE12 ){													// Check if unpuncturing is needed
		MaskEras = 0x03;													// Erasure mask (0x03 means no erasure on any pair of input bits)
	} else {
		HardUnpuncturing(InBits,PunctVect);
	}

	for ( i=2; i<InfoBitLen+2; i++){

		InIdx = 2*(i-2);
		ByteIdx = (InIdx>>3);
		BitIdx = (uint8_t)(InIdx&0x0007);
		CycleBits = (InBits[ByteIdx]>>(6-BitIdx))&0x03;						// Latest pair of input bits
		PrevPaths = CurPaths;

		if ( Rc != RATE12 ){												// Estimate the erasure mask if unpuncturing has been applied
			MaskEras = 0;
			MaskEras |= (PunctVect[InIdx%(2*Rc)]<<1);
			MaskEras |= PunctVect[(InIdx+1)%(2*Rc)];
		}

		for ( j=0; j<Nstates; j++ ){

			if ( PrevPaths.Iter[j] == i-1 ){ 								// Check if j-th state was active in the previous iteration

				for ( HypIdx = 0; HypIdx<2; HypIdx++ ){

					HamDist = CountByteOnes((CycleBits^(CodeDiagr->States[j].OutBits[HypIdx]))&MaskEras); 	// Compute Hamming distance assuming HypIdx-value input bit
					NextSt = CodeDiagr->States[j].NextState[HypIdx];										// Compute trellis next state assuming HypIdx-value input bit
				
					if ( CurPaths.Iter[NextSt] < i ){											// If there's not yet a survivor path for NextSt state at i-th cycle
					
						CurPaths.Iter[NextSt] = i;												// Update the state iteration counter
						CurPaths.Dist[NextSt] = PrevPaths.Dist[j]+(uint16_t)HamDist;			// Update the state distance
						
						if ( i-1 < MemDim ){
							IdxFin = i-2;
						} else {
							IdxFin = MemDim-1;
						}
						
						for ( WrIdx = 0; WrIdx < IdxFin; WrIdx++ ){								// Update the state path among previous states
							CurPaths.Path[NextSt][WrIdx] = PrevPaths.Path[j][WrIdx];
						}
						CurPaths.Path[NextSt][IdxFin] = j;							
					
					} else {												// If a survivor path for NextSt state at i-th cycle already exists, check if the new candidate is better

						CandDist = PrevPaths.Dist[j]+(uint16_t)HamDist;

						if ( CandDist < CurPaths.Dist[NextSt] ){

							CurPaths.Dist[NextSt] = CandDist;

							if ( i-1 < MemDim ){
								IdxFin = i-2;
							} else {
								IdxFin = MemDim-1;
							}

							for ( WrIdx = 0; WrIdx < IdxFin; WrIdx++ ){
								CurPaths.Path[NextSt][WrIdx] = PrevPaths.Path[j][WrIdx];
							}
							CurPaths.Path[NextSt][IdxFin] = j;

						}
					}
				}
			}
		}

		if ( i-1 == InfoBitLen ){											// If input bit stream is over, flush the decoder memory and extract the final info bits

			MinDistState = FindMinIndexHard(&CurPaths);						// Look for the minimum distance survivor path

			if ( i-1 >= MemDim ){											// Check if memory has been completely filled
				IdxFin = MemDim;
			} else {
				IdxFin = i-1;
			}

			for ( WrIdx=0; WrIdx<IdxFin; WrIdx++ ){

				StateDep = CurPaths.Path[MinDistState][WrIdx];				// Departure state

				if ( WrIdx == IdxFin-1 ){
					StateArr = MinDistState;								// Arrival state
				} else {
					StateArr = CurPaths.Path[MinDistState][WrIdx+1];
				}


				ByteIdx = (InfoBitLen-IdxFin+WrIdx)>>3;
				BitIdx = (uint8_t)((InfoBitLen-IdxFin+WrIdx)&0x0007);

				if ( CodeDiagr->States[StateDep].NextState[0] == StateArr ){
					OutBits[ByteIdx] &= ~(Mask<<(7-BitIdx));				// Set output bit to 0
				} else {
					OutBits[ByteIdx] |= (Mask<<(7-BitIdx));					// Set output bit to 1
				}
			}

		} else if ( i-1 >= MemDim ){										// If input bit stream is not over but memory is full, extract the oldest info bit
			
			MinDistState = FindMinIndexHard(&CurPaths);
			StateDep = CurPaths.Path[MinDistState][0];
			StateArr = CurPaths.Path[MinDistState][1];
			ByteIdx = (i-MemDim-1)>>3;
			BitIdx = (uint8_t)((i-MemDim-1)&0x0007);
			
			if ( CodeDiagr->States[StateDep].NextState[0] == StateArr ){
				OutBits[ByteIdx] &= ~(Mask<<(7-BitIdx));					// Set output bit to 0
			} else {
				OutBits[ByteIdx] |= (Mask<<(7-BitIdx));						// Set output bit to 1
			}
			
			for ( j=0; j<Nstates; j++){
				for ( WrIdx = 0; WrIdx<(MemDim-1); WrIdx++ ){
					CurPaths.Path[j][WrIdx] = CurPaths.Path[j][WrIdx+1];	// Left all the survivor paths
				}
			}
		}
	}

	
}


/**
 *	Function for counting the number of 1-bits within the input byte.
 **/
uint8_t CountByteOnes( uint8_t InByte ){

	uint8_t j;
	uint8_t Counter = 0;
	uint8_t Mask = 0x01;

	for ( j=0; j<8; j++ ){

		if ( (InByte>>j)&Mask ){
			Counter++;
		}
	}

	return Counter;

}


/**
 *	Function for finding the survivor path with minimum distance in the hard case.
 **/
uint8_t FindMinIndexHard( vitdech *InPaths ){

	uint8_t j, MinStateIdx;
	uint32_t MinDist;

	if ( InPaths != NULL ){

		MinDist = InPaths->Dist[0];
		MinStateIdx = 0;

		for ( j=1; j<Nstates; j++ ){
			if ( (InPaths->Iter[j]>0) && (InPaths->Dist[j] < MinDist) ){
				MinDist = InPaths->Dist[j];
				MinStateIdx = j;
			}
		}
	}

	return MinStateIdx;

}


/**
 *	Function for unpuncturing the input byte stream for code rates higher than 1/2
 *	according to the specified puncturing vector.
 **/
void HardUnpuncturing( uint8_t *IoBytes, uint8_t *PunctVect ){

	uint8_t Mask = 0x01;
	uint16_t RdIdxPunc = 2*Rc-1;
	uint16_t RdIdx = PunCodBitLen-1;										// Final bit index of input stream length
	uint16_t j, ByteIdx;
	uint8_t BitIdx, RdBit;

	for ( j=UnpCodBitLen; j>0; j-- ){

		if ( PunctVect[RdIdxPunc] == 1 ){
			ByteIdx = (RdIdx>>3);
			BitIdx = 7-(RdIdx&0x0007);
			RdBit = IoBytes[ByteIdx]&(Mask<<BitIdx);
			RdIdx--;
		} else {
			RdBit = 0;														// Each erasure bit restored has 0 value
		}

		if ( RdIdxPunc > 0 ){
			RdIdxPunc--;
		} else {
			RdIdxPunc = 2*Rc-1;
		}

		ByteIdx = ((j-1)>>3);
		BitIdx = 7-((j-1)&0x0007);

		if ( RdBit == 0 ){
			IoBytes[ByteIdx] &= ~(Mask<<BitIdx);							// Set output bit to 0
		} else {
			IoBytes[ByteIdx] |= (Mask<<BitIdx);								// Set output bit to 1
		}
	}

}



/*** EXTRA FUNCTIONS ***/

/**
 *	Function for filling the input array with random bytes (integer values from 0 to 255).
 **/
void RandByteGen( uint8_t *IoBytes ){

	uint16_t j;
	srand(time(NULL));														// Link random seed to actual time
	for ( j=0; j<InfoByteLen; j++ ){
		IoBytes[j] = (uint8_t)rand();
	} 

}


/**
 *	Function for simulating a Binary Symmetric Channel (BSC) in order to introduce errors
 *	from the input to the output byte-stream with probability fixed by parameter Peb.
 **/
void ChanBSC( uint8_t *InBytes, uint8_t *OutBytes, float Peb ){

	uint16_t j, ByteIdx;
	uint8_t BitIdx;
	uint8_t Mask = 0x01;
	
	if ( (InBytes != NULL) && (OutBytes != NULL) ){

		memcpy(OutBytes,InBytes,PunCodByteLen);
		srand(time(NULL));													// Link random seed to actual time

		for ( j=0; j<PunCodBitLen; j++ ){

			if ( (float)rand( )/(float)RAND_MAX < Peb ){

				ByteIdx = (j>>3);
				BitIdx  = 7-(uint8_t)(j&0x0007);

				if ( OutBytes[ByteIdx] & (Mask<<BitIdx) ){
					OutBytes[ByteIdx] &= ~(Mask<<BitIdx);
				} else {
					OutBytes[ByteIdx] |= (Mask<<BitIdx);
				}
			}
		}
	}

}


/**
 *	Function for printing paramenters on terminal.
 **/
void PrintParam(){

	printf(" * PARAMETERS\n\tK = %d",K);
	printf("\n\tRc = %d/%d",Rc,Rc+1);
	printf("\n\tPeb = %1.3f\n\n",Peb);

}


/**
 *	Function for printing on terminal (in hexadecimal format) the input byte-array content.
 **/
void PrintArray( uint8_t *Bytes, uint16_t Len, uint8_t Label ){

	uint16_t j;

	switch ( Label ){
		case TXINFO:
			printf(" - TX INFO BITS");
			break;
		case TXCOD:
			printf(" - TX CODED BITS");
			break;
		case RXCOD:
			printf(" - RX CODED BITS");
			break;
		case RXINFO:
			printf(" - RX INFO BITS");
			break;
	}

	printf(" (%d bytes)\n\t",Len);

	for ( j=0; j<Len; j++){
		printf("%2X ",Bytes[j]);
		if ( (j%10 == 9) && (j<(Len-1)) ) {
			printf("\n\t");
		}
	}
	printf("\n\n");

}


/**
 *	Function for estimating the number of mismatched bits between the two input byte-arrays.
 **/
void CheckWrongBits( uint8_t *ByteStreamA, uint8_t *ByteStreamB, uint16_t Len, uint8_t Label ){
	
	uint8_t BitIdx;
	uint16_t j, ByteIdx;
	uint16_t ErrCount = 0;
	uint8_t Mask = 0x01;
	uint16_t BitLen = Len<<3;
	
	if ( (ByteStreamA != NULL) && (ByteStreamB != NULL) ){
		for ( j=0; j<BitLen; j++){
			ByteIdx = (j>>3);
			BitIdx = (uint8_t)(j&0x0007);
			if ( (((ByteStreamA[ByteIdx])>>BitIdx)&Mask) != (((ByteStreamB[ByteIdx])>>BitIdx)&Mask) ){
				ErrCount++;
			}
		}
	}
	
	if ( Label == RXCOD ){
		printf(" - Errors before decoding : %d out of %d bits\n\n",ErrCount,BitLen);
	} else if ( Label == RXINFO ){
		printf(" - Errors after decoding : %d out of %d bits\n\n",ErrCount,BitLen);
	}
	
}



/*
NOTES

NB#1: To be compliant with DVB-S standard convolutional coding, use K=7 and CV = {121,91}.
*/