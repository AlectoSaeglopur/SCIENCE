
/**
 * @file modulation.c
 * @author Filippo Valmori
 * @date 14/12/2018
 * @brief Implementation of digital modulators and demodulator (PSK-QAM).
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "modulation.h"



/******************/
/*** PROTOTYPES ***/
/******************/

static void GetGray( uint8_t *IoArray );



/*****************/
/*** FUNCTIONS ***/
/*****************/

/**
 * @brief Function to retrieve mapping table between bits and PSK symbols (with Gray coding).
 * @param IoTable : Mapping table to be written.
 * @return none
 */
void GetPskTable( phasemap *IoTable ){
	uint8_t j;
	uint8_t GrayArray[M];
	GetGray(GrayArray);
	for ( j=0; j<M; j++ ){
		IoTable->Bits[j] = GrayArray[j];
		IoTable->Symbs[j].Re = cos(PhOfst+2*M_PI*j/M);
		IoTable->Symbs[j].Im = sin(PhOfst+2*M_PI*j/M);
	}
}


/**
 * @brief Function to retrieve mapping table between bits and QAM symbols (with Gray coding).
 * @param IoTable : Constellation mapping table table to be written.
 * @return none
 */
void GetQamTable( phasemap *IoTable ){
	uint8_t j;
	uint8_t GrayArray[M];
	uint8_t MaxVal = (1<<(L/2))-1;
	uint8_t Nrows = sqrt(M);
	div_t DivFct; 
	GetGray(GrayArray);
	for ( j=0; j<M; j++ ){
		DivFct = div(j,Nrows);
		IoTable->Bits[j] = GrayArray[j];
		IoTable->Symbs[j].Re = (-MaxVal+2*DivFct.rem)*pow(-1,DivFct.quot+1);
		IoTable->Symbs[j].Im = MaxVal-2*DivFct.quot;
	}
}


/**
 * @brief Function to retrieve Gray coded vector of length M.
 * @param IoArray : Gray coded vector to be written.
 * @return none
 */
static void GetGray( uint8_t *IoArray ){
	uint8_t i, WrIdx, Counter;
	uint8_t Nblk, Shift;
	uint8_t Mask = 0x01;
	memset(IoArray,0,M);
	for ( i=0; i<L; i++ ){
		Nblk = M/(1<<i);																			/** Number of bits per block at i-th iteration */
		Shift = L-i-1;																				/** Bit shift value at i-th iteration */
		Counter = 0;																				/** Counter within each single block */
		WrIdx = Nblk/2;																				/** Starting value of the writing index */
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
 * @brief Function to map an input byte stream into the specified constellation symbols.
 * @param InByt : Input byte stream.
 * @param OutSymbs : Output symbol stream.
 * @param Table : Constellation mapping table.
 * @return none
 */
void Mapper( uint8_t *InByt, complex *OutSymbs, phasemap *Table ){
	uint8_t i, BitIdx;
	uint32_t ByteIdx;
	uint32_t j = 0;
	int8_t CurBits = 0;
	uint8_t SymbIdx = 0;
	uint8_t Mask = 0x01;
	while ( j < PunBitLen ){
		SymbIdx++;
		ByteIdx = j>>3;
		BitIdx = (uint8_t)(7-(j&0x0007));
		CurBits |= ((InByt[ByteIdx]>>BitIdx)&Mask)<<(L-SymbIdx);
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
 * @brief Function for hard-demapping an input symbol stream into corresponding bit stream.
 * @param InSym : Input symbol stream.
 * @param OutBytes : Output byte stream.
 * @param Table : Constellation mapping table.
 * @return none
 */
void HardDemapper( complex *InSym, uint8_t *OutBytes, phasemap *Table ){
	uint8_t i, MinIdx, BitIdx;
	uint32_t j, ByteIdx;
	uint8_t Mask = 0x01;
	uint32_t k = 0;																					/** Bit counter for output stream writing */
	float MinDist, CurDist;
	memset(OutBytes,0,PunBytLen);
	for ( j=0; j<SymLen; j++ ){
		MinIdx = 0;
		MinDist = fabs(InSym[j].Re-Table->Symbs[0].Re)+fabs(InSym[j].Im-Table->Symbs[0].Im);
		for ( i=1; i<M; i++ ){
			CurDist = fabs(InSym[j].Re-Table->Symbs[i].Re)+fabs(InSym[j].Im-Table->Symbs[i].Im);
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
 * @brief Function for soft-demapping an input symbol stream into corresponding LLR stream.
 * @param InSym : Input symbol stream.
 * @param OutLLRs : Output float LLR stream.
 * @param Table : Constellation mapping table.
 * @return none
 */
void SoftDemapper( complex *InSym, float *OutLLRs, phasemap *Table ){
	uint32_t k;
	uint8_t i, j;
	float Num, Den, Dist;
	uint8_t Mask = 0x01;
	float N0 = 4;																					/** Assumed noise variance in linear (i.e. about 6 dB) */
	if ( M == 2 ){
		for ( k=0; k<PunBitLen; k++ ){
			OutLLRs[k] = -InSym[k].Im;
		}
	} else {
		for ( k=0; k<SymLen; k++ ){
			for ( i=0; i<L; i++ ){
				Num = 0;
				Den = 0;
				for ( j=0; j<M ; j++ ){
					Dist = exp(-(pow(InSym[k].Re-Table->Symbs[j].Re,2)+pow(InSym[k].Im-Table->Symbs[j].Im,2))/N0);
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
