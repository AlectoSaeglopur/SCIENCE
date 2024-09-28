
/**
 * @file main.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
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
#include "reed_solomon.h"
#include "scrambling.h"



/******************/
/*** PARAMETERS ***/
/******************/

#define LEN_ORG_BY          188u                                            //!< origin stream length [B]



/*****************/
/*** CONSTANTS ***/
/*****************/

// stream lengths
#define LEN_CRC_BY          BI2BY_LEN(CRC_DEGREE)                           //!< crc stream length [B]
#define LEN_SRC_BY          LEN_ORG_BY                                      //!< scrambled stream length [B]
#define LEN_RS_BY           (LEN_SRC_BY*CODEWORD_SIZE/MESSAGE_SIZE)         //!< reed-solomon coded stream length [B]
#define LEN_CC_UNP_BY       (CC_NBRANCHES*LEN_RS_BY)                        //!< unpunctured convolutional coded stream length [B]
#define LEN_CC_PUN_BY       (LEN_CC_UNP_BY/CC_NBRANCHES* \
                              (CC_RATE+1)/CC_RATE)                          //!< punctured convolutional coded stream length [B]
#define LEN_CC_PUN_BI       BY2BI_LEN(LEN_CC_PUN_BY)                        //!< punctured convolutional coded stream length [b]
#define LEN_MOD_SY          (LEN_CC_PUN_BI/MOD_BPS)                         //!< modulated symbol stream length [Sy]
#define LEN_LLR_FL          LEN_CC_PUN_BI

// list of streams (name, type, length)
#define LIST_OF_STREAMS(ENTRY)               \
  ENTRY( txOrg,   byte,     LEN_ORG_BY     ) \
  ENTRY( rxOrg,   byte,     LEN_ORG_BY     ) \
  ENTRY( txCrc,   byte,     LEN_CRC_BY     ) \
  ENTRY( rxCrc,   byte,     LEN_CRC_BY     ) \
  ENTRY( txScr,   byte,     LEN_SRC_BY     ) \
  ENTRY( rxScr,   byte,     LEN_SRC_BY     ) \
  ENTRY( txRs,    byte,     LEN_RS_BY      ) \
  ENTRY( rxRs,    byte,     LEN_RS_BY      ) \
  ENTRY( txCc,    byte,     LEN_CC_PUN_BY  ) \
  ENTRY( rxCc,    byte,     LEN_CC_PUN_BY  ) \
  ENTRY( txMod,   complex,  LEN_MOD_SY     ) \
  ENTRY( rxMod,   complex,  LEN_MOD_SY     ) \
  ENTRY( rxLLR,   float,    LEN_LLR_FL     )

#define DEF_STREAM_DECLARE(name,type,...) type##_stream_t name##Stream = {.pBuf = NULL, .len = 0, .id = memory_type_##type};
#define DEF_STREAM_ALLOCATE(name,type,length) Memory_AllocateStream(&name##Stream,length,name##Stream.id);
#define DEF_STREAM_FREE(name,type,...) Memory_FreeStream(&name##Stream,memory_type_##type);

// list of parameters (name, module)
#define LIST_OF_PARAMETERS(ENTRY)   \
  ENTRY( crc,   Crc               ) \
  ENTRY( scr,   Scramb            ) \
  ENTRY( rs,    RsCod             ) \
  ENTRY( cc,    CnvCod            ) \
  ENTRY( mod,   Modulation        ) \
  ENTRY( chan,  Channel           )

#define DEF_PARAMETER_DECLARE(name,...) static name##_par_t name##Param;
#define DEF_PARAMETER_INITIALIZE(name,module) module##_ListParameters(&name##Param);



/************************/
/*** GLOBAL VARIABLES ***/
/************************/

LIST_OF_PARAMETERS(DEF_PARAMETER_DECLARE);                                  /** - declare all parameter structures */
static debug_par_t dgbParam;                                                /** - declare debug parameter structure */
static clock_t elapsedTime;



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
  LIST_OF_PARAMETERS(DEF_PARAMETER_INITIALIZE);                             /** - initialize all parameter structures */
  Debug_ListParameters(&dgbParam,&scrParam,&rsParam,&ccParam,
    &modParam,&chanParam);                                                  /** - list debug parameters */
  Debug_PrintParameters(LEN_ORG_BY,&dgbParam);                              /** - verify validity of origin stream length */

  // 2. PROCESSING
  Debug_GenerateRandomBytes(&txOrgStream,NULL);                             /** - fill tx origin buffer with random bytes */
  Crc_CalculateChecksum(&txOrgStream,&txCrcStream,&crcParam);               /** - calculate tx crc */
  Scramb_Scrambler(&txOrgStream,&txScrStream,&scrParam);                    /** - scrambler */
  RcCod_Encoder(&txScrStream,&txRsStream,&rsParam);                         /** - reed-solomon encoder */
  CnvCod_Encoder(&txRsStream,&txCcStream,&ccParam);                         /** - convolutional encoder */
  if (CHAN_BSC == chanParam.type)
  {
    Channel_BSC(&txCcStream,&rxCcStream,&chanParam);                        /** - apply bsc channel corruption */
    CnvCod_HardDecoder(&rxCcStream,&rxRsStream,&ccParam);                   /** - convolutional hard-decoder */
  }
  else if (CHAN_AWGN == chanParam.type)
  {
    Modulation_Mapper(&txCcStream,&txModStream,&modParam);                  /** - modulation mapper */
    Channel_AWGN(&txModStream,&rxModStream,&chanParam);                     /** - apply awgn channel corruption */
    if (CC_VITDM_HARD == ccParam.vitDM)
    {
      Modulation_HardDemapper(&rxModStream,&rxCcStream,&modParam);          /** - modulation hard-demapper */
      CnvCod_HardDecoder(&rxCcStream,&rxRsStream,&ccParam);                 /** - convolutional hard-decoder */
    }
    else if (CC_VITDM_SOFT == ccParam.vitDM)
    {
      Modulation_SoftDemapper(&rxModStream,&rxLLRStream,&modParam);         /** - modulation soft-demapper */
      CnvCod_SoftDecoder(&rxLLRStream,&rxRsStream,&ccParam);                /** - convolutional soft-decoder */
    }
  }
  RcCod_Decoder(&rxRsStream,&rxScrStream,&rsParam);                         /** - reed-solomon decoder */
  Scramb_Descrambler(&rxScrStream,&rxOrgStream,&scrParam);                  /** - descrambler */
  Crc_CalculateChecksum(&rxOrgStream,&rxCrcStream,&crcParam);               /** - calculate rx crc */

  // 3. RESULTS
#ifdef DEBUG_TERMINAL
  Debug_PrintByteStream(&txOrgStream,PID_TX_ORG,&dgbParam);                 /** - print tx origin stream content */
  Debug_PrintByteStream(&txCrcStream,PID_TX_CRC,&dgbParam);                 /** - print tx crc stream content */
  Debug_PrintByteStream(&txScrStream,PID_TX_SCR,&dgbParam);                 /** - print tx scrambled stream content */
  Debug_PrintByteStream(&txRsStream,PID_TX_RSCOD,&dgbParam);                /** - print tx reed-solomon coded stream content */
  Debug_PrintByteStream(&txCcStream,PID_TX_CNVCOD,&dgbParam);               /** - print tx convolutional coded stream content */
  Debug_PrintComplexStream(&txModStream,PID_TX_MAP,&dgbParam);              /** - print tx modulated stream content */
  Debug_PrintComplexStream(&rxModStream,PID_RX_MAP,&dgbParam);              /** - print rx modulated stream content */
  Debug_PrintFloatStream(&rxLLRStream,PID_RX_LLR,&dgbParam);                /** - print rx LLR stream content */
  Debug_PrintByteStream(&rxCcStream,PID_RX_CNVCOD,&dgbParam);               /** - print rx convolutional coded stream content */
  Debug_PrintByteStream(&rxRsStream,PID_RX_RSCOD,&dgbParam);                /** - print rx reed-solomon coded stream content */
  Debug_PrintByteStream(&rxScrStream,PID_RX_SCR,&dgbParam);                 /** - print rx scrambled stream content */
  Debug_PrintByteStream(&rxOrgStream,PID_RX_ORG,&dgbParam);                 /** - print rx origin stream content */
  Debug_PrintByteStream(&rxCrcStream,PID_RX_CRC,&dgbParam);                 /** - print rx crc stream content */
#endif
  Debug_CheckWrongBits(&txCcStream,&rxCcStream,PID_RX_CNVCOD,&dgbParam);    /** - check number of corrupted bits at convolutional coding level */
  Debug_CheckWrongBits(&txRsStream,&rxRsStream,PID_RX_RSCOD,&dgbParam);     /** - check number of corrupted bits at convolutional coding level */
  Debug_CheckWrongBits(&txOrgStream,&rxOrgStream,PID_RX_ORG,&dgbParam);     /** - check number of corrupted bits at origin level */
  Debug_CheckWrongBits(&txCrcStream,&rxCrcStream,PID_RX_CRC,&dgbParam);     /** - check crc correctness */

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

// fai debug con VSC anche se usando makefile!
// abilita -g / cambia default console in git bash
// doppio file launch e tasks .json
// F5 to start debug
// need to recompile if any change has been made on source files before startin debug!
// keep optimization disabled while debugging!

// add RS and interleaving parameters in debug print!!!! 
// add doxygen detailed description for more complex functions! (instead of simply @brief)
// usa "Memory_IsStreamValid" in giro
// solve compilation warning related to watermarks
// add references for libraries
// add watermarks everywhere (?)
// generate .elf file and find out how this may come in handy!
// try to add watermark mechanism to know which function caused an error! >> or try to debug using GDB
// try to add linker file
// stampa in .log anche messagi di shell (e.g eventuali errori!)
// add CC with rate lower than 1/2 (e.g 1/3!) >> prova mettendo in cascata più encorer da 1/2! (fai simulazione in python e vedi se performance sono effettivamente migliori!)
// aggiungi interleaver
// sistema Makefile (print, utest, etc..)
// sistema makefile in modo che non sia obbligatorio cancellare ogni volta cartella di build (solo se esplicitato in comando), così più veloce a ricompilare!
// aggiungi comando di solo target exe in makefile
// write instruction about how to clean/compile/run
// lancia doxygen da shell: https://www.doxygen.nl/manual/doxygen_usage.html
