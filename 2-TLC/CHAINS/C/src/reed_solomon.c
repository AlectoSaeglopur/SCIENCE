/**
 * @file reed_solomon.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Reed-Solomon coding library
 * 
 * Library containing Reed-Solomon coding functions.
 */

/****************/
/*** INCLUDES ***/
/****************/

#include "reed_solomon.h"



/*****************/
/*** CONSTANTS ***/
/*****************/

static const uint8_t PrimPolyGF4[] = {0,1,0,0};									//!< primitive polynomial for GF(2^4) (maximum degree is implicit)
static const uint8_t PrimPolyGF8[] = {0,2,3,4};									//!< primitive polynomial for GF(2^8) (maximum degree is implicit)







/*** PARAMETERS ***/

//const uint8_t m = 8;														// Extended Galois field degree (i.e. the number of bits per symbol)
//const uint8_t n = 204;														// Codeword length (in symbols)
//const uint8_t k = 188;														// Message length (in symbols)
//const uint8_t Nmsg = 1;														// Number of messages to be encode/decoded



/*** CONSTANTS AND GLOBAL VARIABLES ***/
//const uint8_t t = (n-k)/2;													// Maximum number of recoverable corrupted symbols
const uint16_t nUnsh = (1<<m)-1;											// Unshortened value of n
const uint16_t kUnsh = nUnsh-2*t;											// Unshortened value of k
const uint16_t DimGF = (1<<m);												// Overall number of symbols in GF(2^m)
const uint16_t UncLen = (m*k*Nmsg)/8;										// Uncoded stream length (in bytes)
const uint16_t EncLen = (m*n*Nmsg)/8;										// Encode stream length (in bytes)
const uint8_t LenPP = 4;													// Length of the primitive polynomial array
const uint8_t LenGP = 2*t+1;												// Length of the generator polynomial array

uint8_t Table[2][DimGF] = {0};												// Mapping table between symbols and basis



/*** TYPEDEFS ***/

typedef struct TD1 {
	uint8_t Len;
	uint8_t Deg[LenPP];
} primpoly;



/*** FUNCTION PROTOTYPES ***/

void CheckParam( void );
primpoly GetPrimPoly( void );
void MapGF( uint8_t Table[2][DimGF], primpoly PrimPoly );
uint16_t FindMaxDeg( uint8_t *Poly, uint16_t Len );
uint8_t GetBasis( uint8_t *Poly );
void GetGenPoly( uint8_t *Poly );
uint8_t AddGF( uint8_t SymbA, uint8_t SymbB );
uint8_t MultGF( uint8_t SymbA, uint8_t SymbB );
uint8_t PowGF( uint8_t SymbBase, int16_t Exp );
uint8_t ConvB2S( uint8_t InBasis );
void EncoderRS( uint8_t *InBytes, uint8_t *OutBytes, uint8_t *GenPoly );
uint8_t ConvS2B( uint8_t InSymb );
void DecoderRS( uint8_t *InBytes, uint8_t *OutBytes );
bool GetSyndrome( uint8_t *CwSymbs, uint8_t *Syndr );
void BerlekMasseyAlg( uint8_t *SigmaC, uint8_t *Syndr );
int16_t GetDiscrepancy( uint8_t *Syndr, uint8_t *Sigma, int16_t Nerr, uint8_t Iter );
void ChienAlg( uint8_t *ErrLoc, uint8_t *Sigma );
void KeyAlg( uint8_t *Omega, uint8_t *Syndr, uint8_t *Sigma );
void ForneyAlg( uint8_t *ErrMag, uint8_t *Omega, uint8_t *ErrLoc );
void CorrectErr( uint8_t *IoSymbs, uint8_t *ErrLoc, uint8_t *ErrMag );



/*** MAIN FUNCTION ***/

int main(){

	clock_t Time1 = clock();

	primpoly PrimPoly;
	uint8_t GenPoly[LenGP] = {0};
	uint8_t SrcBytes[UncLen], EncBytes[EncLen];
	uint8_t ErrBytes[EncLen], DecBytes[UncLen];
	uint16_t ChanErr[Nmsg][2];
	uint8_t MsgDecErr[Nmsg];
	uint16_t TotDecErr;
	uint8_t j;

	CheckParam();																// Check the parameters correctness
	srand(time(NULL));															// Link random seed to actual time
	RandGen(SrcBytes);															// Random generation of source bytes
	PrimPoly = GetPrimPoly();													// Retrieve the primitive polynomial for GF(2^m)
	MapGF(Table,PrimPoly);														// Fill the mapping table
	GetGenPoly(GenPoly);														// Retrieve the code generator polynomial
	clock_t Time2 = clock();
	EncoderRS(SrcBytes,EncBytes,GenPoly);										// Reed-Solomon encoding
	clock_t Time3 = clock();
	ChanBSC(ErrBytes,EncBytes,Peb,ChanErr);										// BSC simulation
	clock_t Time4 = clock();
	DecoderRS(ErrBytes,DecBytes);												// Reed-Solomon decoding
	clock_t Time5 = clock();
	TotDecErr = CheckFinalErr(MsgDecErr,SrcBytes,DecBytes);						// Check the final number of corrupted info bits
	
	printf("\n >> REED-SOLOMON <<\n");
	printf("\n * GF = 2^%d\n",m);
	printf(" * (n,k,t) = (%d,%d,%d)\n",n,k,t);
	printf(" * Nmsg = %d\n",Nmsg);
	printf(" * Peb = %1.3f\n",Peb);
	printf("\n SRC (%d bytes) :\t",UncLen);
	PrintArray(SrcBytes,UncLen);
	printf("\n ENC (%d bytes) :\t",EncLen);
	PrintArray(EncBytes,EncLen);
	printf("\n ERR (%d bytes) :\t",EncLen);
	PrintArray(ErrBytes,EncLen);
	printf("\n DEC (%d bytes) :\t",UncLen);
	PrintArray(DecBytes,UncLen);
	printf("\n * CHANNEL ERRORS (max recovery = %d Symb)\n",t);
	for ( j=0; j<Nmsg; j++ ){
		printf("   - Msg #%2d >> Errors before decoding :\n\t\t  %d out of %d bits",j+1,ChanErr[j][0],m*n);
		printf(" (%d out of %d symbols)\n",ChanErr[j][1],n);
		printf("\t     >> Errors after decoding :\n\t\t  %d out of %d bits\n\n",MsgDecErr[j],m*k);
	}
	printf(" - Final number of errors = %d out of %d bits\n",TotDecErr,m*k*Nmsg);

	clock_t Time6 = clock();
	printf("\n >> Elapsed time : INI = %1.3f s\n",((double)(Time2-Time1))/CLOCKS_PER_SEC);
	printf(" >> Elapsed time : ENC = %1.3f s\n",((double)(Time3-Time2))/CLOCKS_PER_SEC);
	printf(" >> Elapsed time : CHA = %1.3f s\n",((double)(Time4-Time3))/CLOCKS_PER_SEC);
	printf(" >> Elapsed time : DEC = %1.3f s\n",((double)(Time5-Time4))/CLOCKS_PER_SEC);
	printf(" >> Elapsed time : RES = %1.3f s\n",((double)(Time6-Time5))/CLOCKS_PER_SEC);
	printf(" >> Elapsed time : TOT = %1.3f s\n",((double)(Time6-Time1))/CLOCKS_PER_SEC);
}



/*** ENCODING-DECODING FUNCTIONS ***/

/**
 *	Function for checking the parameters correcteness.
 **/
void CheckParam( void ){
	if ( (m != 4) && (m!=8) ){
		printf("\n ERROR : Invalid extended Galois field degree (m)\n");
		exit(1);
	} else if ( (k <= 0) || (((n-k)%2) != 0) || (n > (DimGF-1)) ) {
		printf("\n ERROR : Invalid message/codeword length (n,k)\n");
		exit(1);
	} else if ( (m == 4) && ((n%2) != 0) ){
		printf("\n ERROR : when m equals 4, n must be even\n");
		exit(1);
	}
}

/**
 *	Function for retrieving primitive polynomial (maximum degree is implied) as a
 *  function of the chosen m.
 **/
primpoly GetPrimPoly( void ){
	primpoly PrimPoly;
	switch ( m ){
		case 4:
			PrimPoly.Len = 2;
			memcpy(PrimPoly.Deg,PrimPolyGF4,LenPP);
			break;
		case 8:
			PrimPoly.Len = 4;
			memcpy(PrimPoly.Deg,PrimPolyGF8,LenPP);
			break;
	}
	return PrimPoly;
}


/**
 *	Function for creating the mapping table between GF symbols and bit basis by calculating
 *	the remainder of x^j divided by PrimPoly(x).
 **/
void MapGF( uint8_t Table[2][DimGF], primpoly PrimPoly ){
	uint16_t j, MaxDeg;
	int16_t QuotDeg;
	uint8_t i;
	uint8_t TmpPoly[DimGF];
	if ( Table != NULL ){
		for ( j=1; j<DimGF; j++ ){
			memset(TmpPoly,0,DimGF);											// Reset all elements of temporary polynomial to 0
			MaxDeg = j-1;														// Polynomial maximum degree at current iteration
			TmpPoly[MaxDeg] = 1;
			QuotDeg = MaxDeg-m;
			while ( QuotDeg >= 0 ){
				TmpPoly[MaxDeg] = 0;
				for ( i=0; i<PrimPoly.Len; i++ ){
					TmpPoly[QuotDeg+PrimPoly.Deg[i]] = ((TmpPoly[QuotDeg+PrimPoly.Deg[i]]+1)%2);
				}
				MaxDeg = FindMaxDeg(TmpPoly,DimGF);								// Find the new maximum degree of polynomial
				QuotDeg = MaxDeg-m;												// Update the quotient degree of polynomial after division
			}
			Table[0][j] = GetBasis(TmpPoly);									// Retrieve bit basis from remainder
			Table[1][Table[0][j]] = j;											// Retrieve bit basis from remainder
		}
	}
}


/**
 *	Function for finding the polynomial maximum degree during mapping.
 **/
uint16_t FindMaxDeg( uint8_t *Poly, uint16_t Len ){
	uint16_t j, MaxDeg;
	if ( Poly != NULL ){
		for ( j=Len-1; j>=0; j-- ){
			if ( Poly[j] > 0 ){
				MaxDeg = j;
				break;
			}
		}
	} 
	return MaxDeg;
}


/**
 *	Function for retrieving the bit basis from remainder polynomial during mapping.
 **/
uint8_t GetBasis( uint8_t *Poly ){
	uint8_t j;
	uint8_t Basis = 0;
	if ( Poly != NULL ){
		for ( j=0; j<m; j++ ){
			Basis |= (Poly[j]<<(m-j-1));
		}
	}
	return Basis;
}


/**
 *	Function for iteratively computing the code generator polynomial as
 *	GenPoly(x) = (x+a)*(x+a^2)*...*(x+a^2t).
 **/
void GetGenPoly( uint8_t *Poly ){
	uint8_t Tmp;
	int16_t i,j;
	Poly[0] = 2;																// Initialize generator polynomial as (x+a)
	Poly[1] = 1;
	if ( Poly != NULL ){
		for ( i=2; i<LenGP; i++ ){
			for ( j=LenGP-1; j>=0; j-- ){
				Tmp = MultGF(Poly[j],PowGF(2,i));
				if ( j > 0 ){
					Poly[j] = AddGF(Tmp,Poly[j-1]);
				} else {
					Poly[j] = Tmp;
				}
			}
		}
	}
}


/**
 *	Function for performing addition in GF(2^m).
 **/
uint8_t AddGF( uint8_t SymbA, uint8_t SymbB ){
	uint16_t j;
	uint8_t BasisRes, SymbRes;
	BasisRes = Table[0][SymbA]^Table[0][SymbB];
	return Table[1][BasisRes];
}


/**
 *	Function for performing multiplication in GF(2^m).
 **/
uint8_t MultGF( uint8_t SymbA, uint8_t SymbB ){
	uint8_t SymbRes = 0;
	if ( (SymbA != 0) && (SymbB != 0) ){
		SymbRes = ((SymbA+SymbB-2)%(DimGF-1))+1;
	}
	return SymbRes;
}


/**
 *	Function for performing power operation in GF(2^m).
 *  NB#1: to get "alpha^(w)" use "PowGF(2,w)".
 *  NB#2: to get "alpha^(-w)" use "PowGF(2,-w)".
 *  NB#3: to get "Symb^-1" use "PowGF(2,-Symb+1)" and keep in mind the identity "MultGF(Symb,PowGF(2,-Symb+1))=1".
 **/
uint8_t PowGF( uint8_t SymbBase, int16_t Exp ){
	uint8_t SymbRes;
	int16_t Tmp;
	if ( (SymbBase == 0) || (SymbBase == 1) ){
		SymbRes = SymbBase;
	} else {
		Tmp = ((int16_t) (((SymbBase-1)*Exp)%(DimGF-1)));
		if ( Exp < 0 ){
			SymbRes = ((uint8_t) (Tmp+DimGF));
		} else {
			SymbRes = ((uint8_t) (Tmp+1));
		}
	}
	return SymbRes;
}


/**
 *	Function for performing Reed-Solomon encoding in systematic form at byte level. Redundancy
 *	bytes are appendend at the beginning of codewords and calculated as the remainder of the
 *	upshifted message polynomial divided by the generator polynomial.
 *	NB: The encoder can handle multiple input messages at a time.
**/
void EncoderRS( uint8_t *InBytes, uint8_t *OutBytes, uint8_t *GenPoly ){
	uint8_t InSymbs[kUnsh], TmpPoly[nUnsh], DivQuotCoef[nUnsh];
	uint8_t i, CurSymb;
	uint16_t j, MaxDeg, QuotCoef;
	int16_t QuotDeg;
	if ( (InBytes != NULL) && (OutBytes != NULL) && (GenPoly != NULL) ){
		for ( i=0; i<Nmsg; i++ ){
			memset(InSymbs,0,kUnsh);
			for ( j=0; j<k; j++ ){	
				if ( m == 4 ){
					if ( (j%2) == 0 ){
						CurSymb = (InBytes[(j+i*k)/2]>>4);
					} else {
						CurSymb = (InBytes[(j-1+i*k)/2]&0x0F);
					}
				} else if ( m == 8 ){	
					CurSymb = InBytes[j+i*k];
				}
				InSymbs[j] = ConvB2S(CurSymb);									// Bits-to-symbol conversion
			}
			memset(TmpPoly,0,nUnsh);
			memcpy(&TmpPoly[2*t],InSymbs,kUnsh);								// Upshift the message polynomial by 2t positions
			MaxDeg = nUnsh-1;													// Initialize the temporary polynomial maximum degree
			QuotDeg = MaxDeg-2*t;
			while ( QuotDeg >= 0 ){
				QuotCoef = TmpPoly[MaxDeg];										// Quotient coefficient at current iteration
				memset(DivQuotCoef,0,nUnsh);
				for ( j=0; j<LenGP; j++ ){
					DivQuotCoef[j+QuotDeg] = MultGF(QuotCoef,GenPoly[j]);
				}
				for ( j=0; j<nUnsh; j++ ){
					TmpPoly[j] = AddGF(TmpPoly[j],DivQuotCoef[j]);
				}
				MaxDeg = FindMaxDeg(TmpPoly,nUnsh);
                QuotDeg = MaxDeg-2*t;
			}
			if ( m == 4 ){
				for ( j=0; j<2*t; j++ ){
					if ( (j%2) == 0 ){
						OutBytes[(j+i*n)/2] = (ConvS2B(TmpPoly[j])<<4);
					} else {
						OutBytes[(j-1+i*n)/2] |= ConvS2B(TmpPoly[j]);
					}
				}
				memcpy(&OutBytes[t+i*n/2],&InBytes[i*k/2],k/2);
			} else if ( m == 8 ){
				for ( j=0; j<2*t; j++ ){
					OutBytes[j+i*n] = ConvS2B(TmpPoly[j]);						// Write redundancy bits into output stream after symbol-to-bits conversion
				}
				memcpy(&OutBytes[2*t+i*n],&InBytes[i*k],k);						// Copy current message bits into output stream
			}
		}
	}
}


/**
 *	Function for getting the GF symbol corresponding to the input bit basis.
 **/
uint8_t ConvB2S( uint8_t InBasis ){
	return Table[1][InBasis];
}


/**
 *	Function for getting the bit basis corresponding to the input GF symbol.
 **/
uint8_t ConvS2B( uint8_t InSymb ){
	return Table[0][InSymb];
}


/**
 *	Function for performing Reed-Solomon decoding in systematic form at byte level. Redundancy
 *  bytes are expected at the beginning of codewords.
 *	NB: The decoder can handle multiple input codewords at a time.
 **/
void DecoderRS( uint8_t *InBytes, uint8_t *OutBytes ){
	uint8_t IoSymbs[nUnsh] = {0};
	uint8_t Syndr[2*t], Sigma[t+1], Omega[2*t+1];
	uint8_t ErrLoc[t], ErrMag[t];
	uint8_t i, j, CurSymb;
	bool ErrFlag;
	if ( (InBytes != NULL) && (OutBytes != NULL) ){
		for ( i=0; i<Nmsg; i++ ){
			for ( j=0; j<n; j++ ){
				if ( m == 4 ){
					if ( (j%2) == 0 ){
						CurSymb = (InBytes[(j+i*n)/2]>>4);
					} else {
						CurSymb = (InBytes[(j-1+i*n)/2]&0x0F);
					}
				} else if ( m == 8 ){
					CurSymb = InBytes[j+i*n];
				}
				IoSymbs[j] = ConvB2S(CurSymb);									// Bits-to-symbol conversion
			}
			ErrFlag = GetSyndrome(IoSymbs,Syndr);								// Estimate the syndrome polynomial
			if ( ErrFlag == true ){												// Check if symbol errors have been detected
				BerlekMasseyAlg(Sigma,Syndr);									// Estimate the polynomial Sigma(x)
				ChienAlg(ErrLoc,Sigma);											// Estimate the error locator polynomial
				KeyAlg(Omega,Syndr,Sigma);										// Estimate the polynomial Omega(x)
				ForneyAlg(ErrMag,Omega,ErrLoc);									// Estimate the error magnitude polynomial
				CorrectErr(IoSymbs,ErrLoc,ErrMag);								// Correct the corrupted symbol stream
            }
			if ( m == 4 ){
				for ( j=0; j<k; j++ ){
					if ( (j%2) == 0 ){
						OutBytes[(j+i*k)/2] = (ConvS2B(IoSymbs[j+2*t])<<4);
					} else {
						OutBytes[(j-1+i*k)/2] |= ConvS2B(IoSymbs[j+2*t]);
					}
				}
			} else if ( m == 8 ){
				for ( j=0; j<k; j++ ){
					OutBytes[j+i*k] = ConvS2B(IoSymbs[j+2*t]);					// Symbol-to-bits conversion
				}
			}
		}
	}
}


/**
 *	Function for estimating the syndrome symbols vector of the input codeword
 *	(the 0-degree coefficient is omitted, since always 0).
 **/ 
bool GetSyndrome( uint8_t *CwSymbs, uint8_t *Syndr ){
	uint16_t i;
	int16_t j;
	uint8_t SumValue;
	bool ErrFlag = false;
	if ( (CwSymbs != NULL) && (Syndr != NULL) ){
		for ( i=0; i<2*t; i++ ){                           						// Compute syndrome polynomial Syndr(x) as Cw(x) for x = a, a^2, ..., a^2t
			SumValue = CwSymbs[0];
			for ( j=1; j<nUnsh; j++ ){
				SumValue = AddGF(SumValue,MultGF(CwSymbs[j],PowGF(i+2,j)));
			}
			Syndr[i] = SumValue;
			if ( SumValue != 0 ){
				ErrFlag = true;													// Assert error flag if one coefficient is not equal to 0
			}
		}
	}
	return ErrFlag;
}

    
/**
 *	Function for executing the Berlekamp-Massey algorithm to iteratively estimate the
 *	error locator polynomial Sigma(x).
 **/ 
void BerlekMasseyAlg( uint8_t *SigmaC, uint8_t *Syndr ){
	uint8_t i, j;
	int16_t Delta, En;
	int16_t Ec = 0;																// Current number of assumed errors
	int16_t h = -1;																// Error iteration counter
	uint8_t SigmaN[t+1];														// Sigma(x) polynomial at next iteration
	uint8_t Tau[t+1] = {0};														// Tau(x) polynomial
	if ( (SigmaC != NULL) && (Syndr != NULL) ){
		Tau[1] = 1;
		memset(SigmaC,0,t+1);
		SigmaC[0] = 1;
		for ( i=0; i<2*t; i++ ){
			if ( Ec <= t ){
				Delta = GetDiscrepancy(Syndr,SigmaC,Ec,i);						// Compute discrepancy
				if ( Delta != 0 ){
					for ( j=0; j<t+1; j++ ){
						SigmaN[j] = AddGF(SigmaC[j],MultGF(Delta,Tau[j]));      // Compute next value of polynomial Sigma(x)
					}
					if ( Ec < (i-h) ){
						En = i-h;												// Compute next value of E
						h = i-Ec;
						for ( j=0; j<t+1; j++ ){
							Tau[j] = MultGF(PowGF(2,-Delta+1),SigmaC[j]);		// Update polynomial Tau(x)
						}
						Ec = En;
					}
					memcpy(SigmaC,SigmaN,t+1);									// Update polynomial Sigma(x) to latest value
				}
				memcpy(&Tau[1],Tau,t);
				Tau[0] = 0;
			}
		}
	}
}


/**
 *	Function for calculating the discrepancy within the Berlekamp-Massey algorithm. 
 **/
int16_t GetDiscrepancy( uint8_t *Syndr, uint8_t *Sigma, int16_t Nerr, uint8_t Iter ){
	uint8_t j;
    int16_t Delta = 0;
	if ( (Syndr != NULL) && (Sigma != NULL)){
		for ( j=0; j<Nerr+1; j++ ){
			Delta = AddGF(Delta,MultGF(Sigma[j],Syndr[Iter-j]));
		}
	}
	return Delta;
}


/**
 *	Function for executing the Chien search algorithm to estimate the error positions
 *	of the corrupted symbols by finding the roots of Sigma(x). 
 **/
void ChienAlg( uint8_t *ErrLoc, uint8_t *Sigma ){
	uint8_t i, j, Root;
	uint8_t Idx = 0;
	if ( (ErrLoc != NULL) && (Sigma != NULL) ){
		memset(ErrLoc,0,t);
		for ( i=0; i<nUnsh; i++ ){
			Root = Sigma[0];
			for ( j=1; j<t+1; j++ ){
                Root = AddGF(Root,MultGF(Sigma[j],PowGF(i+1,j)));
			}
			if ( (Root == 0) && (Idx < t) ){
				ErrLoc[Idx] = PowGF(i+1,-1);
				Idx++;
                
			}
		}
	}
}


/**
 *	Function for estimating the error evaluator polynomial Omega(x) by using the Key equation
 *	Omega(x) = mod((1+Syndr(x))*Sigma(x),x^(2t+1)).
 **/
void KeyAlg( uint8_t *Omega, uint8_t *Syndr, uint8_t *Sigma ){
	uint8_t i, j;
	uint8_t TmpOmega[3*t+1] = {0};
	uint8_t TmpSyndr[2*t+1];
	if ( (Omega != NULL) && (Syndr != NULL) && (Sigma != NULL) ){
		TmpSyndr[0] = 1;
		memcpy(&TmpSyndr[1],Syndr,2*t);											// TmpSyndr(x) = 1+Syndr(x)
		for ( i=0; i<t+1; i++ ){
			for ( j=0; j<2*t+1; j++ ){
				TmpOmega[i+j] = AddGF(TmpOmega[i+j],MultGF(Sigma[i],TmpSyndr[j]));
			}
		}
		memcpy(Omega,TmpOmega,2*t+1);
	}
}


/**
 *	Function for executing the Forney algorithm to estimate the error magnitudes
 *	of the corrupted symbols.
 **/
void ForneyAlg( uint8_t *ErrMag, uint8_t *Omega, uint8_t *ErrLoc ){
	uint8_t i, j, Root, Num, Den;
	if ( (ErrMag != NULL) && (Omega != NULL) && (ErrLoc != NULL) ){
		memset(ErrMag,0,t);
		for ( i=0; i<t; i++ ){
			if ( ErrLoc[i] != 0 ){
				Root = PowGF(ErrLoc[i],-1);
				Num = Omega[0];
				for ( j=1; j<2*t+1; j++ ){
					Num = AddGF(Num,MultGF(Omega[j],PowGF(Root,j)));
				}
				Den = 1;
				for ( j=0; j<t; j++ ){
					if ( i != j ){
						Den = MultGF(Den,AddGF(1,MultGF(Root,ErrLoc[j])));
					}
				}
				ErrMag[i] = MultGF(Num,PowGF(2,-Den+1));
			}
		}
	}
}


/**
 *	Function for correcting the corrupted symbols with the estimated error
 *	locations and magnitudes.
 **/
void CorrectErr( uint8_t *IoSymbs, uint8_t *ErrLoc, uint8_t *ErrMag ){
	uint8_t j;
	if ( (IoSymbs != NULL) && (ErrLoc != NULL) && (ErrMag != NULL) ){
		for ( j=0; j<t; j++ ){
			if ( ErrLoc[j] != 0 ){
				IoSymbs[ErrLoc[j]-1] = AddGF(IoSymbs[ErrLoc[j]-1],ErrMag[j]);
			}
		}
	}
}
