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

static const uint8_t PrimPolyGF4[] = {0,1};                     //!< primitive polynomial for GF(2^4) (maximum degree is implicit)
static const uint8_t PrimPolyGF8[] = {0,2,3,4};                 //!< primitive polynomial for GF(2^8) (maximum degree is implicit)



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static error_t RetrieveGeneratorPolynomial( uint8_t * ioBuf, uint8_t len );
static error_t RetrievePrimitivePolynomial( rs_encoder_info_t * ioInfo, const rs_par_t * pParams );
static error_t RetrieveMappingTableGF( uint8_t ** Table, const rs_par_t * pParams );
static uint16_t FindMaxDeg( const uint8_t * poly, uint16_t len );
static uint8_t GetBasis( const uint8_t * poly, const rs_par_t * pParams );





/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for retrieving and listing Reed-Solomon coding parameters into dedicated structure. </i>
 * 
 * @param[in] ioParams pointer to i/o parameters structure to be filled
 * 
 * @return error ID
 */
error_t RsCod_ListParameters( rs_par_t * ioParams )
{
  error_t retErr = ERR_NONE;

  if (NULL != ioParams)
  {
    ioParams->m = GF_DEGREE;
    ioParams->kSh = MESSAGE_SIZE;
    ioParams->nSh = CODEWORD_SIZE;
    ioParams->t = ioParams->nSh-ioParams->kSh;
    ioParams->dimGF = 1<<ioParams->m;
    ioParams->nUn = ioParams->dimGF-1;
    ioParams->kUn = ioParams->nUn-2*ioParams->t;
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for Reed-Solomon encoding in systematic form
 *        Redundancy bytes are appendend at the beginning of codewords
 *        and calculated as remainder of the upshifted message polynomial
 *        divided by the generator polynomial. </i>
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return error ID
 */
error_t RcCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint8_t numMsg = BY2BI_LEN(inStream->len/(pParams->m*pParams->kSh));
  const uint8_t lenGenPoly = 2*pParams->t+1;
  uint8_t genPoly[lenGenPoly];
  uint8_t mapTable[2][pParams->dimGF];                                        /** - mapping table between symbols and basis */
  int16_t quotDeg;
  uint16_t quotCoef;
  uint16_t maxDeg;
  uint16_t j;
  uint8_t inSymbs[pParams->kUn];
  uint8_t tmpPoly[pParams->nUn], divQuotCoef[pParams->nUn];
  uint8_t curSymb;
  uint8_t i;

  if ((NULL != inStream) && (NULL != outStream) && (NULL != pParams) &&
      (NULL != inStream->pBuf) && (NULL != outStream->pBuf))
  {
    RetrieveGeneratorPolynomial(genPoly,lenGenPoly);
    RetrieveMappingTableGF(mapTable,pParams);

    for (i=0; i<numMsg; i++)
    {
      memset(inSymbs,0,pParams->kUn);

      for (j=0; j<pParams->kSh; j++)
      {
        if (RS_GF_DEGREE_4 == pParams->m)
        {
          if (0 == (j%2))
          {
            curSymb = (inStream->pBuf[(j+i*pParams->kSh)/2]>>4);
          }
          else
          {
            curSymb = (inStream->pBuf[(j-1+i*pParams->kSh)/2]&0x0F);
          }
        }
        else                                                                  // i.e. "if (RS_GF_DEGREE_8 == pParams->m)"
        {       
          curSymb = inStream->pBuf[j+i*pParams->kSh];
        }
        inSymbs[j] = ConvB2S(curSymb);                                        /** - bits-to-symbol conversion */
      }

      memset(tmpPoly,0,pParams->nUn);
      memcpy(&tmpPoly[2*pParams->t],inSymbs,pParams->kUn);                    /** - upshift message polynomial by 2t positions */
      maxDeg = pParams->nUn-1;                                                /** - initialize maximum degree of temporary polynomial */
      quotDeg = maxDeg-2*pParams->t;
      
      while (quotDeg >= 0)
      {
        quotCoef = tmpPoly[maxDeg];                                           /** - quotient coefficient at current iteration */
        memset(divQuotCoef,0,pParams->nUn);
        
        for (j=0; j<lenGenPoly; j++)
        {
          divQuotCoef[j+quotDeg] = MultGF(quotCoef,genPoly[j]);
        }

        for (j=0; j<pParams->nUn; j++)
        {
          tmpPoly[j] = AddGF(tmpPoly[j],divQuotCoef[j]);
        }

        maxDeg = FindMaxDeg(tmpPoly,pParams->nUn);
        quotDeg = maxDeg-2*pParams->t;
      }

      if (RS_GF_DEGREE_4 == pParams->m)
      {
        for (j=0; j<2*pParams->t; j++)
        {
          if (0 == (j%2))
          {
            outStream->pBuf[(j+i*pParams->nSh)/2] = (ConvS2B(tmpPoly[j])<<4);
          }
          else
          {
            outStream->pBuf[(j-1+i*pParams->nSh)/2] |= ConvS2B(tmpPoly[j]);
          }
        }

        memcpy(&outStream->pBuf[pParams->t+i*pParams->nSh/2],
               &inStream->pBuf[i*pParams->kSh/2],pParams->kSh/2);
      }
      else                                                                    // i.e. "if (RS_GF_DEGREE_8 == pParams->m)"
      {
        for (j=0; j<2*pParams->t; j++)
        {
          outStream->pBuf[j+i*pParams->nSh] = ConvS2B(tmpPoly[j]);            /** - write redundancy bits into output stream after symbol-to-bits conversion */
        }
        
        memcpy(&outStream->pBuf[2*pParams->t+i*pParams->nSh],
               &inStream->pBuf[i*pParams->kSh],pParams->kSh);                 /** - copy current message bits into output stream */
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

/**
 * @brief <i> Function for retrieving primitive polynomial (maximum degree is implied). </i>
 * 
 * @param[out] ioInfo pointer to i/o structure to be filled
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return error ID
 */
static error_t RetrievePrimitivePolynomial( rs_encoder_info_t * ioInfo, const rs_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if ((NULL != ioInfo) && (NULL != pParams))
  {
    switch (pParams->m)
    {
      case RS_GF_DEGREE_4:
        ioInfo->pPrimPoly = PrimPolyGF4;
        ioInfo->lenPrimPoly = sizeof(PrimPolyGF4);
        break;

      case RS_GF_DEGREE_8:
        ioInfo->pPrimPoly = PrimPolyGF8;
        ioInfo->lenPrimPoly = sizeof(PrimPolyGF8);
        break;

      default:
        retErr = ERR_INV_RS_GF_DEGREE;
        break;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for iteratively computing code generator polynomial as
 *  GenPoly(x) = (x+a)*(x+a^2)*...*(x+a^2t). </i>
 * 
 * @param[out] ioBuf i/o buffer
 * @param[in] len buffer size [B]
 * 
 * @return error ID
 */
static error_t RetrieveGeneratorPolynomial( uint8_t * ioBuf, uint8_t len )
{
  error_t retErr = ERR_NONE;
  uint8_t tmpVal;
  int16_t i, j;

  if (NULL != ioBuf)
  {
    memset(ioBuf,0,len);

    ioBuf[0] = 2;                                                             /** - initialize generator polynomial as (x+a) */
    ioBuf[1] = 1;

    for (i=2; i<len; i++)
    {
      for (j=len-1; j>=0; j--)
      {
        tmpVal = MultGF(ioBuf[j],PowGF(2,i));
        if (j > 0)
        {
          ioBuf[j] = AddGF(tmpVal,ioBuf[j-1]);
        }
        else
        {
          ioBuf[j] = tmpVal;
        }
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for retrieving mapping table between GF symbols and bit basis by calculating
 *  the remainder of x^j divided by PrimPoly(x). </i>
 * 
 * @param[out] ioMatrix i/o mapping table to be filled
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return error ID
 */
static error_t RetrieveMappingTableGF( uint8_t ** ioMatrix, const rs_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  rs_encoder_info_t encInfo;
  int16_t quotDeg;
  uint16_t maxDeg;
  uint16_t j;
  uint8_t tmpPoly[pParams->dimGF];
  uint8_t i;
  
  if ((NULL != Table) && (NULL!= pParams))
  {
    memset(Table[0],0,pParams->dimGF);
    memset(Table[1],0,pParams->dimGF);
    RetrievePrimitivePolynomial(&encInfo,pParams);

    for (j=1; j<pParams->dimGF; j++)
    {
      memset(tmpPoly,0,pParams->dimGF);                                       /** reset all elements of temporary polynomial to 0 */
      maxDeg = j-1;                                                           /** polynomial maximum degree at current iteration */
      tmpPoly[maxDeg] = 1;
      quotDeg = maxDeg-pParams->m;

      while (quotDeg >= 0)
      {
        tmpPoly[maxDeg] = 0;

        for (i=0; i<encInfo.lenPrimPoly; i++)
        {
          tmpPoly[quotDeg+encInfo.pPrimPoly[i]] =
            ((tmpPoly[quotDeg+encInfo.pPrimPoly[i]]+1)%2);
        }
        maxDeg = FindMaxDeg(tmpPoly,pParams->dimGF);                          /** find new maximum degree of polynomial */
        quotDeg = maxDeg-pParams->m;                                          /** update quotient degree of polynomial after division */
      }

      Table[0][j] = GetBasis(tmpPoly,pParams);                                /** retrieve bit basis from remainder */
      Table[1][Table[0][j]] = j;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for finding polynomial maximum degree. </i>
 * 
 * @param[in] poly polynomial buffer
 * @param[in] len polynomial size
 * 
 * @return maximum degree index
 */
static uint16_t FindMaxDeg( const uint8_t * poly, uint16_t len )
{
  uint16_t maxDeg;
  uint16_t j;

  if (NULL != poly)
  {
    for (j=len-1; j>=0; j--)
    {
      if (poly[j] > 0)
      {
        maxDeg = j;
        break;
      }
    }
  }

  return maxDeg;
}


/**
 * @brief <i> Function for retrieving  bit basis from remainder polynomial during mapping. </i>
 * 
 * @param[in] poly polynomial buffer
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return maximum degree index
 */
static uint8_t GetBasis( const uint8_t * poly, const rs_par_t * pParams )
{
  uint8_t basis = 0;
  uint8_t j;

  if (NULL != poly)
  {
    for (j=0; j<pParams->m; j++)
    {
      basis |= (poly[j]<<(pParams->m-j-1));
    }
  }

  return basis;
}

































#if 0
/*** PARAMETERS ***/

/*** CONSTANTS AND GLOBAL VARIABLES ***/
//const uint16_t UncLen = (m*k*Nmsg)/8;                    // Uncoded stream length (in bytes)
//const uint16_t EncLen = (m*n*Nmsg)/8;                    // Encode stream length (in bytes)
////const uint8_t LenPP = 4;                          // Length of the primitive polynomial array
////const uint8_t LenGP = 2*t+1;                        // Length of the generator polynomial array

uint8_t Table[2][DimGF] = {0};                        // Mapping table between symbols and basis









/*** MAIN FUNCTION ***/

int main(){

  primpoly PrimPoly;
  uint8_t GenPoly[LenGP] = {0};
  uint8_t SrcBytes[UncLen], EncBytes[EncLen];
  uint8_t ErrBytes[EncLen], DecBytes[UncLen];
  uint16_t ChanErr[Nmsg][2];
  uint8_t MsgDecErr[Nmsg];
  uint16_t TotDecErr;
  uint8_t j;

  CheckParam();                                // Check the parameters correctness
//  srand(time(NULL));                              // Link random seed to actual time
//  RandGen(SrcBytes);                              // Random generation of source bytes
  PrimPoly = GetPrimPoly();                          // Retrieve the primitive polynomial for GF(2^m)
  MapGF(Table,PrimPoly);                            // Fill the mapping table
//  GetGenPoly(GenPoly);                            // Retrieve the code generator polynomial
  EncoderRS(SrcBytes,EncBytes,GenPoly);                    // Reed-Solomon encoding
  ChanBSC(ErrBytes,EncBytes,Peb,ChanErr);                    // BSC simulation
  DecoderRS(ErrBytes,DecBytes);                        // Reed-Solomon decoding
  TotDecErr = CheckFinalErr(MsgDecErr,SrcBytes,DecBytes);            // Check the final number of corrupted info bits
}



/*** ENCODING-DECODING FUNCTIONS ***/

/**
 *  Function for checking the parameters correcteness.
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
 *  Function for performing addition in GF(2^m).
 **/
uint8_t AddGF( uint8_t SymbA, uint8_t SymbB ){
  uint16_t j;
  uint8_t BasisRes, SymbRes;
  BasisRes = Table[0][SymbA]^Table[0][SymbB];
  return Table[1][BasisRes];
}


/**
 *  Function for performing multiplication in GF(2^m).
 **/
uint8_t MultGF( uint8_t SymbA, uint8_t SymbB ){
  uint8_t SymbRes = 0;
  if ( (SymbA != 0) && (SymbB != 0) ){
    SymbRes = ((SymbA+SymbB-2)%(DimGF-1))+1;
  }
  return SymbRes;
}


/**
 *  Function for performing power operation in GF(2^m).
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
 *  Function for getting the GF symbol corresponding to the input bit basis.
 **/
uint8_t ConvB2S( uint8_t InBasis ){
  return Table[1][InBasis];
}


/**
 *  Function for getting the bit basis corresponding to the input GF symbol.
 **/
uint8_t ConvS2B( uint8_t InSymb ){
  return Table[0][InSymb];
}


/**
 *  Function for performing Reed-Solomon decoding in systematic form at byte level. Redundancy
 *  bytes are expected at the beginning of codewords.
 *  NB: The decoder can handle multiple input codewords at a time.
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
        IoSymbs[j] = ConvB2S(CurSymb);                  // Bits-to-symbol conversion
      }
      ErrFlag = GetSyndrome(IoSymbs,Syndr);                // Estimate the syndrome polynomial
      if ( ErrFlag == true ){                        // Check if symbol errors have been detected
        BerlekMasseyAlg(Sigma,Syndr);                  // Estimate the polynomial Sigma(x)
        ChienAlg(ErrLoc,Sigma);                      // Estimate the error locator polynomial
        KeyAlg(Omega,Syndr,Sigma);                    // Estimate the polynomial Omega(x)
        ForneyAlg(ErrMag,Omega,ErrLoc);                  // Estimate the error magnitude polynomial
        CorrectErr(IoSymbs,ErrLoc,ErrMag);                // Correct the corrupted symbol stream
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
          OutBytes[j+i*k] = ConvS2B(IoSymbs[j+2*t]);          // Symbol-to-bits conversion
        }
      }
    }
  }
}


/**
 *  Function for estimating the syndrome symbols vector of the input codeword
 *  (the 0-degree coefficient is omitted, since always 0).
 **/ 
bool GetSyndrome( uint8_t *CwSymbs, uint8_t *Syndr ){
  uint16_t i;
  int16_t j;
  uint8_t SumValue;
  bool ErrFlag = false;
  if ( (CwSymbs != NULL) && (Syndr != NULL) ){
    for ( i=0; i<2*t; i++ ){                                       // Compute syndrome polynomial Syndr(x) as Cw(x) for x = a, a^2, ..., a^2t
      SumValue = CwSymbs[0];
      for ( j=1; j<nUnsh; j++ ){
        SumValue = AddGF(SumValue,MultGF(CwSymbs[j],PowGF(i+2,j)));
      }
      Syndr[i] = SumValue;
      if ( SumValue != 0 ){
        ErrFlag = true;                          // Assert error flag if one coefficient is not equal to 0
      }
    }
  }
  return ErrFlag;
}

    
/**
 *  Function for executing the Berlekamp-Massey algorithm to iteratively estimate the
 *  error locator polynomial Sigma(x).
 **/ 
void BerlekMasseyAlg( uint8_t *SigmaC, uint8_t *Syndr ){
  uint8_t i, j;
  int16_t Delta, En;
  int16_t Ec = 0;                                // Current number of assumed errors
  int16_t h = -1;                                // Error iteration counter
  uint8_t SigmaN[t+1];                            // Sigma(x) polynomial at next iteration
  uint8_t Tau[t+1] = {0};                            // Tau(x) polynomial
  if ( (SigmaC != NULL) && (Syndr != NULL) ){
    Tau[1] = 1;
    memset(SigmaC,0,t+1);
    SigmaC[0] = 1;
    for ( i=0; i<2*t; i++ ){
      if ( Ec <= t ){
        Delta = GetDiscrepancy(Syndr,SigmaC,Ec,i);            // Compute discrepancy
        if ( Delta != 0 ){
          for ( j=0; j<t+1; j++ ){
            SigmaN[j] = AddGF(SigmaC[j],MultGF(Delta,Tau[j]));      // Compute next value of polynomial Sigma(x)
          }
          if ( Ec < (i-h) ){
            En = i-h;                        // Compute next value of E
            h = i-Ec;
            for ( j=0; j<t+1; j++ ){
              Tau[j] = MultGF(PowGF(2,-Delta+1),SigmaC[j]);    // Update polynomial Tau(x)
            }
            Ec = En;
          }
          memcpy(SigmaC,SigmaN,t+1);                  // Update polynomial Sigma(x) to latest value
        }
        memcpy(&Tau[1],Tau,t);
        Tau[0] = 0;
      }
    }
  }
}


/**
 *  Function for calculating the discrepancy within the Berlekamp-Massey algorithm. 
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
 *  Function for executing the Chien search algorithm to estimate the error positions
 *  of the corrupted symbols by finding the roots of Sigma(x). 
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
 *  Function for estimating the error evaluator polynomial Omega(x) by using the Key equation
 *  Omega(x) = mod((1+Syndr(x))*Sigma(x),x^(2t+1)).
 **/
void KeyAlg( uint8_t *Omega, uint8_t *Syndr, uint8_t *Sigma ){
  uint8_t i, j;
  uint8_t TmpOmega[3*t+1] = {0};
  uint8_t TmpSyndr[2*t+1];
  if ( (Omega != NULL) && (Syndr != NULL) && (Sigma != NULL) ){
    TmpSyndr[0] = 1;
    memcpy(&TmpSyndr[1],Syndr,2*t);                      // TmpSyndr(x) = 1+Syndr(x)
    for ( i=0; i<t+1; i++ ){
      for ( j=0; j<2*t+1; j++ ){
        TmpOmega[i+j] = AddGF(TmpOmega[i+j],MultGF(Sigma[i],TmpSyndr[j]));
      }
    }
    memcpy(Omega,TmpOmega,2*t+1);
  }
}


/**
 *  Function for executing the Forney algorithm to estimate the error magnitudes
 *  of the corrupted symbols.
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
 *  Function for correcting the corrupted symbols with the estimated error
 *  locations and magnitudes.
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
#endif