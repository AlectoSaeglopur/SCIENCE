/**
 * @file debug.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Debug library
 * 
 * Library containing debug functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "debug.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static bool IsOrgLenValid( ulen_t orgLenBy, const debug_par_t * pParams );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for retrieving and listing all simulation parameters into dedicated structure. </i>
 * 
 * @param[out] ioParams pointer to i/o parameters structure to be filled
 * @param[in] ccParam pointer to convolutionan coding parameters structure
 * @param[in] modParam pointer to modulation coding parameters structure
 * @param[in] chanParam pointer to channel parameters structure
 * 
 * @return error ID
 */
error_t Debug_ListParameters( debug_par_t * ioParams, const cc_par_t * ccParam, const mod_par_t * modParam, const chan_par_t * chanParam, const scramb_par_t * scrParam )
{
  error_t retErr = ERR_NONE;

  if ((NULL != ioParams) && (NULL != ccParam) && (NULL != modParam) && (NULL != chanParam) && (NULL != scrParam))
  {
    ioParams->scrPar = *scrParam;
    ioParams->ccPar = *ccParam;
    ioParams->modPar = *modParam;
    ioParams->chanPar = *chanParam;
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for filling input buffer with random bytes. </i>
 * 
 * @param[out] ioStream: i/o stream to be filled
 * @param[in] pSeed: poiter to seed value
 * 
 * @return error ID
 */
error_t Debug_GenerateRandomBytes( byte_stream_t * ioStream, const uint32_t * pSeed )
{
  uint32_t j;
  error_t retErr = ERR_NONE;

  if ((NULL != ioStream) && ((NULL != ioStream->pBuf)))
  {
    if (NULL == pSeed)
    {
      srand(time(NULL));                                                                /** link random seed to current time */
    }
    else
    {
      srand(*pSeed);                                                                    /** link random seed to provided argument */
    }
    
    for (j=0; j<ioStream->len; j++)
    {
      ioStream->pBuf[j] = (uint8_t)rand();
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for printing on terminal a byte buffer content (in hexadecimal format). </i>
 * 
 * @param[in] inStream input stream
 * @param[in] label label ID
 * @param[in] pParams pointer to debug parameters structure
 * 
 * @return error ID
 */
error_t Debug_PrintByteStream( const byte_stream_t * inStream, print_label_t label, const debug_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  ulen_t j;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != pParams))
  {
    if (!((CHAN_AWGN == pParams->chanPar.type) && (CC_VITDM_SOFT == pParams->ccPar.vitDM) && (PID_RX_CNVCOD == label)))
    {
      switch (label)
      {
        case PID_TX_ORG:
          printf(" * TX ORIGIN BYTES (%d)\n\t",inStream->len);
          break;

        case PID_RX_ORG:
          printf(" * RX ORIGIN BYTES (%d)\n\t",inStream->len);
          break;

        case PID_TX_CRC:
          printf(" * TX CRC BYTES (%d)\n\t",inStream->len);
          break;

        case PID_RX_CRC:
          printf(" * RX CRC BYTES (%d)\n\t",inStream->len);
          break;

        case PID_TX_SCR:
          printf(" * TX SCRAMBLED BYTES (%d)\n\t",inStream->len);
          break;

        case PID_RX_SCR:
          printf(" * RX SCRAMBLED BYTES (%d)\n\t",inStream->len);
          break;

        case PID_TX_CNVCOD:
          printf(" * TX CONVOLUTIONAL CODED BYTES (%d)\n\t",inStream->len);
          break;

        case PID_RX_CNVCOD:
          printf(" * RX CONVOLUTIONAL CODED BYTES (%d)\n\t",inStream->len);
          break;

        default:
          retErr = ERR_INV_PRINTID;
          break;
      }

      if (ERR_NONE == retErr)
      {
        for (j=0; j<inStream->len; j++)
        {
          printf("%2X ",inStream->pBuf[j]);
          if (((PID_NCOLS_BYTE-1) == (j%PID_NCOLS_BYTE)) && (j<(inStream->len-1)))
          {
            printf("\n\t");
          }
        }
        printf("\n");
      }

      printf("\n");
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for printing on terminal a float buffer content. </i>
 * 
 * @param[in] inStream input stream
 * @param[in] label label ID
 * @param[in] pParams pointer to debug parameters structure
 * 
 * @return error ID
 */
error_t Debug_PrintFloatStream( const float_stream_t * inStream, print_label_t label, const debug_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  ulen_t j;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != pParams))
  {

    if ((CHAN_AWGN == pParams->chanPar.type) && (CC_VITDM_SOFT == pParams->ccPar.vitDM))
    {
      switch (label)
      {
        case PID_RX_LLR:
          printf(" * RX LLRS (%d)\n\t",inStream->len);
          break;

        default:
          retErr = ERR_INV_PRINTID;
          break;
      }

      if (ERR_NONE == retErr)
      {
        for (j=0; j<inStream->len; j++)
        {
          if (0 < inStream->pBuf[j])
          {
            printf("+");
          }
          else if (0 == inStream->pBuf[j])
          {
            printf(" ");
          }

          printf("%1.3f ",inStream->pBuf[j]);

          if (((PID_NCOLS_FLOAT-1) == (j%PID_NCOLS_FLOAT)) && (j<(inStream->len-1)))
          {
            printf("\n\t");
          }
        }

        printf("\n\n");
      }

      printf("\n");
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for printing on terminal a complex buffer content. </i>
 * 
 * @param[in] inStream input stream
 * @param[in] label label ID
 * @param[in] pParams pointer to debug parameters structure
 * 
 * @return error ID
 */
error_t Debug_PrintComplexStream( const complex_stream_t * inStream, print_label_t label, const debug_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  ulen_t j;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != pParams))
  {
    if (CHAN_AWGN == pParams->chanPar.type)
    {
      switch (label)
      {
        case PID_TX_MAP:
          printf(" * TX MAPPED SYMBOLS (%d)\n\t",inStream->len);
          break;

        case PID_RX_MAP:
          printf(" * RX MAPPED SYMBOLS (%d)\n\t",inStream->len);
          break;

        default:
          retErr = ERR_INV_PRINTID;
          break;
      }

      if (ERR_NONE == retErr)
      {
        for (j=0; j<inStream->len; j++)
        {
          if (inStream->pBuf[j].re >= 0)
          {
            printf("+");
          }
          printf("%1.2f",inStream->pBuf[j].re);

          if (inStream->pBuf[j].im >= 0)
          {
            printf("+");
          }
          printf("%1.2fi | ",inStream->pBuf[j].im);

          if (((PID_NCOLS_SYMB-1) == j%PID_NCOLS_SYMB) && (j<(inStream->len-1)))
          {
            printf("\n\t");
          }
        }
        printf("\n");
      }

      printf("\n");
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for printing on terminal all simulation parameters. </i>
 * 
 * @param[in] orgLen source buffer length [B]
 * @param[in] pParams pointer to debug parameters structure
 * 
 * @return error ID
 */
error_t Debug_PrintParameters( ulen_t orgLen, const debug_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if (IsOrgLenValid(orgLen,pParams))
  {
    printf("\n # PARAMETERS\n");
    printf("    * Scrambling :");
    printf("%s",SCR_TYPE_STR(pParams->scrPar.type));
    printf(" | Ncells = %u\n",pParams->scrPar.nCells);
    printf("    * Convolutional Coding :");
    printf(" K = %d",pParams->ccPar.kLen);
    printf(" | Rc = %d/%d",pParams->ccPar.cRate,pParams->ccPar.cRate+1);
    printf(" | DM = %s\n",CC_VDM_STR(pParams->ccPar.vitDM));
    printf("    * Modulation :");
    printf(" %u-%s\n",pParams->modPar.order,MOD_TYPE_STR(pParams->modPar.type));
    printf("    * Channel :");
    if (CHAN_BSC == pParams->chanPar.type)
    {
      printf(" BSC | Peb = %1.1e\n",pParams->chanPar.Peb);
    }
    else if (CHAN_AWGN == pParams->chanPar.type)
    {
      printf(" AWGN | EbN0 = %1.1f\n",pParams->chanPar.EbN0);
    }
    else
    {
      printf(" N/A\n");
    }
    printf("\n");
  }
  else
  {
    retErr = ERR_INV_BUFFER_SIZE;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for estimating and printing on terminal the number of mismatched bits between two byte streams. </i>
 * 
 * @param[in] inStreamA 1st input stream
 * @param[in] inStreamB 2nd input stream
 * @param[in] label label ID
 * @param[in] pParams pointer to debug parameters structure
 * 
 * @return error ID
 */
error_t Debug_CheckWrongBits( const byte_stream_t * inStreamA, const byte_stream_t * inStreamB, print_label_t label, const debug_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const ulen_t bitLen = BY2BI_LEN(inStreamA->len);
  ulen_t bitErrCnt = 0;
  ulen_t minErrDist = bitLen;
  ulen_t curErrDist = 0;
  ulen_t j;
  ulen_t byteIdx;
  uint8_t bitIdx;

  if ((NULL != inStreamA) && (NULL != inStreamA->pBuf) && (NULL != inStreamB) && (NULL != inStreamB->pBuf) && (NULL != pParams))
  {
    if (!((CHAN_AWGN == pParams->chanPar.type) && (CC_VITDM_SOFT == pParams->ccPar.vitDM) && (PID_RX_CNVCOD == label)))
    {
      if (inStreamA->len == inStreamB->len)
      {
        for (j=0; j<bitLen; j++)
        {
          byteIdx = BI2BY_LEN(j);
          bitIdx = (uint8_t)(j&LSBYTE_MASK_U32);
          curErrDist++;
          if ((((inStreamA->pBuf[byteIdx])>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK_U8) !=
              (((inStreamB->pBuf[byteIdx])>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK_U8))
          {
            bitErrCnt++;
            if ((bitErrCnt > 1) && (curErrDist < minErrDist))
            {
              minErrDist = curErrDist;
            }
            curErrDist = 0;
          }
        }
        if (bitErrCnt < 2)
        {
          minErrDist = 0;
        }

        switch (label)
        {
          case PID_TX_CNVCOD:
          case PID_RX_CNVCOD:
            printf(" * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\n\n",bitErrCnt,bitLen,minErrDist);
            break;

          case PID_TX_ORG:
          case PID_RX_ORG:
            printf(" * Errors at source level: %u out of %u bits (MD = %u)\n\n",bitErrCnt,bitLen,minErrDist);
            break;

          default:
            retErr = ERR_INV_PRINTID;
            break;
        }
      }
      else
      {
        retErr = ERR_INV_BUFFER_SIZE;
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
 * @brief <i> Function for writing byte stream content into CSV file. </i>
 * 
 * @param[in] inStream input stream
 * @param[in] label label ID
 * 
 * @return error ID
 */
error_t Debug_WriteByteStreamToCsv( const byte_stream_t * inStream, print_label_t label )
{
  error_t retErr = ERR_NONE;
  FILE * fid = NULL;
  ulen_t j;
  
  if ((NULL != inStream) && (NULL != inStream->pBuf))
  {
    switch (label)
    {
      case PID_TX_ORG:
        fid = fopen("txOrgBytes.csv","w");
        break;

      case PID_RX_ORG:
        fid = fopen("rxOrgBytes.csv","w");
        break;

      case PID_TX_SCR:
        fid = fopen("txScrBytes.csv","w");
        break;
      
      case PID_RX_SCR:
        fid = fopen("rxScrBytes.csv","w");
        break;

      default:
        retErr = ERR_INV_PRINTID;
        break;
    }

    if ((ERR_NONE == retErr) && (NULL != fid))
    {
      fprintf(fid,"%u,",inStream->len);                                               /** write stream length as 1st element */
      for (j=0; j<inStream->len; j++)
      {
        fprintf(fid,"%u",inStream->pBuf[j]);
        if (j < inStream->len-1)
        {
          fprintf(fid,",");
        }
      }
      fclose(fid);
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for writing complex stream content into CSV file. </i>
 * 
 * @param[in] inStream input stream
 * @param[in] label label ID
 * 
 * @return error ID
 */
error_t Debug_WriteComplexStreamToCsv( const complex_stream_t * inStream, print_label_t label )
{
  error_t retErr = ERR_NONE;
  FILE * fid = NULL;
  ulen_t j;
  
  if ((NULL != inStream) && (NULL != inStream->pBuf))
  {
    switch (label)
    {
      case PID_TX_MAP:
        fid = fopen("txModSymbs.csv","w");
        break;

      case PID_RX_MAP:
        fid = fopen("rxModSymbs.csv","w");
        break;

      default:
        retErr = ERR_INV_PRINTID;
        break;
    }

    if ((ERR_NONE == retErr) && (NULL != fid))
    {
      fprintf(fid,"%u,",inStream->len);                                               /** write stream length as 1st element */
      for (j=0; j<inStream->len; j++)
      {
        fprintf(fid,"%1.4f,%1.4f",inStream->pBuf[j].re,inStream->pBuf[j].im);
        if (j < inStream->len-1)
        {
          fprintf(fid,",");
        }
      }
      fclose(fid);
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
 * @brief <i> Function for checking source stream length correctness. </i>
 * 
 * @param lenBy : source buffer length [B]
 * 
 * @return validity outcome
 */
static bool IsOrgLenValid( ulen_t orgLenBy, const debug_par_t * dbgParams )
{
  bool bRet = false;
  ulen_t orgLenBi = BY2BI_LEN(orgLenBy);
  ulen_t punLenBi = (orgLenBi/(dbgParams->ccPar.cRate)*(1+dbgParams->ccPar.cRate));

  if ((orgLenBy > 0) && (0 == (orgLenBi%dbgParams->ccPar.cRate)) &&                   /** source bit length shall be positive and divisible by code rate denominator */
      (0 == (punLenBi%NUM_BITS_PER_BYTE)) &&                                          /** convolutional punctured bit length shall be a multiple of NUM_BITS_PER_BYTE */
      (0 == (punLenBi%dbgParams->modPar.bps)))                                        /** convolutional punctured bit length shall be a multiple of MOD_BPS */
  {
    bRet = true;
  }

  return bRet;
}
