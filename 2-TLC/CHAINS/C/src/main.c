/**
 * @file main.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @see Digital communications - Fundamentals and applications (Bernard Sklar, 2014)
 * @ingroup TLC_CHAIN
 * @addtogroup TLC_CHAIN
 * @brief Main file
 * 
 * File for running DVB-S simulation containing:
 * -# random info bytes generation
 * -# scrambling
 * -# reed-solomon coding
 * -# interleaving
 * -# convolutional coding
 * -# phase modulation (mapper + srrc filtering)
 * -# channel corruption
 * 
 * Main library containing all DVB-S telecommunication chain functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "channel.h"
#include "convolutional.h"
#include "crc.h"
#include "debug.h"
#include "error.h"
#include "interleaving.h"
#include "memory.h"
#include "modulation.h"
#include "reed_solomon.h"
#include "scrambling.h"



/******************/
/*** PARAMETERS ***/
/******************/

#define LEN_ORG_BY          376u                                                //!< origin stream length [B]



/*****************/
/*** CONSTANTS ***/
/*****************/

// stream lengths
#define LEN_CRC_BY          BI2BY_LEN(CRC_DEGREE)                               //!< crc stream length [B]
#define LEN_SRC_BY          LEN_ORG_BY                                          //!< scrambled stream length [B]
#define LEN_RS_BY           (LEN_SRC_BY*CODEWORD_SIZE/MESSAGE_SIZE)             //!< reed-solomon coded stream length [B]
#define LEN_CC_UNP_BY       (CC_NBRANCHES*LEN_RS_BY)                            //!< unpunctured convolutional coded stream length [B]
#define LEN_CC_PUN_BY       (LEN_CC_UNP_BY/CC_NBRANCHES* \
                              (CC_RATE+1)/CC_RATE)                              //!< punctured convolutional coded stream length [B]
#define LEN_CC_PUN_BI       BY2BI_LEN(LEN_CC_PUN_BY)                            //!< punctured convolutional coded stream length [b]
#define LEN_MOD_SY          (LEN_CC_PUN_BI/MOD_BPS)                             //!< modulated symbol stream length [Sy]
#define LEN_LLR_FL          LEN_CC_PUN_BI

// list of streams (name, type, length)
#define LIST_OF_STREAMS(ENTRY)               \
  ENTRY( txOrg,     byte,     LEN_ORG_BY     ) \
  ENTRY( rxOrg,     byte,     LEN_ORG_BY     ) \
  ENTRY( txCrc,     byte,     LEN_CRC_BY     ) \
  ENTRY( rxCrc,     byte,     LEN_CRC_BY     ) \
  ENTRY( txScr,     byte,     LEN_SRC_BY     ) \
  ENTRY( rxScr,     byte,     LEN_SRC_BY     ) \
  ENTRY( txRs,      byte,     LEN_RS_BY      ) \
  ENTRY( rxRs,      byte,     LEN_RS_BY      ) \
  ENTRY( txItlv,    byte,     LEN_RS_BY      ) \
  ENTRY( rxItlv,    byte,     LEN_RS_BY      ) \
  ENTRY( txCc,      byte,     LEN_CC_PUN_BY  ) \
  ENTRY( rxCc,      byte,     LEN_CC_PUN_BY  ) \
  ENTRY( txMod,     complex,  LEN_MOD_SY     ) \
  ENTRY( rxMod,     complex,  LEN_MOD_SY     ) \
  ENTRY( rxLLR,     float,    LEN_LLR_FL     )

#define DEF_STREAM_DECLARE(name,type,...) type##_stream_t name##Stream = {.pBuf = NULL, .len = 0, .id = memory_type_##type};
#define DEF_STREAM_ALLOCATE(name,type,length) Memory_AllocateStream(&name##Stream,length,name##Stream.id);
#define DEF_STREAM_FREE(name,type,...) Memory_FreeStream(&name##Stream,memory_type_##type);

// list of parameters (name, module)
#define LIST_OF_PARAMETERS(ENTRY)   \
  ENTRY( crc,   Crc               ) \
  ENTRY( scr,   Scramb            ) \
  ENTRY( rs,    RsCod             ) \
  ENTRY( itlv,  Intrlv            ) \
  ENTRY( cc,    CnvCod            ) \
  ENTRY( mod,   Modulation        ) \
  ENTRY( chan,  Channel           )

#define DEF_PARAMETER_DECLARE(name,...) static name##_par_t name##Param;
#define DEF_PARAMETER_INITIALIZE(name,module) module##_ListParameters(&name##Param);



/************************/
/*** GLOBAL VARIABLES ***/
/************************/

LIST_OF_PARAMETERS(DEF_PARAMETER_DECLARE);                                      /** - declare all parameter structures */
static debug_par_t dgbParam;                                                    /** - declare debug parameter structure */
static clock_t elapsedTime;



/************/
/*** MAIN ***/
/************/

/**
 * @brief <i> Function for running main loop. </i>
 * 
 * @return error ID
 */
int main( void )
{
  // 1. INITIALIZATION
  Debug_SetTerminalAppearance(COLOR_DEFAULT,STYLE_DEFAULT);
  printf("\n >> Starting execution...\n");
  elapsedTime = clock();                                                        /** - get initial execution time */

  LIST_OF_STREAMS(DEF_STREAM_DECLARE);                                          /** - declare all streams */
  LIST_OF_STREAMS(DEF_STREAM_ALLOCATE);                                         /** - allocate memory for all streams */
  LIST_OF_PARAMETERS(DEF_PARAMETER_INITIALIZE);                                 /** - initialize all parameter structures */
  Debug_ListParameters(&dgbParam,&scrParam,&rsParam,&itlvParam,
    &ccParam,&modParam,&chanParam);                                             /** - list debug parameters */
  Debug_PrintParameters(LEN_ORG_BY,&dgbParam);                                  /** - verify validity of origin stream length */

  // 2. PROCESSING
  Debug_GenerateRandomBytes(&txOrgStream,NULL);                                 /** - fill tx origin buffer with random bytes */
  Crc_CalculateChecksum(&txOrgStream,&txCrcStream,&crcParam);                   /** - calculate tx crc */
  Scramb_Scrambler(&txOrgStream,&txScrStream,&scrParam);                        /** - scrambler */
  RcCod_Encoder(&txScrStream,&txRsStream,&rsParam);                             /** - reed-solomon encoder */
  Intrlv_Interleaver(&txRsStream,&txItlvStream,&itlvParam);                     /** - interleaver */
  CnvCod_Encoder(&txItlvStream,&txCcStream,&ccParam);                           /** - convolutional encoder */
  if (CHAN_BSC == chanParam.type)
  {
    Channel_BSC(&txCcStream,&rxCcStream,&chanParam);                            /** - apply bsc channel corruption */
    CnvCod_HardDecoder(&rxCcStream,&rxItlvStream,&ccParam);                     /** - convolutional hard-decoder */
  }
  else if (CHAN_AWGN == chanParam.type)
  {
    Modulation_Mapper(&txCcStream,&txModStream,&modParam);                      /** - modulation mapper */
    Channel_AWGN(&txModStream,&rxModStream,&chanParam);                         /** - apply awgn channel corruption */
    if (CC_VITDM_HARD == ccParam.vitDM)
    {
      Modulation_HardDemapper(&rxModStream,&rxCcStream,&modParam);              /** - modulation hard-demapper */
      CnvCod_HardDecoder(&rxCcStream,&rxItlvStream,&ccParam);                   /** - convolutional hard-decoder */
    }
    else if (CC_VITDM_SOFT == ccParam.vitDM)
    {
      Modulation_SoftDemapper(&rxModStream,&rxLLRStream,&modParam);             /** - modulation soft-demapper */
      CnvCod_SoftDecoder(&rxLLRStream,&rxItlvStream,&ccParam);                  /** - convolutional soft-decoder */
    }
  }
  Intrlv_Deinterleaver(&rxItlvStream,&rxRsStream,&itlvParam);                   /** - deinterleaver */
  RcCod_Decoder(&rxRsStream,&rxScrStream,&rsParam);                             /** - reed-solomon decoder */
  Scramb_Descrambler(&rxScrStream,&rxOrgStream,&scrParam);                      /** - descrambler */
  Crc_CalculateChecksum(&rxOrgStream,&rxCrcStream,&crcParam);                   /** - calculate rx crc */

  // 3. RESULTS
#ifdef VERBOSE
  Debug_PrintByteStream(&txOrgStream,PID_TX_ORG,&dgbParam);                     /** - print tx origin stream content */
  Debug_PrintByteStream(&txCrcStream,PID_TX_CRC,&dgbParam);                     /** - print tx crc stream content */
  Debug_PrintByteStream(&txScrStream,PID_TX_SCR,&dgbParam);                     /** - print tx scrambled stream content */
  Debug_PrintByteStream(&txRsStream,PID_TX_RSCOD,&dgbParam);                    /** - print tx reed-solomon coded stream content */
  Debug_PrintByteStream(&txItlvStream,PID_TX_INTLV,&dgbParam);                  /** - print tx interleaved stream content */
  Debug_PrintByteStream(&txCcStream,PID_TX_CNVCOD,&dgbParam);                   /** - print tx convolutional coded stream content */
  Debug_PrintComplexStream(&txModStream,PID_TX_MAP,&dgbParam);                  /** - print tx modulated stream content */
  Debug_PrintComplexStream(&rxModStream,PID_RX_MAP,&dgbParam);                  /** - print rx modulated stream content */
  Debug_PrintFloatStream(&rxLLRStream,PID_RX_LLR,&dgbParam);                    /** - print rx LLR stream content */
  Debug_PrintByteStream(&rxCcStream,PID_RX_CNVCOD,&dgbParam);                   /** - print rx convolutional coded stream content */
  Debug_PrintByteStream(&txItlvStream,PID_RX_INTLV,&dgbParam);                  /** - print rx interleaved stream content */
  Debug_PrintByteStream(&rxRsStream,PID_RX_RSCOD,&dgbParam);                    /** - print rx reed-solomon coded stream content */
  Debug_PrintByteStream(&rxScrStream,PID_RX_SCR,&dgbParam);                     /** - print rx scrambled stream content */
  Debug_PrintByteStream(&rxOrgStream,PID_RX_ORG,&dgbParam);                     /** - print rx origin stream content */
  Debug_PrintByteStream(&rxCrcStream,PID_RX_CRC,&dgbParam);                     /** - print rx crc stream content */
#endif
  Debug_CheckWrongBits(&txCcStream,&rxCcStream,PID_RX_CNVCOD,&dgbParam,NULL);   /** - check number of corrupted bits at convolutional coding level */
  Debug_CheckWrongBits(&txRsStream,&rxRsStream,PID_RX_RSCOD,&dgbParam,NULL);    /** - check number of corrupted bits at convolutional coding level */
  Debug_CheckWrongBits(&txOrgStream,&rxOrgStream,PID_RX_ORG,&dgbParam,NULL);    /** - check number of corrupted bits at origin level */
  Debug_CheckWrongBits(&txCrcStream,&rxCrcStream,PID_RX_CRC,&dgbParam,NULL);    /** - check crc correctness */

#ifdef DEBUG_CSV
  Debug_WriteByteStreamToCsv(&txOrgStream,PID_TX_ORG);                          /** - write tx source buffer content into csv file */
  Debug_WriteComplexStreamToCsv(&txModStream,PID_TX_MAP);
#endif

  // 4. FINALIZATION
  LIST_OF_STREAMS(DEF_STREAM_FREE);                                             /** - free memory for all streams */

  elapsedTime = clock()-elapsedTime;                                            /** - get final execution time and estimate overall execution time */
  printf("\n >> Execution completed successfully in %1.3f seconds!\n\n",
    ((float)elapsedTime)/CLOCKS_PER_SEC);
  Debug_ResetTerminalAppearance();

  return 0;
}
