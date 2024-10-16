/**
 * @file debug.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup TLC_CHAIN
 * @brief Debug library
 * 
 * Library containing debug functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "debug.h"



/************************/
/*** GLOBAL VARIABLES ***/
/************************/

static watermark_t gWatermarks[WM_LEVEL_NUM] = {0};
static const bool bShAppChgEnabled = false;                     //!< Flag specifying if terminal appearance change at run-time is enabled or not



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
 * @param[in] srcParam pointer to scrambling parameters structure
 * @param[in] rsParam pointer to reed-solomon coding parameters structure
 * @param[in] itlvParam pointer to interleaving parameters structure
 * @param[in] ccParam pointer to convolutionan coding parameters structure
 * @param[in] modParam pointer to modulation coding parameters structure
 * @param[in] chanParam pointer to channel parameters structure
 * 
 * @return error ID
 */
error_t Debug_ListParameters( debug_par_t * ioParams, const scr_par_t * scrParam, const rs_par_t * rsParam, const itlv_par_t * itlvParam,
                              const cc_par_t * ccParam, const mod_par_t * modParam, const chan_par_t * chanParam )
{
  Debug_SetWatermark((void *)Debug_ListParameters,WM_LEVEL_1);

  error_t retErr = ERR_NONE;

  if ((NULL != ioParams) && (NULL != scrParam) && (NULL != rsParam) && (NULL != ccParam) && 
      (NULL != modParam) && (NULL != chanParam))
  {
    ioParams->scrPar = *scrParam;
    ioParams->rsPar = *rsParam;
    ioParams->itlvPar = *itlvParam;
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
  Debug_SetWatermark((void *)Debug_GenerateRandomBytes,WM_LEVEL_1);

  uint32_t j;
  error_t retErr = ERR_NONE;

  if (Memory_IsStreamValid(ioStream,ioStream->id))
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
  Debug_SetWatermark((void *)Debug_PrintByteStream,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  ulen_t j;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      (NULL != pParams))
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

        case PID_TX_RSCOD:
          printf(" * TX REED-SOLOMON CODED BYTES (%d)\n\t",inStream->len);
          break;

        case PID_RX_RSCOD:
          printf(" * RX REED-SOLOMON CODED BYTES (%d)\n\t",inStream->len);
          break;

        case PID_TX_INTLV:
          printf(" * TX INTERLEAVED BYTES (%d)\n\t",inStream->len);
          break;

        case PID_RX_INTLV:
          printf(" * RX INTERLEAVED BYTES (%d)\n\t",inStream->len);
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
  Debug_SetWatermark((void *)Debug_PrintFloatStream,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  ulen_t j;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      (NULL != pParams))
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
  Debug_SetWatermark((void *)Debug_PrintComplexStream,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  ulen_t j;

  if (Memory_IsStreamValid(inStream,inStream->id) &&
      (NULL != pParams))
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
 * @brief <i> Function for checking origin length validity and printing on terminal all simulation parameters. </i>
 * 
 * @param[in] orgLen source buffer length [B]
 * @param[in] pParams pointer to debug parameters structure
 * 
 * @return error ID
 */
error_t Debug_PrintParameters( ulen_t orgLen, const debug_par_t * pParams )
{
  Debug_SetWatermark((void *)Debug_PrintParameters,WM_LEVEL_1);

  error_t retErr = ERR_NONE;

  if (NULL != pParams)
  {
    if (IsOrgLenValid(orgLen,pParams))
    {
      printf("\n # PARAMETERS\n");
      printf("    * Scrambling : ");
      printf("%s",SCR_TYPE_STR(pParams->scrPar.type));
      printf(" | Ncells = %u\n",pParams->scrPar.nCells);

      printf("    * Reed-Solomon coding : ");
      printf("m = %u",pParams->rsPar.m);
      printf(" | n = %u",pParams->rsPar.nSh);
      printf(" | k = %u\n",pParams->rsPar.kSh);

      printf("    * Interleaving : ");
      printf("%s",INTRLV_TYPE_STR(pParams->itlvPar.type));
      if (INTRLV_BLOCK == pParams->itlvPar.type)
      {
        printf(" | Nrows = %u",pParams->itlvPar.rows);
        printf(" | Ncols = %u\n",pParams->itlvPar.cols);
      }
      else if (INTRLV_CONV == pParams->itlvPar.type)
      {
        printf(" | Ndelays = %u",pParams->itlvPar.dlys);
        printf(" | Ncells = %u\n",pParams->itlvPar.cells);
      }

      printf("    * Convolutional coding : ");
      printf("K = %u",pParams->ccPar.kLen);
      printf(" | Rc = %u/%u",pParams->ccPar.cRate,pParams->ccPar.cRate+1);
      printf(" | DM = %s\n",CC_VDM_STR(pParams->ccPar.vitDM));

      printf("    * Modulation : ");
      printf("%u-%s\n",pParams->modPar.order,MOD_TYPE_STR(pParams->modPar.type));

      printf("    * Channel : ");
      if (CHAN_BSC == pParams->chanPar.type)
      {
        printf("BSC | Peb = %1.1e\n",pParams->chanPar.Peb);
      }
      else if (CHAN_AWGN == pParams->chanPar.type)
      {
        printf("AWGN | EbN0 = %1.1f\n",pParams->chanPar.EbN0);
      }

      printf("\n");
    }
    else
    {
      retErr = ERR_INV_ORIG_LEN;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
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
  Debug_SetWatermark((void *)Debug_CheckWrongBits,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  const ulen_t bitLen = BY2BI_LEN(inStreamA->len);
  ulen_t bitErrCnt = 0;
  ulen_t minErrDist = bitLen;
  ulen_t curErrDist = 0;
  ulen_t j;
  ulen_t byteIdx;
  uint8_t bitIdx;

  if (Memory_IsStreamValid(inStreamA,inStreamA->id) &&
      Memory_IsStreamValid(inStreamB,inStreamB->id) &&
      (NULL != pParams))
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
          case PID_RX_CNVCOD:
            printf(" * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\n\n",bitErrCnt,bitLen,minErrDist);
            break;

          case PID_RX_RSCOD:
            printf(" * Errors at reed-solomon encoding level: %u out of %u bits (MD = %u)\n\n",bitErrCnt,bitLen,minErrDist);
            break;

          case PID_RX_ORG:
            printf(" * Errors at source level: %u out of %u bits (MD = %u)\n\n",bitErrCnt,bitLen,minErrDist);
            break;

          case PID_RX_CRC:
            printf(" * CRC check: ");
            if (0 == bitErrCnt)
            {
              Debug_SetTerminalAppearance(COLOR_SUCCESS,STYLE_SUCCESS);
              printf("PASSED\n");
            }
            else
            {
              Debug_SetTerminalAppearance(COLOR_ERROR,STYLE_ERROR);
              printf("FAILED\n");
            }
            Debug_ResetTerminalAppearance();
            Debug_SetTerminalAppearance(COLOR_DEFAULT,STYLE_DEFAULT);
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
  Debug_SetWatermark((void *)Debug_WriteByteStreamToCsv,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  FILE * fid = NULL;
  ulen_t j;
  
  if (Memory_IsStreamValid(inStream,inStream->id))
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
  Debug_SetWatermark((void *)Debug_WriteComplexStreamToCsv,WM_LEVEL_1);

  error_t retErr = ERR_NONE;
  FILE * fid = NULL;
  ulen_t j;
  
  if (Memory_IsStreamValid(inStream,inStream->id))
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


/**
 * @brief <i> Function for setting watermark. </i>
 * 
 * @param[in] funcAddr memory address where function is stored
 * @param[in] level watermark level
 * 
 * @return error ID
 */
error_t Debug_SetWatermark( const void * funcAddr, const wm_level_t level )
{
  error_t retErr = ERR_NONE;
  uint8_t j;

  if (level <WM_LEVEL_NUM)
  {
    gWatermarks[level] = ((watermark_t)funcAddr)&WATERMARK_MASK;

    for (j=level+1; j<WM_LEVEL_NUM; j++)
    {
      gWatermarks[j] = 0;                                                             /** reset lower level watermarks */
    }
  }
  else
  {
    retErr = ERR_INV_WATERMARK_LEV;
  }

  return Error_HandleErr(retErr);
}


/**
 * @brief <i> Function for printing watermarks fo all levels. </i>
 * 
 * @return none
 */
void Debug_PrintWatermarks( void )
{
  uint8_t lev;

  for (lev=0; lev<WM_LEVEL_NUM; lev++)
  {
    printf("    - Watermark Lv.%u = %X\n",lev+1,(unsigned int)gWatermarks[lev]);
  }
}


/**
 * @brief <i> Function for setting terminal appearance. </i>
 * 
 * @param[in] color ANSI escape code for shell text color
 * @param[in] style ANSI escape code for shell text style
 * 
 * @return none
 */
void Debug_SetTerminalAppearance( ansi_text_color color, ansi_text_style style )
{
  if (bShAppChgEnabled)
  {
    printf("\033[%u;%um",color,style);
  }
}


/**
 * @brief <i> Function for resetting terminal appearance. </i>
 * 
 * @return none
 */
void Debug_ResetTerminalAppearance( void )
{
  if (bShAppChgEnabled)
  {
    printf("\033[%um",STYLE_RESET);
  }
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
  Debug_SetWatermark((void *)IsOrgLenValid,WM_LEVEL_2);

  bool bRet = false;
  const ulen_t orgLenBi = BY2BI_LEN(orgLenBy);
  const ulen_t rsLenBi = orgLenBi*dbgParams->rsPar.nSh/dbgParams->rsPar.kSh;              /** shortened reed-solomon encoded bit-length */
  const ulen_t ccLenBi = (rsLenBi/(dbgParams->ccPar.cRate)*(1+dbgParams->ccPar.cRate));   /** punctured convolutional encoded bit-length */

  if ((orgLenBy > 0) &&                                                                   /** - origin message length shall be positive */
      (0 == (orgLenBi%(dbgParams->rsPar.m*dbgParams->rsPar.kSh))) &&                      /** - reed-solomon encoder input stream bit-length shall be divisible by GF dimension times message size */
      (0 == (rsLenBi%dbgParams->ccPar.cRate)) &&                                          /** - convolutional encoder input stream bit-length shall be divisible by code rate denominator */
      (0 == (ccLenBi%NUM_BITS_PER_BYTE)) &&                                               /** - convolutional punctured bit length shall be a multiple of NUM_BITS_PER_BYTE */
      (0 == (ccLenBi%dbgParams->modPar.bps)))                                             /** - convolutional punctured bit length shall be a multiple of MOD_BPS */
  {
    bRet = true;
  }

  return bRet;
}
