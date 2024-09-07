/**
 * @file debug.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Debug library
 * 
 * Library containing all debug functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "debug.h"



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static bool IsSrcLenValid( len_t lenBy );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for filling input buffer with random bytes. </i>
 * 
 * @param ioStream: i/o stream to be filled
 * @param len: i/o buffer length [B]
 * @param pSeed: poiter to seed value
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
      srand(time(NULL));															/** link random seed to current time */
    }
    else
    {
      srand(*pSeed);                                  /** link random seed to provided argument */
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
 * @param inBuffer : input buffer to be printed
 * @param len : input buffer length
 * @param label : label ID
 * @param dbgParams: pointer to all simulation parameters structure
 * 
 * @return error ID
 */
error_t Debug_PrintByteStream( const byte_stream_t * inStream, print_label_t label, const debug_par_t * dbgParams )
{
  error_t retErr = ERR_NONE;
  len_t j;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != dbgParams))
  {
    if (!((CHAN_AWGN == dbgParams->chanPar.type) && (CC_VITDM_SOFT == dbgParams->ccPar.vitDM) && (PID_RX_CNVCOD == label)))
    {
      switch (label)
      {
        case PID_TX_SRC:
          printf(" * TX SOURCE BYTES (%d)\n\t",inStream->len);
          break;

        case PID_RX_SRC:
          printf(" * RX SOURCE BYTES (%d)\n\t",inStream->len);
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
 * @param inBuffer : input buffer to be printed
 * @param len : input buffer length
 * @param label : label ID
 * @param dbgParams: pointer to all simulation parameters structure
 * 
 * @return error ID
 */
error_t Debug_PrintFloatStream( const float_stream_t * inStream, print_label_t label, const debug_par_t * dbgParams )
{
  error_t retErr = ERR_NONE;
	len_t j;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != dbgParams))
  {

    if ((CHAN_AWGN == dbgParams->chanPar.type) && (CC_VITDM_SOFT == dbgParams->ccPar.vitDM))
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
 * @param inBuffer : input buffer to be printed
 * @param len : input buffer length
 * @param label : label ID
 * @param dbgParams: pointer to all simulation parameters structure
 * 
 * @return error ID
 */
error_t Debug_PrintComplexStream( const complex_stream_t * inStream, print_label_t label, const debug_par_t * dbgParams )
{
  error_t retErr = ERR_NONE;
  len_t j;

  if ((NULL != inStream) && (NULL != inStream->pBuf) && (NULL != dbgParams))
  {
    if (CHAN_AWGN == dbgParams->chanPar.type)
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
 * @param len : source buffer length [B]
 * 
 * @return error ID
 */
error_t Debug_PrintParameters( len_t len )
{
  error_t retErr = ERR_NONE;

  if (IsSrcLenValid(len))
  {
    printf("\n # PARAMETERS");
    printf("\n    * Convolutional Coding :");
    printf(" K = %d",CC_KLEN);
    printf(" | Rc = %d/%d",CC_RATE,CC_RATE+1);
    printf(" | DM = %s\n",CC_VDM_STR(CC_VITDM));
    printf("    * Modulation :");
    printf(" %u-%s\n",MOD_ORDER,MOD_TYPE_STR(MOD_TYPE));
    printf("    * Channel :");
    if (CHAN_BSC == CHAN_TYPE)
    {
      printf(" BSC | Peb = %1.1e\n",BSC_PEB);
    }
    else if (CHAN_AWGN == CHAN_TYPE)
    {
      printf(" AWGN | EbN0 = %1.1f\n",AWGN_EBN0);
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
 * @brief Function for estimating and printing on terminal the number of mismatched bits between two byte streams.
 * 
 * @param inStreamA : 1st input stream
 * @param inStreamB : 2nd input stream
 * @param label : label ID
 * 
 * @return error ID
 */
error_t Debug_CheckWrongBits( const byte_stream_t * inStreamA, const byte_stream_t * inStreamB, print_label_t label, const debug_par_t * dbgParams )
{
  error_t retErr = ERR_NONE;
  const len_t bitLen = inStreamA->len<<BY2BI_SHIFT;
  len_t bitErrCnt = 0;
  len_t minErrDist = bitLen;
  len_t curErrDist = 0;
  len_t j;
  len_t byteIdx;
	uint8_t bitIdx;

	if ((NULL != inStreamA) && (NULL != inStreamA->pBuf) && (NULL != inStreamB) && (NULL != inStreamB->pBuf) && (NULL != dbgParams))
  {
    if (!((CHAN_AWGN == dbgParams->chanPar.type) && (CC_VITDM_SOFT == dbgParams->ccPar.vitDM) && (PID_RX_CNVCOD == label)))
    {
      if (inStreamA->len == inStreamB->len)
      {
        for (j=0; j<bitLen; j++)
        {
          byteIdx = j>>BY2BI_SHIFT;
          bitIdx = (uint8_t)(j&LSBYTE_MASK);
          curErrDist++;
          if ((((inStreamA->pBuf[byteIdx])>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK) !=
              (((inStreamB->pBuf[byteIdx])>>(BITIDX_1LAST-bitIdx))&LSBIT_MASK))
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

          case PID_TX_SRC:
          case PID_RX_SRC:
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
 * @brief Function for writing byte stream content into CSV file.
 * 
 * @param inStream : input stream
 * @param label : label ID
 * 
 * @return error ID
 */
error_t Debug_WriteByteStreamToCsv( const byte_stream_t * inStream, print_label_t label )
{
  error_t retErr = ERR_NONE;
  FILE * fid = NULL;
	len_t j;
  
  if ((NULL != inStream) && (NULL != inStream->pBuf))
  {
    switch (label)
    {
      case PID_TX_SRC:
        fid = fopen("txSrcBytes.csv","w");
        break;

      case PID_RX_SRC:
        fid = fopen("rxSrcBytes.csv","w");
        break;

      default:
        retErr = ERR_INV_PRINTID;
        break;
    }

    if ((ERR_NONE == retErr) && (NULL != fid))
    {
      fprintf(fid,"%u,",inStream->len);                                       /** write stream length as 1st element */
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
 * @brief Function for writing complex stream content into CSV file.
 * 
 * @param inStream : input stream
 * @param label : label ID
 * 
 * @return error ID
 */
error_t Debug_WriteComplexStreamToCsv( const complex_stream_t * inStream, print_label_t label )
{
  error_t retErr = ERR_NONE;
  FILE * fid = NULL;
	len_t j;
  
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
      fprintf(fid,"%u,",inStream->len);                                       /** write stream length as 1st element */
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


/**
 * @brief Function for retrieving and listing all simulation parameters into dedicated structure.
 * 
 * @param ioParams : pointer to i/o parameters structure to be filled
 * @param ccParam : pointer to convolutionan coding parameters structure
 * @param modParam : pointer to modulation coding parameters structure
 * @param chanParam : pointer to channel parameters structure
 * 
 * @return error ID
 */
error_t Debug_ListParameters( debug_par_t * ioParams, const cc_par_t * ccParam, const mod_par_t * modParam, const chan_par_t * chanParam )
{
  error_t retErr = ERR_NONE;

  if ((NULL != ioParams) && (NULL != ccParam) && (NULL != modParam) && (NULL != chanParam))
  {
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
static bool IsSrcLenValid( len_t lenBy )
{
  bool bRet = false;
  len_t lenBi = lenBy<<BY2BI_SHIFT;
  
  if (((lenBi%CC_RATE) == 0) &&                                               /** source bit length shall be divisible by code rate denominator */
      (((lenBi/CC_RATE*(1+CC_RATE))%NUM_BITS_PER_BYTE) == 0))                 /** coded bit length shall be a multiple of NUM_BITS_PER_BYTE */
  {
    bRet = true;
  }

  return bRet;
}
