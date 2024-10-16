/**
 * @file reed_solomon.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @see Digital communications - Fundamentals and applications (Bernard Sklar, 2014)
 * @ingroup TLC_CHAIN
 * @brief Reed-Solomon coding library
 * 
 * Library containing Reed-Solomon coding functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "debug.h"
#include "reed_solomon.h"



/*****************/
/*** CONSTANTS ***/
/*****************/

static const uint8_t PrimPolyGF4[] = {0,1};                       //!< primitive polynomial for GF(2^4) (maximum degree is implicit)
static const uint8_t PrimPolyGF8[] = {0,2,3,4};                   //!< primitive polynomial for GF(2^8) (maximum degree is implicit)



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  RS_TABLE_IDX_BIT = 0,                                           /** - mapping table bit basis index */
  RS_TABLE_IDX_SYM,                                               /** - mapping table symbol index */
  RS_TABLE_IDX_NUM
} rs_table_idx_t;

typedef struct _rs_encoder_info_t
{
  const uint8_t * pPrimPoly;                                      /** - pointer to primitive polynomial */
  uint8_t lenPrimPoly;                                            /** - primitive polynomial size */
} rs_encoder_info_t;



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static error_t RetrievePrimitivePolynomial( rs_encoder_info_t * ioInfo, const rs_par_t * pParams );
static error_t RetrieveGeneratorPolynomial( uint8_t * ioBuf, uint8_t len, const uint8_t mapTable[][RS_TABLE_IDX_NUM], const rs_par_t * pParams );
static error_t RetrieveMappingTableGF( uint8_t ioTable[][RS_TABLE_IDX_NUM], const rs_par_t * pParams );
static uint16_t FindMaxDeg( const uint8_t * poly, uint16_t len );
static uint8_t GetBasis( const uint8_t * poly, const rs_par_t * pParams );
static uint8_t ConvertBi2Sy( uint8_t inBasis, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static uint8_t ConvertSy2Bi( uint8_t inSymb, const uint8_t [][RS_TABLE_IDX_NUM] );
static uint8_t AddGF( uint8_t symbA, uint8_t symbB, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static uint8_t MultiplyGF( uint8_t symbA, uint8_t symbB, const rs_par_t * pParams );
static uint8_t PowerGF( uint8_t symbBase, int16_t exp, const rs_par_t * pParams );
static bool GetSyndrome( const uint8_t * cwSymbs, uint8_t * syndrome, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t BerlekampMasseyAlgorithm( uint8_t * curSigma, const uint8_t * syndrome, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static int16_t GetDiscrepancy( const uint8_t * syndrome, const uint8_t * sigma, int16_t errNum, uint8_t iter, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t ChienAlgorithm( uint8_t * errLoc, const uint8_t * sigma, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t KeyAlgorithm( uint8_t * omega, const uint8_t * syndrome, const uint8_t * sigma, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t ForneyAlgorithm( uint8_t * errMag, const uint8_t * omega, const uint8_t * errLoc, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t ErrorCorrector( uint8_t * ioSymbs, const uint8_t * errLoc, const uint8_t * errMag, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM]);


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
  Debug_SetWatermark((void *)RsCod_ListParameters,WM_LEVEL_1);

  error_t retErr = ERR_NONE;

  if (NULL != ioParams)
  {
    ioParams->m = GF_DEGREE;
    ioParams->kSh = MESSAGE_SIZE;
    ioParams->nSh = CODEWORD_SIZE;
    ioParams->t = (ioParams->nSh-ioParams->kSh)/2;
    ioParams->dimGF = 1<<ioParams->m;
    ioParams->nUn = ioParams->dimGF-1;
    ioParams->kUn = ioParams->nUn-2*ioParams->t;

    if ((ioParams->kSh <= 0) || (ioParams->nSh <= 0) ||
      ((ioParams->nSh-ioParams->kSh)%2 != 0) ||
      (ioParams->nSh > (ioParams->dimGF-1)) ||
      ((RS_GF_DEGREE_4 == ioParams->m) && ((ioParams->nSh%2) != 0)))
    {
      retErr = ERR_INV_RS_MSG_CW_LEN;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for Reed-Solomon encoding in systematic form. </i>
 * 
 * Redundancy bytes are appendend at the beginning of codewords and calculated as
 * remainder of the upshifted message polynomial divided by the generator polynomial. 
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return error ID
 */
error_t RcCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams )
{
  Debug_SetWatermark((void *)RcCod_Encoder,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  const uint8_t numMsg = BY2BI_LEN(inStream->len)/(pParams->m*pParams->kSh);
  const uint8_t lenGenPoly = 2*pParams->t+1;
  uint8_t genPoly[lenGenPoly];
  uint8_t mapTable[pParams->dimGF][RS_TABLE_IDX_NUM];                         /** - mapping table between symbols and basis */
  int16_t quotDeg;
  uint16_t quotCoef;
  uint16_t maxDeg;
  uint16_t j;
  uint8_t inSymbs[pParams->kUn];
  uint8_t tmpPoly[pParams->nUn];
  uint8_t divQuotCoef[pParams->nUn];
  uint8_t curSymb;
  uint8_t i;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id) &&
      (NULL != pParams))
  {
    RetrieveMappingTableGF(mapTable,pParams);
    RetrieveGeneratorPolynomial(genPoly,lenGenPoly,mapTable,pParams);

    for (i=0; i<numMsg; i++)
    {
      memset(inSymbs,0,pParams->kUn);

      for (j=0; j<pParams->kSh; j++)
      {
        if (RS_GF_DEGREE_4 == pParams->m)
        {
          if (IS_EVEN(j))
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
        inSymbs[j] = ConvertBi2Sy(curSymb,mapTable);                          /** - bits-to-symbol conversion */
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
          divQuotCoef[j+quotDeg] = MultiplyGF(quotCoef,genPoly[j],pParams);
        }

        for (j=0; j<pParams->nUn; j++)
        {
          tmpPoly[j] = AddGF(tmpPoly[j],divQuotCoef[j],mapTable);
        }

        maxDeg = FindMaxDeg(tmpPoly,pParams->nUn);
        quotDeg = maxDeg-2*pParams->t;
      }
      
      if (RS_GF_DEGREE_4 == pParams->m)
      {
        for (j=0; j<2*pParams->t; j++)
        {
          if (IS_EVEN(j))
          {
            outStream->pBuf[(j+i*pParams->nSh)/2] =
              (ConvertSy2Bi(tmpPoly[j],mapTable)<<4);
          }
          else
          {
            outStream->pBuf[(j-1+i*pParams->nSh)/2] |=
              ConvertSy2Bi(tmpPoly[j],mapTable);
          }
        }

        memcpy(&outStream->pBuf[pParams->t+i*pParams->nSh/2],
               &inStream->pBuf[i*pParams->kSh/2],pParams->kSh/2);
      }
      else                                                                    // i.e. "if (RS_GF_DEGREE_8 == pParams->m)"
      {
        for (j=0; j<2*pParams->t; j++)
        {
          outStream->pBuf[j+i*pParams->nSh] =
            ConvertSy2Bi(tmpPoly[j],mapTable);                                /** - write redundancy bits into output stream after symbol-to-bits conversion */
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


/**
 * @brief <i> Function for Reed-Solomon decoding in systematic form. </i>
 * 
 * Redundancy bytes are expected at the beginning of codewords and calculated as
 * remainder of the upshifted message polynomial divided by the generator polynomial.
 * 
 * @param[in] inStream input stream
 * @param[out] outStream output stream
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return error ID
 */
error_t RcCod_Decoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams )
{
  Debug_SetWatermark((void *)RcCod_Decoder,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  const uint8_t numMsg = BY2BI_LEN(inStream->len)/(pParams->m*pParams->nSh);
  uint8_t mapTable[pParams->dimGF][RS_TABLE_IDX_NUM];                         /** - mapping table between symbols and basis */
  uint8_t tmpSymbs[pParams->nUn];
  uint8_t syndrome[2*pParams->t];
  uint8_t sigma[pParams->t+1];
  uint8_t omega[2*pParams->t+1];
  uint8_t errLocation[pParams->t];
  uint8_t errMagnitude[pParams->t];
  uint8_t curSymb;
  uint8_t i, j;
  bool errFlag;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      Memory_IsStreamValid(outStream,outStream->id) &&
      (NULL != pParams))
  {
    RetrieveMappingTableGF(mapTable,pParams);
    memset(tmpSymbs,0,pParams->nUn);

    for (i=0; i<numMsg; i++)
    {
      for (j=0; j<pParams->nSh; j++)
      {
        if (RS_GF_DEGREE_4 == pParams->m)
        {
          if (IS_EVEN(j))
          {
            curSymb = (inStream->pBuf[(j+i*pParams->nSh)/2]>>4);
          }
          else
          {
            curSymb = (inStream->pBuf[(j-1+i*pParams->nSh)/2]&0x0F);
          }
        }
        else                                                                  // i.e. "if (RS_GF_DEGREE_8 == pParams->m)"
        {
          curSymb = inStream->pBuf[j+i*pParams->nSh];
        }
        tmpSymbs[j] = ConvertBi2Sy(curSymb,mapTable);                         /** - bits-to-symbol conversion */
      }

      errFlag = GetSyndrome(tmpSymbs,syndrome,pParams,mapTable);              /** - estimate syndrome polynomial */

      if (errFlag)                                                            /** - check if any error has been detected on current symbol */
      {
        BerlekampMasseyAlgorithm(sigma,syndrome,pParams,mapTable);            /** - estimate Sigma(x) polynomial */
        ChienAlgorithm(errLocation,sigma,pParams,mapTable);                   /** - estimate error locator polynomial */
        KeyAlgorithm(omega,syndrome,sigma,pParams,mapTable);                  /** - estimate Omega(x) polynomial */
        ForneyAlgorithm(errMagnitude,omega,errLocation,pParams,mapTable);     /** - estimate error magnitude polynomial */
        ErrorCorrector(tmpSymbs,errLocation,errMagnitude,pParams,mapTable);   /** - correct the corrupted symbol stream */
      }

      if (RS_GF_DEGREE_4 == pParams->m)
      {
        for (j=0; j<pParams->kSh; j++)
        {
          if (IS_EVEN(j))
          {
            outStream->pBuf[(j+i*pParams->kSh)/2] = 
              (ConvertSy2Bi(tmpSymbs[j+2*pParams->t],mapTable)<<4);
          }
          else
          {
            outStream->pBuf[(j-1+i*pParams->kSh)/2] |=
              ConvertSy2Bi(tmpSymbs[j+2*pParams->t],mapTable);
          }
        }
      }
      else
      {
        for (j=0; j<pParams->kSh; j++)
        {
          outStream->pBuf[j+i*pParams->kSh] =
            ConvertSy2Bi(tmpSymbs[j+2*pParams->t],mapTable);                  /** - symbol-to-bits conversion */
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
  Debug_SetWatermark((void *)RetrievePrimitivePolynomial,WM_LEVEL_2);

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
static error_t RetrieveGeneratorPolynomial( uint8_t * ioBuf, uint8_t len, const uint8_t mapTable[][RS_TABLE_IDX_NUM], const rs_par_t * pParams )
{
  Debug_SetWatermark((void *)RetrieveGeneratorPolynomial,WM_LEVEL_2);

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
        tmpVal = MultiplyGF(ioBuf[j],PowerGF(2,i,pParams),pParams);
        if (j > 0)
        {
          ioBuf[j] = AddGF(tmpVal,ioBuf[j-1],mapTable);
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
 * @param[out] ioTable i/o mapping matrix to be filled
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return error ID
 */
static error_t RetrieveMappingTableGF( uint8_t ioTable[][RS_TABLE_IDX_NUM], const rs_par_t * pParams )
{
  Debug_SetWatermark((void *)RetrieveMappingTableGF,WM_LEVEL_2);

  error_t retErr = ERR_NONE;
  rs_encoder_info_t encInfo;
  int16_t quotDeg;
  uint16_t maxDeg;
  uint16_t j;
  uint8_t tmpPoly[pParams->dimGF];
  uint8_t i;
  
  if ((NULL != ioTable) && (NULL!= pParams))
  {
    for (j=0;j<pParams->dimGF;j++)
    {
      memset(ioTable[j],0,RS_TABLE_IDX_NUM);
    }

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

      ioTable[j][RS_TABLE_IDX_BIT] = GetBasis(tmpPoly,pParams);               /** retrieve bit basis from remainder */
      ioTable[ioTable[j][RS_TABLE_IDX_BIT]][RS_TABLE_IDX_SYM] = j;
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
  Debug_SetWatermark((void *)FindMaxDeg,WM_LEVEL_3);

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
 * @brief <i> Function for retrieving bit basis from remainder polynomial during mapping. </i>
 * 
 * @param[in] poly polynomial buffer
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return maximum degree index
 */
static uint8_t GetBasis( const uint8_t * poly, const rs_par_t * pParams )
{
  Debug_SetWatermark((void *)GetBasis,WM_LEVEL_3);

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


/**
 * @brief <i> Function for retrieving GF symbol corresponding to input bit basis. </i>
 * 
 * @param[in] inBasis bit basis
 * @param[in] mapTable mapping table
 * 
 * @return corresponding GF symbol
 */
static uint8_t ConvertBi2Sy( uint8_t inBasis, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)GetBasis,WM_LEVEL_3);

  return mapTable[inBasis][RS_TABLE_IDX_SYM];
}


/**
 * @brief <i> Function for retrieving bit basis corresponding to input GF symbol. </i>
 * 
 * @param[in] inSymb GF symbol
 * @param[in] mapTable mapping table
 * 
 * @return corresponding bit basis
 */
static uint8_t ConvertSy2Bi( uint8_t inSymb, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)GetBasis,WM_LEVEL_3);

  return mapTable[inSymb][RS_TABLE_IDX_BIT];
}


/**
 * @brief <i> Function for performing addition operations in GF(2^m). </i>
 * 
 * @param[in] symbA 1st GF symbol
 * @param[in] symbB 2nd GF symbol
 * @param[in] mapTable mapping table
 * 
 * @return bit basis resulting from addition
 */
static uint8_t AddGF( uint8_t symbA, uint8_t symbB, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)AddGF,WM_LEVEL_3);

  uint8_t basisRes;

  basisRes = mapTable[symbA][RS_TABLE_IDX_BIT]^mapTable[symbB][RS_TABLE_IDX_BIT];

  return mapTable[basisRes][RS_TABLE_IDX_SYM];
}


/**
 * @brief <i> Function for performing multiplication operations in GF(2^m). </i>
 * 
 * @param[in] symbA 1st GF symbol
 * @param[in] symbB 2nd GF symbol
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return bit basis resulting from multiplication
 */
static uint8_t MultiplyGF( uint8_t symbA, uint8_t symbB, const rs_par_t * pParams )
{
  Debug_SetWatermark((void *)MultiplyGF,WM_LEVEL_3);

  uint8_t symbRes = 0;
  
  if ((symbA != 0) && (symbB != 0))
  {
    symbRes = ((symbA+symbB-2)%(pParams->dimGF-1))+1;
  }

  return symbRes;
}


/**
 * @brief <i> Function for performing power raising operations in GF(2^m). </i>
 * 
 * - NB#1: to get "alpha^(w)" use "PowerGF(2,w)";
 * - NB#2: to get "alpha^(-w)" use "PowerGF(2,-w)";
 * - NB#3: to get "Symb^-1" use "PowerGF(2,-Symb+1)";
 * - NB#4: keep in mind the identity "MultiplyGF(Symb,PowGF(2,-Symb+1))=1".
 * 
 * @param[in] symbBase symbol base
 * @param[in] exp exponent value
 * @param[in] pParams pointer to reed-solomon parameters structure
 * 
 * @return GF stmbol resulting from power raising
 */
static uint8_t PowerGF( uint8_t symbBase, int16_t exp, const rs_par_t * pParams )
{
  Debug_SetWatermark((void *)PowerGF,WM_LEVEL_3);
  
  uint8_t symbRes;
  int16_t tmpVal;

  if ((0 == symbBase) || (1 == symbBase))
  {
    symbRes = symbBase;
  }
  else
  {
    tmpVal = ((int16_t) (((symbBase-1)*exp)%(pParams->dimGF-1)));
    if (exp < 0)
    {
      symbRes = ((uint8_t) (tmpVal+pParams->dimGF));
    }
    else
    {
      symbRes = ((uint8_t) (tmpVal+1));
    }
  }

  return symbRes;
}


/**
 * @brief <i> Function for estimating the syndrome symbols vector of the input codeword
 *        (the 0-degree coefficient is omitted, since always 0). </i>
 * 
 * @param[in] cwSymbs input stream
 * @param[out] syndrome output stream
 * @param[in] pParams pointer to reed-solomon parameters structure
 * @param[in] mapTable mapping table
 * 
 * @return flag notifying if a corrupted symbol has been detected
 */
static bool GetSyndrome( const uint8_t * cwSymbs, uint8_t * syndrome, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)GetSyndrome,WM_LEVEL_2);

  uint16_t i;
  int16_t j;
  uint8_t sum;
  bool errFlag = false;

  if ((NULL != cwSymbs) && (NULL != syndrome) && (NULL != pParams))
  {
    for (i=0; i<2*pParams->t; i++)                                            /** - compute syndrome polynomial Syndr(x) as Cw(x) for x = a, a^2, ..., a^2t */
    {
      sum = cwSymbs[0];

      for (j=1; j<pParams->nUn; j++)
      {
        sum = AddGF(sum,MultiplyGF(cwSymbs[j],PowerGF(i+2,j,pParams),pParams),mapTable);
      }

      syndrome[i] = sum;

      if (sum != 0)
      {
        errFlag = true;                                                       /** - assert error flag if one coefficient is not equal to 0 */
      }
    }
  }

  return errFlag;
}


/**
 * @brief <i> Function for iteratively estimating Sigma(x) polynomial
 *        via Berlekamp-Massey algorithm. </i>
 * 
 * @param[out] sigma sigma polynomial
 * @param[in] syndrome syndrome polynomial
 * @param[in] pParams pointer to reed-solomon parameters structure
 * @param[in] mapTable mapping table
 * 
 * @return error ID
 */
static error_t BerlekampMasseyAlgorithm( uint8_t * sigma, const uint8_t * syndrome, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)BerlekampMasseyAlgorithm,WM_LEVEL_2);

  error_t retErr = ERR_NONE;
  int16_t curErr = 0;                                                         /** - number of assumed errors at current iteration (Ec) */
  int16_t nextErr;                                                            /** - number of assumed errors at next iteration (En) */
  int16_t delta;
  int16_t h = -1;                                                             /** - error iteration counter */
  uint8_t tmpSigma[pParams->t+1];                                             /** - temporary sigma polynomial (at next iteration) */
  uint8_t tau[pParams->t+1];                                                  /** - Tau(x) polynomial */
  uint8_t i, j;

  if ((NULL != sigma) && (NULL != syndrome) && (NULL != pParams) && (NULL != mapTable))
  {
    memset(tau,0,pParams->t+1);
    memset(sigma,0,pParams->t+1);
    tau[1] = 1;
    sigma[0] = 1;

    for (i=0; i<2*pParams->t; i++)
    {
      if (curErr <= pParams->t)
      {
        delta = GetDiscrepancy(syndrome,sigma,curErr,i,pParams,mapTable);

        if (delta != 0)
        {
          for (j=0; j<pParams->t+1; j++)
          {
            tmpSigma[j] = AddGF(sigma[j],MultiplyGF(delta,tau[j],pParams),mapTable);
          }

          if (curErr < (i-h))
          {
            nextErr = i-h;
            h = i-curErr;
            
            for (j=0; j<pParams->t+1; j++)
            {
              tau[j] = MultiplyGF(PowerGF(2,-delta+1,pParams),sigma[j],pParams);
            }

            curErr = nextErr;
          }

          memcpy(sigma,tmpSigma,pParams->t+1);
        }

        memcpy(&tau[1],tau,pParams->t);
        tau[0] = 0;
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
 * @brief <i> Function for calculating discrepancy between syndrome and error locator polynomials. </i>
 * 
 * @param[in] syndrome syndrome polynomial
 * @param[in] sigma sigma polynomial
 * @param[in] errNum current number of errors
 * @param[in] iter current iteration index
 * @param[in] pParams pointer to reed-solomon parameters structure
 * @param[in] mapTable mapping table
 * 
 * @return discrepancy value
 */
static int16_t GetDiscrepancy( const uint8_t * syndrome, const uint8_t * sigma, int16_t errNum, uint8_t iter, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)GetDiscrepancy,WM_LEVEL_2);
  
  int16_t delta = 0;
  uint8_t j;
  
  if ((NULL != syndrome) && (NULL != sigma) && (NULL != pParams) && (NULL != mapTable))
  {
    for (j=0; j<errNum+1; j++)
    {
      delta = AddGF(delta,MultiplyGF(sigma[j],syndrome[iter-j],pParams),mapTable);
    }
  }

  return delta;
}


/**
 * @brief <i> Function for estimating the error positions of corrupted symbols
 *        by finding Sigma(x) roots via Chien algorithm. </i>
 * 
 * @param[out] errLoc error locator polynomial
 * @param[in] sigma sigma polynomial
 * @param[in] pParams pointer to reed-solomon parameters structure
 * @param[in] mapTable mapping table
 * 
 * @return error ID
 */
static error_t ChienAlgorithm( uint8_t * errLoc, const uint8_t * sigma, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)ChienAlgorithm,WM_LEVEL_2);
  
  error_t retErr = ERR_NONE;
  uint8_t idx = 0;
  uint8_t root;
  uint8_t i, j;

  if ((NULL != errLoc) && (NULL != sigma) && (NULL != pParams) && (NULL != mapTable))
  {
    memset(errLoc,0,pParams->t);

    for (i=0; i<pParams->nUn; i++)
    {
      root = sigma[0];

      for (j=1; j<pParams->t+1; j++)
      {
        root = AddGF(root,MultiplyGF(sigma[j],PowerGF(i+1,j,pParams),pParams),mapTable);
      }
      if ((0 == root) && (idx < pParams->t))
      {
        errLoc[idx] = PowerGF(i+1,-1,pParams);
        idx++;
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
 * @brief <i> Function for estimating error evaluator polynomial Omega(x) via Key equation
 *        Omega(x) = mod((1+Syndr(x))*Sigma(x),x^(2t+1)). </i>
 * 
 * @param[out] omega omega polynomial
 * @param[in] syndrome syndrome polynomial
 * @param[in] sigma sigma polynomial
 * @param[in] pParams pointer to reed-solomon parameters structure
 * @param[in] mapTable mapping table
 * 
 * @return error ID
 */
static error_t KeyAlgorithm( uint8_t * omega, const uint8_t * syndrome, const uint8_t * sigma, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)KeyAlgorithm,WM_LEVEL_2);

  error_t retErr = ERR_NONE;
  uint8_t tmpOmega[3*pParams->t+1];
  uint8_t tmpSyndr[2*pParams->t+1];
  uint8_t i, j;
  
  if ((NULL != omega) && (NULL != syndrome) && (NULL != sigma) && (NULL != pParams) && (NULL != mapTable))
  {
    memset(tmpOmega,0,sizeof(tmpOmega));
    tmpSyndr[0] = 1;
    memcpy(&tmpSyndr[1],syndrome,2*pParams->t);                               // tmpSyndr(x) = 1+syndrome(x)

    for (i=0; i<pParams->t+1; i++)
    {
      for (j=0; j<2*pParams->t+1; j++)
      {
        tmpOmega[i+j] = AddGF(tmpOmega[i+j],MultiplyGF(sigma[i],tmpSyndr[j],pParams),mapTable);
      }
    }

    memcpy(omega,tmpOmega,2*pParams->t+1);
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for estimating error magnitude of the corrupted symbols
 *        via Forney algorithm. </i>
 * 
 * @param[out] errMag error magnitude polynomial
 * @param[in] omega omega polynomial
 * @param[in] errLoc error locator polynomial
 * @param[in] pParams pointer to reed-solomon parameters structure
 * @param[in] mapTable mapping table
 * 
 * @return error ID
 */
static error_t ForneyAlgorithm( uint8_t * errMag, const uint8_t * omega, const uint8_t * errLoc, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  Debug_SetWatermark((void *)ForneyAlgorithm,WM_LEVEL_2);

  error_t retErr = ERR_NONE;
  uint8_t root;
  uint8_t numer, denom;
  uint8_t i, j;

  if ((NULL != errMag) && (NULL != omega) && (NULL != errLoc) && (NULL != pParams) && (NULL != mapTable))
  {
    memset(errMag,0,pParams->t);

    for (i=0; i<pParams->t; i++)
    {
      if (errLoc[i] != 0)
      {
        root = PowerGF(errLoc[i],-1,pParams);
        numer = omega[0];

        for (j=1; j<2*pParams->t+1; j++)
        {
          numer = AddGF(numer,MultiplyGF(omega[j],PowerGF(root,j,pParams),pParams),mapTable);
        }

        denom = 1;

        for (j=0; j<pParams->t; j++)
        {
          if (i != j)
          {
            denom = MultiplyGF(denom,AddGF(1,MultiplyGF(root,errLoc[j],pParams),mapTable),pParams);
          }
        }

        errMag[i] = MultiplyGF(numer,PowerGF(2,-denom+1,pParams),pParams);
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
 * @brief <i> Function for correcting corrupted symbols through the estimated
 *        error locations and magnitudes. </i>
 * 
 * @param[in, out] ioSymbs GF-mapped symbols
 * @param[in] errLoc error locator polynomial
 * @param[in] errMag error magnitude polynomial
 * @param[in] pParams pointer to reed-solomon parameters structure
 * @param[in] mapTable mapping table
 * 
 * @return error ID
 */
static error_t ErrorCorrector( uint8_t * ioSymbs, const uint8_t * errLoc, const uint8_t * errMag, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM])
{
  Debug_SetWatermark((void *)ErrorCorrector,WM_LEVEL_2);

  error_t retErr = ERR_NONE;
  uint8_t j;

  if ((NULL != ioSymbs) && (NULL != errLoc) && (NULL != errMag) && (NULL != pParams) && (NULL != mapTable))
  {
    for (j=0; j<pParams->t; j++)
    {
      if (errLoc[j] != 0)
      {
        ioSymbs[errLoc[j]-1] = AddGF(ioSymbs[errLoc[j]-1],errMag[j],mapTable);
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
