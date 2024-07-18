
/**
 * @file convolutional.c
 * @author Filippo Valmori
 * @date 14/12/2018
 * @brief Implementation of convolutional encoder and decoder.
 */

/****************/
/*** INCLUDES ***/
/****************/

#include "convolutional.h"



/******************/
/*** PROTOTYPES ***/
/******************/

static uint8_t ComputeEncBit( uint8_t State, uint8_t ConVal );
static uint8_t FindMinIndexHard( vitdech *InPaths );
static void HardDepuncturing( uint8_t *IoBytes, uint8_t *PunctVect );
static float GetEuclideanDist( float *CurLLRs, uint8_t TrlByte, uint8_t MaskEras );
static uint8_t FindMinIndexSoft( vitdecs *InPaths );
static void SoftDepuncturing( float *InLLRs, uint8_t *PunctVect );



/*****************/
/*** FUNCTIONS ***/
/*****************/

/**
 * @brief Function for retrieving convolutional connection and puncturing vectors (as a function of the selected parameters K and Rc).
 * @param ConVect : Pointer where to write connection vector.
 * @param PuncVect : Pointer where to write puncturing vector.
 * @return none
 */
void GetConvCP( uint8_t *ConVect, uint8_t *PuncVect ){
	uint8_t PuncLen = 2*Rc;
	if ( ConVect != NULL ){
		memcpy(ConVect,G[K-3],2);
	}
	if ( PuncVect != NULL ){
		switch ( Rc ){
			case RATE_23:
				memcpy(PuncVect,PUNCT_23,PuncLen);
				break;
			case RATE_34:
				memcpy(PuncVect,PUNCT_34,PuncLen);
				break;
			case RATE_56:
				memcpy(PuncVect,PUNCT_56,PuncLen);
				break;
			case RATE_78:
				memcpy(PuncVect,PUNCT_78,PuncLen);
				break;
		}
	}
}


/**
 * @brief Function for retrieving depunctured trellis diagram information (Rc = 1/2).
 * @param ConVect : Pointer to connection vector.
 * @param CodeDiagr : Pointer where to write convolutional coding diagram.
 * @return none
 */
void GetTrellis( uint8_t *ConVect, trellis *CodeDiagr ){
	uint8_t i, j;
	uint8_t StBin[N_TSTAT];
	uint8_t State0, State1, OutBit;
	uint8_t Mask = 0x01;
	for ( j=0; j<N_TSTAT; j++ ){
		StBin[j] = j;																		/** State IDs */
	}
	if ( CodeDiagr != NULL ){
		for ( j=0; j<N_TSTAT; j++ ){
			State0 = StBin[j];																/** State update due to new 0-bit input */
			for ( i=0; i<2; i++ ){
				OutBit = ComputeEncBit(State0,ConVect[i]);									/** Estimate encoded bit from i-th connection branch */
				if ( i == 0 ){
					CodeDiagr->States[j].OutBits[0] = (OutBit<<1);							/**  Store 1st encoded bit into trellis */
				} else {
					CodeDiagr->States[j].OutBits[0] += OutBit;								/** Store 2nd encoded bit into trellis */
				}
			}
			CodeDiagr->States[j].NextState[0] = (State0>>1);								/** Store next state into trellis (due to 0-bit input from j-th state) */
			State1 = State0|(Mask<<(K-1));													/** State update due to new 1-bit input */
			for ( i=0; i<2; i++ ){
				OutBit = ComputeEncBit(State1,ConVect[i]);
				if ( i == 0 ){
					CodeDiagr->States[j].OutBits[1] = (OutBit<<1);
				} else {
					CodeDiagr->States[j].OutBits[1] += OutBit;
				}
			}
			CodeDiagr->States[j].NextState[1] = (State1>>1);								/** Store next state into trellis (due to 1-bit input from j-th state) */
		}
	}
}


/**
 * @brief Function for computing the next encoded bit.
 * @param State : Current convolutional state.
 * @param ConVal : Connection vector.
 * @return Next encoded bit.
 */
static uint8_t ComputeEncBit( uint8_t State, uint8_t ConVal ){
	uint8_t j;
	uint8_t OutBit = 0;
	uint8_t Mask = 0x01;
	for ( j=0; j<K; j++ ){
		OutBit += (((State>>j) & Mask) & ((ConVal>>j) & Mask));
	}
	return (OutBit%2);
}


/**
 * @brief Function for convolutionally encoding a byte stream (applying puncturing as well).
 * @param InByt : Input byte stream.
 * @param OutByt : Output byte stream.
 * @param ConVect : Connection vector.
 * @param PunctVect : Puncturing vector.
 * @return none
 */
void ConvEncoder( uint8_t *InByt, uint8_t *OutByt, uint8_t *ConVect, uint8_t *PunctVect ){
	uint8_t EncState = 0;
	uint8_t Mask = 0x01;
	uint32_t j, ByteIdx;
	uint8_t BitIdx, RdBit;
	uint32_t WrIdx = 0;							
	memset(OutByt,0,DepBytLen);
	for ( j=0; j<SrcBitLen; j++ ){
		ByteIdx = j>>3;																		/** Update byte index for input stream reading */
		BitIdx = (uint8_t)(j&0x0007);														/** Update bit index for input stream reading */
		EncState >>= 1;
		EncState |= ((InByt[ByteIdx]>>(7-BitIdx))&Mask)<<(K-1);								/** Update encoder state with latest input bit */
		ByteIdx = (2*j)>>3;																	/** Update byte index for output stream writing */
		BitIdx = (2*j)&0x0007;																/** Update bit index for output stream writing */
		OutByt[ByteIdx] |= (ComputeEncBit(EncState,ConVect[0])<<(7-BitIdx));
		OutByt[ByteIdx] |= (ComputeEncBit(EncState,ConVect[1])<<(6-BitIdx));
	}
	if ( Rc != RATE_12 ){																	/**  Apply puncturing if selected Rc is higher than 1/2 */
		for ( j=0; j<DepBitLen; j++ ){
			ByteIdx = (j>>3);
			BitIdx = (j&0x0007);
			RdBit = (OutByt[ByteIdx]>>(7-BitIdx))&Mask;										/** j-th bit of depunctured output stream */
			if ( PunctVect[j%(2*Rc)] ){														/** Check if a puncturing shall be added */
				ByteIdx = WrIdx>>3;
				BitIdx = 7-(uint8_t)(WrIdx&0x0007);
				WrIdx++;
				if ( RdBit == 0 ){
					OutByt[ByteIdx] &= ~(0x01<<BitIdx);
				} else {
					OutByt[ByteIdx] |= (0x01<<BitIdx);
				}
			}
		}
	}
}


/**
 * @brief Function for convolutionally decoding a byte stream (and depuncturing as well) by implementing Viterbi hard algorithm.
 * @param EncByt : Input encoded byte stream.
 * @param DecByt : Output decoded byte stream.
 * @param CodeDiagr : Trellis diagram.
 * @param PunctVect : Puncturing vector.
 * @return none
 */
void HardConvDecoder( uint8_t *EncByt, uint8_t *DecByt, trellis *CodeDiagr, uint8_t *PunctVect ){
	uint32_t i, ByteIdx, InIdx, WrIdx, IdxFin, CandDist;
	uint8_t j, CycleBits, BitIdx, MaskEras, HypIdx, HamDist;
	uint8_t NextSt, MinDistState, StateDep, StateArr;
	uint8_t Mask = 0x01;
	vitdech CurPaths = {.Iter = {0}, .Dist = {0}, .Path = {{0}}};
	CurPaths.Iter[0] = 1;																	/** Enable only all-zero state at the beginning */
	vitdech PrevPaths;
	if ( Rc == RATE_12 ){																	/** Check if Depuncturing is needed */
		MaskEras = 0x03;																	/** Use no-erasure mask for depuctured case */
	} else {
		HardDepuncturing(EncByt,PunctVect);
	}
	for ( i=2; i<SrcBitLen+2; i++){
		InIdx = 2*(i-2);
		ByteIdx = (InIdx>>3);
		BitIdx = (uint8_t)(InIdx&0x0007);
		CycleBits = (EncByt[ByteIdx]>>(6-BitIdx))&0x03;										/** Latest pair of input bits */
		PrevPaths = CurPaths;
		if ( Rc != RATE_12 ){																/** Estimate erasure mask if Depuncturing has been applied */
			MaskEras = 0;
			MaskEras |= (PunctVect[InIdx%(2*Rc)]<<1);
			MaskEras |= PunctVect[(InIdx+1)%(2*Rc)];
		}
		for ( j=0; j<N_TSTAT; j++ ){
			if ( PrevPaths.Iter[j] == i-1 ){ 												/** Check if j-th state was active in previous iteration */
				for ( HypIdx = 0; HypIdx<2; HypIdx++ ){
					HamDist = CountByteOnes((CycleBits^(CodeDiagr->States[j].OutBits[HypIdx]))&MaskEras); 	/** Compute Hamming distance assuming HypIdx-value input bit */
					NextSt = CodeDiagr->States[j].NextState[HypIdx];										/** Compute trellis next state assuming HypIdx-value input bit */
					if ( CurPaths.Iter[NextSt] < i ){										/** If there's not yet a survivor path for NextSt state at i-th cycle */
						CurPaths.Iter[NextSt] = i;											/** Update state iteration counter */
						CurPaths.Dist[NextSt] = PrevPaths.Dist[j]+(uint32_t)HamDist;		/** Update state distance */
						if ( i-1 < MEM_DIM ){
							IdxFin = i-2;
						} else {
							IdxFin = MEM_DIM-1;
						}
						for ( WrIdx = 0; WrIdx < IdxFin; WrIdx++ ){							/** Update state path among previous states */
							CurPaths.Path[NextSt][WrIdx] = PrevPaths.Path[j][WrIdx];
						}
						CurPaths.Path[NextSt][IdxFin] = j;							
					} else {																/** If a survivor path for NextSt state at i-th cycle already exists, check if new candidate is better */
						CandDist = PrevPaths.Dist[j]+(uint32_t)HamDist;
						if ( CandDist < CurPaths.Dist[NextSt] ){
							CurPaths.Dist[NextSt] = CandDist;
							if ( i-1 < MEM_DIM ){
								IdxFin = i-2;
							} else {
								IdxFin = MEM_DIM-1;
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
		if ( i-1 == SrcBitLen ){															/** If input bit stream is over, flush decoder memory and extract final info bits */
			MinDistState = FindMinIndexHard(&CurPaths);										/** Look for minimum distance survivor path */
			if ( i-1 >= MEM_DIM ){															/** Check if memory has been completely filled */
				IdxFin = MEM_DIM;
			} else {
				IdxFin = i-1;
			}
			for ( WrIdx=0; WrIdx<IdxFin; WrIdx++ ){
				StateDep = CurPaths.Path[MinDistState][WrIdx];								/** Departure state */
				if ( WrIdx == IdxFin-1 ){
					StateArr = MinDistState;												/** Arrival state */
				} else {
					StateArr = CurPaths.Path[MinDistState][WrIdx+1];
				}
				ByteIdx = (SrcBitLen-IdxFin+WrIdx)>>3;
				BitIdx = (uint8_t)((SrcBitLen-IdxFin+WrIdx)&0x0007);
				if ( CodeDiagr->States[StateDep].NextState[0] == StateArr ){
					DecByt[ByteIdx] &= ~(Mask<<(7-BitIdx));									/** Set output bit to 0 */
				} else {
					DecByt[ByteIdx] |= (Mask<<(7-BitIdx));									/** Set output bit to 1 */
				}
			}
		} else if ( i-1 >= MEM_DIM ){														/** If input bit stream is not over but memory is full, extract oldest info bit */
			MinDistState = FindMinIndexHard(&CurPaths);
			StateDep = CurPaths.Path[MinDistState][0];
			StateArr = CurPaths.Path[MinDistState][1];
			ByteIdx = (i-MEM_DIM-1)>>3;
			BitIdx = (uint8_t)((i-MEM_DIM-1)&0x0007);
			if ( CodeDiagr->States[StateDep].NextState[0] == StateArr ){
				DecByt[ByteIdx] &= ~(Mask<<(7-BitIdx));										/** Set output bit to 0 */
			} else {
				DecByt[ByteIdx] |= (Mask<<(7-BitIdx));										/** Set output bit to 1 */
			}
			for ( j=0; j<N_TSTAT; j++){
				for ( WrIdx = 0; WrIdx<(MEM_DIM-1); WrIdx++ ){
					CurPaths.Path[j][WrIdx] = CurPaths.Path[j][WrIdx+1];					/** Keep all survivor paths */
				}
			}
		}
	}
}


/**
 * @brief Function for counting the number of 1-bits within the input byte.
 * @param InByte : Input byte.
 * @return Number of '1's.
 */
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
 * @brief Function to find hard-case survivor path with minimum distance.
 * @param InPaths : Input edcoding paths.
 * @return Minimum distance state index.
 */
static uint8_t FindMinIndexHard( vitdech *InPaths ){
	uint8_t j, MinStateIdx;
	uint32_t MinDist;
	if ( InPaths != NULL ){
		MinDist = InPaths->Dist[0];
		MinStateIdx = 0;
		for ( j=1; j<N_TSTAT; j++ ){
			if ( (InPaths->Iter[j]>0) && (InPaths->Dist[j] < MinDist) ){
				MinDist = InPaths->Dist[j];
				MinStateIdx = j;
			}
		}
	}
	return MinStateIdx;
}


/**
 * @brief Function to depuncture a byte stream (for code rates higher than 1/2).
 * @param IoByt : I/O byte stream.
 * @param PunctVect : Puncturing vector.
 * @return none.
 */
static void HardDepuncturing( uint8_t *IoByt, uint8_t *PunctVect ){
	uint8_t Mask = 0x01;
	uint8_t RdIdxPunc = 2*Rc-1;
	uint32_t RdIdx = PunBitLen-1;															/** Final bit index of input stream length */
	uint32_t j, ByteIdx;
	uint8_t BitIdx, RdBit;
	for ( j=DepBitLen; j>0; j-- ){
		if ( PunctVect[RdIdxPunc] == 1 ){
			ByteIdx = RdIdx>>3;
			BitIdx = (uint8_t)(7-(RdIdx&0x0007));
			RdBit = IoByt[ByteIdx]&(Mask<<BitIdx);
			RdIdx--;
		} else {
			RdBit = 0;																		/** Each erasure bit restored has '0' value */
		}
		if ( RdIdxPunc > 0 ){
			RdIdxPunc--;
		} else {
			RdIdxPunc = 2*Rc-1;
		}
		ByteIdx = (j-1)>>3;
		BitIdx = (uint8_t)(7-((j-1)&0x0007));
		if ( RdBit == 0 ){
			IoByt[ByteIdx] &= ~(Mask<<BitIdx);												/** Set output bit to '0' */
		} else {
			IoByt[ByteIdx] |= (Mask<<BitIdx);												/** Set output bit to '1' */
		}
	}
}


/**
 * @brief Function for convolutionally decoding a byte stream (and depuncturing as well) by implementing Viterbi soft algorithm.
 * @param InLLRs : Input float LLR stream.
 * @param DecByt : Output decoded byte stream.
 * @param CodeDiagr : Trellis diagram.
 * @param PunctVect : Puncturing vector.
 * @return none
 */
void SoftConvDecoder( float *InLLRs, uint8_t *DecByt, trellis *CodeDiagr, uint8_t *PunctVect ){
	uint32_t i, ByteIdx, CurIdx, WrIdx, IdxFin;
	uint8_t j, BitIdx, MaskEras, HypIdx;
	uint8_t NextSt, MinDistState, StateDep, StateArr;
	float EuclDist, CandDist;
	uint8_t Mask = 0x01;
	vitdecs CurPaths = {.Iter = {0}, .Dist = {0}, .Path = {{0}}};
	CurPaths.Iter[0] = 1;																	/** Enable only the all-zero state at the beginning */
	vitdecs PrevPaths;
	if ( Rc == RATE_12 ){																	/** Check if Depuncturing is needed */
		MaskEras = 0x03;																	/** Use no-erasure mask for depuctured case */
	} else {
		SoftDepuncturing(InLLRs,PunctVect);
	}
	for ( i=2; i<SrcBitLen+2; i++){
		CurIdx = 2*(i-2);
		PrevPaths = CurPaths;
		if ( Rc != RATE_12 ){																/** Estimate specific erasure mask if Depuncturing has been applied */
			MaskEras = 0;
			MaskEras |= (PunctVect[CurIdx%(2*Rc)]<<1);
			MaskEras |= PunctVect[(CurIdx+1)%(2*Rc)];
		}
		for ( j=0; j<N_TSTAT; j++ ){
			if ( PrevPaths.Iter[j] == i-1 ){ 												/** Check if j-th state was active in the previous iteration */
				for ( HypIdx = 0; HypIdx<2; HypIdx++ ){
					EuclDist = GetEuclideanDist(&InLLRs[CurIdx],CodeDiagr->States[j].OutBits[HypIdx],MaskEras);		/** Compute Euclidean distance assuming HypIdx-value input bit */
					NextSt = CodeDiagr->States[j].NextState[HypIdx];												/** Compute trellis next state assuming HypIdx-value input bit */
					if ( CurPaths.Iter[NextSt] < i ){										/** If there's not yet a survivor path for NextSt state at i-th cycle */
						CurPaths.Iter[NextSt] = i;											/** Update the state iteration counter */
						CurPaths.Dist[NextSt] = PrevPaths.Dist[j]+EuclDist;					/* Update the state distance */
						if ( i-1 < MEM_DIM ){
							IdxFin = i-2;
						} else {
							IdxFin = MEM_DIM-1;
						}
						for ( WrIdx = 0; WrIdx < IdxFin; WrIdx++ ){							/** Update the state path among previous states */
							CurPaths.Path[NextSt][WrIdx] = PrevPaths.Path[j][WrIdx];
						}
						CurPaths.Path[NextSt][IdxFin] = j;
					} else {																/** If a survivor path for NextSt state at i-th cycle already exists, check if the new candidate is better */
						CandDist = PrevPaths.Dist[j]+EuclDist;
						if ( CandDist < CurPaths.Dist[NextSt] ){
							CurPaths.Dist[NextSt] = CandDist;
							if ( i-1 < MEM_DIM ){
								IdxFin = i-2;
							} else {
								IdxFin = MEM_DIM-1;
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
		if ( i-1 == SrcBitLen ){															/** If input bit stream is over, flush the decoder memory and extract the final info bits */
			MinDistState = FindMinIndexSoft(&CurPaths);										/** Look for the minimum distance survivor path */
			if ( i-1 >= MEM_DIM ){															/** Check if memory has been completely filled */
				IdxFin = MEM_DIM;
			} else {
				IdxFin = i-1;
			}
			for ( WrIdx=0; WrIdx<IdxFin; WrIdx++ ){
				StateDep = CurPaths.Path[MinDistState][WrIdx];								/** Departure state */
				if ( WrIdx == IdxFin-1 ){
					StateArr = MinDistState;												/** Arrival state */
				} else {
					StateArr = CurPaths.Path[MinDistState][WrIdx+1];
				}
				ByteIdx = (SrcBitLen-IdxFin+WrIdx)>>3;
				BitIdx = (uint8_t)((SrcBitLen-IdxFin+WrIdx)&0x0007);
				if ( CodeDiagr->States[StateDep].NextState[0] == StateArr ){
					DecByt[ByteIdx] &= ~(Mask<<(7-BitIdx));									/** Set output bit to '0' */
				} else {
					DecByt[ByteIdx] |= (Mask<<(7-BitIdx));									/** Set output bit to '1' */
				}
			}
		} else if ( i-1 >= MEM_DIM ){														/** If input bit stream is not over but memory is full, extract the oldest info bit */
			MinDistState = FindMinIndexSoft(&CurPaths);
			StateDep = CurPaths.Path[MinDistState][0];
			StateArr = CurPaths.Path[MinDistState][1];
			ByteIdx = (i-MEM_DIM-1)>>3;
			BitIdx = (uint8_t)((i-MEM_DIM-1)&0x0007);
			if ( CodeDiagr->States[StateDep].NextState[0] == StateArr ){
				DecByt[ByteIdx] &= ~(Mask<<(7-BitIdx));										/** Set output bit to '0' */
			} else {
				DecByt[ByteIdx] |= (Mask<<(7-BitIdx));										/** Set output bit to '1' */
			}
			for ( j=0; j<N_TSTAT; j++){
				for ( WrIdx = 0; WrIdx<(MEM_DIM-1); WrIdx++ ){
					CurPaths.Path[j][WrIdx] = CurPaths.Path[j][WrIdx+1];					/** Keep all survivor paths */
				}
			}
		}
	}
}


/**
 * @brief Function for calculating Euclidean distance between LLR stream and specific trellis state.
 * @param CurLLRs : Input float LLR stream.
 * @param TrlByte : Output bits for specific trellis state.
 * @param MaskEras : Depuncturing erasure mask.
 * @return Estimated Euclidean distance.
 */
static float GetEuclideanDist( float *CurLLRs, uint8_t TrlByte, uint8_t MaskEras ){
	uint8_t j;
	uint8_t Mask = 0x01;
	float Dist = 0;
	for ( j=0; j<2; j++ ){
		if ( (MaskEras>>(1-j)) & Mask ){
			Dist += fabs(2*((float)((TrlByte>>(1-j))&Mask))-1-CurLLRs[j]);
		}
	}
	return Dist;
}


/**
 * @brief Function for finding soft survivor path with minimum distance.
 * @param InPaths : Input decoding paths.
 * @return Minimum distance path index.
 */
static uint8_t FindMinIndexSoft( vitdecs *InPaths ){
	uint8_t j, MinStateIdx;
	float MinDist;
	if ( InPaths != NULL ){
		MinDist = InPaths->Dist[0];
		MinStateIdx = 0;
		for ( j=1; j<N_TSTAT; j++ ){
			if ( (InPaths->Iter[j]>0) && (InPaths->Dist[j] < MinDist) ){
				MinDist = InPaths->Dist[j];
				MinStateIdx = j;
			}
		}
	}
	return MinStateIdx;
}


/**
 * @brief Function for depuncturing an input LLR stream.
 * @param InLLRs : Input LLR stream.
 * @param PunctVect : Puncturing vector.
 * @return none
 */
static void SoftDepuncturing( float *InLLRs, uint8_t *PunctVect ){
	uint32_t j;
	uint8_t RdIdxPunc = 2*Rc-1;																/** Reading index within punturing vector */
	uint32_t RdIdx = PunBitLen-1;															/** Reading index within LLR array */
	for ( j=DepBitLen; j>0; j-- ){
		if ( PunctVect[RdIdxPunc] == 1 ){
			InLLRs[j-1] = InLLRs[RdIdx];
			RdIdx--;
		} else {
			InLLRs[j-1] = 0;																/** Each erasure LLR restored has 0-value */
		}
		if ( RdIdxPunc > 0 ){
			RdIdxPunc--;
		} else {
			RdIdxPunc = 2*Rc-1;
		}
	}
}
