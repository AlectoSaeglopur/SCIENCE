
/**
 * @file main.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Main file
 * 
 * File for running DVB-S simulation containing:
 * -# random info bytes generation;
 * -# scrambling;
 * -# reed-solomon coding;
 * -# interleaving;
 * -# convolutional coding;
 * -# phase modulation (mapper + srrc filtering);
 * -# channel corruption.
 * 
 * @addtogroup TLC_CHAIN
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
#include "memory.h"
#include "modulation.h"
#include "scrambling.h"



/******************/
/*** PARAMETERS ***/
/******************/

#define LEN_ORG_BY          150u                                            //!< origin stream length [B]



/*****************/
/*** CONSTANTS ***/
/*****************/

#define LEN_CRC_BY          BI2BY_LEN(CRC_DEGREE)                           //!< CRC stream length [B]
#define LEN_CC_UNP_BY       (CC_NBRANCHES*LEN_ORG_BY)                       //!< unpunctured convolutional coded stream length [B]
#define LEN_CC_PUN_BY       (LEN_CC_UNP_BY/CC_NBRANCHES* \
                              (CC_RATE+1)/CC_RATE)                          //!< punctured convolutional coded stream length [B]
#define LEN_CC_PUN_BI       BY2BI_LEN(LEN_CC_PUN_BY)                        //!< punctured convolutional coded stream length [b]
#define LEN_MOD_SY          (LEN_CC_PUN_BI/MOD_BPS)                         //!< modulated symbol stream length [Sy]
#define LEN_LLR_FL          LEN_CC_PUN_BI

#define DEF_STREAM_DECLARE(name,type,length) type##_stream_t name##Stream = {.pBuf = NULL, .len = 0, .id = memory_type_##type};
#define DEF_STREAM_ALLOCATE(name,type,length) Memory_AllocateStream(&name##Stream,length,name##Stream.id);
#define DEF_STREAM_FREE(name,type,length) Memory_FreeStream(&name##Stream,memory_type_##type);



/*****************/
/*** VARIABLES ***/
/*****************/

static clock_t elapsedTime;
static crc_par_t crcParams;
static scramb_par_t scrParams;
static cc_par_t ccParams;
static mod_par_t modParams;
static chan_par_t chanParams;
static debug_par_t dgbParams;

// list of streams (name, type, length)
#define LIST_OF_STREAMS(ENTRY)            \
  ENTRY( txOrg, byte,    LEN_ORG_BY     ) \
  ENTRY( rxOrg, byte,    LEN_ORG_BY     ) \
  ENTRY( txCrc, byte,    LEN_CRC_BY     ) \
  ENTRY( rxCrc, byte,    LEN_CRC_BY     ) \
  ENTRY( txScr, byte,    LEN_ORG_BY     ) \
  ENTRY( rxScr, byte,    LEN_ORG_BY     ) \
  ENTRY( txCc,  byte,    LEN_CC_PUN_BY  ) \
  ENTRY( rxCc,  byte,    LEN_CC_PUN_BY  ) \
  ENTRY( txMod, complex, LEN_MOD_SY     ) \
  ENTRY( rxMod, complex, LEN_MOD_SY     ) \
  ENTRY( rxLLR, float,   LEN_LLR_FL     )



/************/
/*** MAIN ***/
/************/

int main( void )
{
  // 1. INITIALIZATION
  printf("\n >> Starting execution...\n");
  elapsedTime = clock();                                                    /** - get initial execution time */
  LIST_OF_STREAMS(DEF_STREAM_DECLARE);                                      /** - declare all streams */
  LIST_OF_STREAMS(DEF_STREAM_ALLOCATE);                                     /** - allocate memory for all streams */

  // 2. PROCESSING
  Crc_ListParameters(&crcParams);                                           /** - list crc parameters */
  Scramb_ListParameters(&scrParams);                                        /** - list convolutional coding parameters */
  CnvCod_ListParameters(&ccParams);                                         /** - list convolutional coding parameters */
  Channel_ListParameters(&chanParams);                                      /** - list channel parameters */
  Modulation_ListParameters(&modParams);                                    /** - list modulation parameters */

  Debug_GenerateRandomBytes(&txOrgStream,NULL);                             /** - fill tx origin buffer with random bytes */
  Crc_CalculateChecksum(&txOrgStream,&txCrcStream,&crcParams);              /** - calculate tx crc */
  Scramb_Scrambler(&txOrgStream,&txScrStream,&scrParams);                   /** - scrambler */
  CnvCod_Encoder(&txScrStream,&txCcStream,&ccParams);                       /** - convolutional encoder */
  if (CHAN_BSC == chanParams.type)
  {
    Channel_BSC(&txCcStream,&rxCcStream,&chanParams);                       /** - apply bsc channel corruption */
    CnvCod_HardDecoder(&rxCcStream,&rxScrStream,&ccParams);                 /** - convolutional hard-decoder */
  }
  else if (CHAN_AWGN == chanParams.type)
  {
    Modulation_Mapper(&txCcStream,&txModStream,&modParams);                 /** - modulation mapper */
    Channel_AWGN(&txModStream,&rxModStream,&chanParams);                    /** - apply awgn channel corruption */
    if (CC_VITDM_HARD == ccParams.vitDM)
    {
      Modulation_HardDemapper(&rxModStream,&rxCcStream,&modParams);         /** - modulation hard-demapper */
      CnvCod_HardDecoder(&rxCcStream,&rxScrStream,&ccParams);               /** - convolutional hard-decoder */
    }
    else if (CC_VITDM_SOFT == ccParams.vitDM)
    {
      Modulation_SoftDemapper(&rxModStream,&rxLLRStream,&modParams);        /** - modulation soft-demapper */
      CnvCod_SoftDecoder(&rxLLRStream,&rxScrStream,&ccParams);              /** - convolutional soft-decoder */
    }
  }
  Scramb_Descrambler(&rxScrStream,&rxOrgStream,&scrParams);                 /** - descrambler */
  Crc_CalculateChecksum(&rxOrgStream,&rxCrcStream,&crcParams);              /** - calculate rx crc */

  // 3. RESULTS
  Debug_ListParameters(&dgbParams,&ccParams,&modParams,
                        &chanParams,&scrParams);
  Debug_PrintParameters(LEN_ORG_BY,&dgbParams);
  
#ifdef DEBUG_TERMINAL
  Debug_PrintByteStream(&txOrgStream,PID_TX_ORG,&dgbParams);                /** - print tx origin stream content */
  Debug_PrintByteStream(&txCrcStream,PID_TX_CRC,&dgbParams);                /** - print tx crc stream content */
  Debug_PrintByteStream(&txScrStream,PID_TX_SCR,&dgbParams);                /** - print tx scrambled stream content */
  Debug_PrintByteStream(&txCcStream,PID_TX_CNVCOD,&dgbParams);              /** - print tx convolutional coded stream content */
  Debug_PrintComplexStream(&txModStream,PID_TX_MAP,&dgbParams);             /** - print tx modulated stream content */
  Debug_PrintComplexStream(&rxModStream,PID_RX_MAP,&dgbParams);             /** - print rx modulated stream content */
  Debug_PrintFloatStream(&rxLLRStream,PID_RX_LLR,&dgbParams);               /** - print rx LLR stream content */
  Debug_PrintByteStream(&rxCcStream,PID_RX_CNVCOD,&dgbParams);              /** - print rx convolutional coded stream content */
  Debug_PrintByteStream(&rxScrStream,PID_RX_SCR,&dgbParams);                /** - print rx scrambled stream content */
  Debug_PrintByteStream(&rxOrgStream,PID_RX_ORG,&dgbParams);                /** - print rx origin stream content */
  Debug_PrintByteStream(&rxCrcStream,PID_RX_CRC,&dgbParams);                /** - print rx crc stream content */
#endif
  Debug_CheckWrongBits(&txCcStream,&rxCcStream,PID_RX_CNVCOD,&dgbParams);   /** - check number of corrupted bits at convolutional coding level */
  Debug_CheckWrongBits(&txOrgStream,&rxOrgStream,PID_RX_ORG,&dgbParams);    /** - check number of corrupted bits at origin level */
  Debug_CheckWrongBits(&txCrcStream,&rxCrcStream,PID_RX_CRC,&dgbParams);    /** - check crc correctness */

#ifdef DEBUG_CSV
  Debug_WriteByteStreamToCsv(&txOrgStream,PID_TX_ORG);                      /** - write tx source buffer content into csv file */
  Debug_WriteComplexStreamToCsv(&txModStream,PID_TX_MAP);
#endif

  // 4. FINALIZATION
  LIST_OF_STREAMS(DEF_STREAM_FREE);                                         /** - free memory for all streams */
  elapsedTime = clock()-elapsedTime;                                        /** - get final execution time and estimate overall execution time */
  printf(" >> Execution completed successfully in %1.3f seconds!\n",
    ((float)elapsedTime)/CLOCKS_PER_SEC);

  return 0;
}



/*************/
/*** NOTES ***/
/*************/

// add CC with rate lower than 1/2 (e.g 1/3!) >> prova mettendo in cascata più encorer da 1/2! (fai simulazione in python e vedi se performance sono effettivamente migliori!)
// aggiungi RS + interleaver + RS
// sistema Makefile (print, utest, etc..)
// sistema makefile in modo che non sia obbligatorio cancellare ogni volta cartella di build (solo se esplicitato in comando), così più veloce a ricompilare!
// aggiungi comando di solo target exe in makefile
// write instruction about how to clean/compile/run
// esporta copia di print a shell durante compilazione into log file
// lancia doxygen da shell: https://www.doxygen.nl/manual/doxygen_usage.html
