
/**
 * @file main.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Main file
 * 
 * File for running DVB-S simulation containing:
 * 1. random info bytes generation;
 * 2. convolutional coding.
 * 
 * @addtogroup TLC_CHAIN
 * 
 * Main library containing all DVB-S telecommunication chain functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "channel.h"                                                        /** - import channel library */
#include "convolutional.h"                                                  /** - import convolutional coding library */
#include "debug.h"                                                          /** - import debug library */
#include "error.h"                                                          /** - import error library */
#include "memory.h"                                                         /** - import memory library */
#include "modulation.h"                                                     /** - import modulation library */



/******************/
/*** PARAMETERS ***/
/******************/

#define LEN_SRC_BY          150u                                            //!< source info stream length [B] (NB: Max = 1000)



/*****************/
/*** CONSTANTS ***/
/*****************/

#define LEN_CC_UNP_BY       (CC_NBRANCHES*LEN_SRC_BY)                       //!< unpunctured convolutional coded stream length [B]
#define LEN_CC_PUN_BY       (LEN_CC_UNP_BY/CC_NBRANCHES* \
                              (CC_RATE+1)/CC_RATE)                          //!< punctured convolutional coded stream length [B]
#define LEN_CC_PUN_BI       (LEN_CC_PUN_BY<<BY2BI_SHIFT)                    //!< punctured convolutional coded stream length [b]
#define LEN_MOD_SY          (LEN_CC_PUN_BI/MOD_BPS)                         //!< modulated symbol stream length [Sy]
#define LEN_LLR_FL          LEN_CC_PUN_BI

#define DEF_STREAM_DECLARE(name,type,length) type##_stream_t name##Stream = {.pBuf = NULL, .len = 0, .id = memory_type_##type};
#define DEF_STREAM_ALLOCATE(name,type,length) Memory_AllocateStream(&name##Stream,length,name##Stream.id);
#define DEF_STREAM_FREE(name,type,length) Memory_FreeStream(&name##Stream,memory_type_##type);



/*****************/
/*** VARIABLES ***/
/*****************/

static cc_par_t ccParams;
static mod_par_t modParams;
static chan_par_t chanParams;
static debug_par_t dgbParams;

// list of streams (name, type, length)
#define LIST_OF_STREAMS(ENTRY)           \
  ENTRY( txSrc, byte,    LEN_SRC_BY    ) \
  ENTRY( rxSrc, byte,    LEN_SRC_BY    ) \
  ENTRY( txCc,  byte,    LEN_CC_PUN_BY ) \
  ENTRY( rxCc,  byte,    LEN_CC_PUN_BY ) \
  ENTRY( txMod, complex, LEN_MOD_SY    ) \
  ENTRY( rxMod, complex, LEN_MOD_SY    ) \
  ENTRY( rxLLR, float,   LEN_LLR_FL    )



/************/
/*** MAIN ***/
/************/

int main( void )
{
  // 1. INITIALIZATION
  printf("\n >> Starting execution...\n");

  LIST_OF_STREAMS(DEF_STREAM_DECLARE);                                      /** -# declare all streams */
  LIST_OF_STREAMS(DEF_STREAM_ALLOCATE);                                     /** -# allocate memory for all streams */

  // 2. PROCESSING
  CnvCod_ListParameters(&ccParams);                                         /** -# list convolutional coding parameters */
  Channel_ListParameters(&chanParams);                                      /** -# list channel parameters */
  Modulation_ListParameters(&modParams);                                    /** -# list modulation parameters */

  Debug_GenerateRandomBytes(&txSrcStream,NULL);                             /** -# fill tx source buffer with random bytes */
  CnvCod_Encoder(&txSrcStream,&txCcStream,&ccParams);                       /** -# convolutional encoder */
  if (CHAN_BSC == chanParams.type)
  {
    Channel_BSC(&txCcStream,&rxCcStream,&chanParams);                       /** -# apply bsc channel corruption */
    CnvCod_HardDecoder(&rxCcStream,&rxSrcStream,&ccParams);                 /** -# convolutional hard-decoder */
  }
  else if (CHAN_AWGN == chanParams.type)
  {
    Modulation_Mapper(&txCcStream,&txModStream,&modParams);                 /** -# modulation mapper */
    Channel_AWGN(&txModStream,&rxModStream,&chanParams);                    /** -# apply awgn channel corruption */
    if (CC_VITDM_HARD == ccParams.vitDM)
    {
      Modulation_HardDemapper(&rxModStream,&rxCcStream,&modParams);         /** -# modulation hard-demapper */
      CnvCod_HardDecoder(&rxCcStream,&rxSrcStream,&ccParams);               /** -# convolutional hard-decoder */
    }
    else if (CC_VITDM_SOFT == ccParams.vitDM)
    {
      Modulation_SoftDemapper(&rxModStream,&rxLLRStream,&modParams);        /** -# modulation soft-demapper */
      CnvCod_SoftDecoder(&rxLLRStream,&rxSrcStream,&ccParams);              /** -# convolutional soft-decoder */
    }
  }

  // 3. RESULTS
  Debug_PrintParameters(LEN_SRC_BY);
  Debug_ListParameters(&dgbParams,&ccParams,&modParams,&chanParams);
#ifdef DEBUG_TERMINAL
  Debug_PrintByteStream(&txSrcStream,PID_TX_SRC,&dgbParams);                /** -# print tx source buffer content */
  Debug_PrintByteStream(&txCcStream,PID_TX_CNVCOD,&dgbParams);              /** -# print tx convolutional coded buffer content */
  Debug_PrintComplexStream(&txModStream,PID_TX_MAP,&dgbParams);             /** -# print tx modulated buffer content */
  Debug_PrintComplexStream(&rxModStream,PID_RX_MAP,&dgbParams);             /** -# print rx modulated buffer content */
  Debug_PrintFloatStream(&rxLLRStream,PID_RX_LLR,&dgbParams);               /** -# print rx LLR buffer content */
  Debug_PrintByteStream(&rxCcStream,PID_RX_CNVCOD,&dgbParams);              /** -# print rx convolutional coded buffer content */
  Debug_PrintByteStream(&rxSrcStream,PID_RX_CNVCOD,&dgbParams);             /** -# print rx source buffer content */
#endif
  Debug_CheckWrongBits(&txCcStream,&rxCcStream,PID_RX_CNVCOD,&dgbParams);   /** -# check number of corrupted bits at convolutional coding level */
  Debug_CheckWrongBits(&txSrcStream,&rxSrcStream,PID_RX_SRC,&dgbParams);    /** -# check number of corrupted bits at source level */

#ifdef DEBUG_CSV
  Debug_WriteByteStreamToCsv(&txSrcStream,PID_TX_SRC);                      /** -# write tx source buffer content into csv file */
  Debug_WriteComplexStreamToCsv(&txModStream,PID_TX_MAP);
#endif

  // 4. FINALIZATION
  LIST_OF_STREAMS(DEF_STREAM_FREE);                                         /** -# free memory for all streams */
  printf(" >> Execution completed successfully!\n");

  return 0;
}



/*************/
/*** NOTES ***/
/*************/

/*
 * 1. To run the project, use the following command :
 *    cls && make target
 */



// MOD: non usare macro globali ma info di pParams!!
// MOD: add header for all functions
// MOD: add checks on parameters validity

// test add doxygen generation

// add CC with rate lower than 1/2 (e.g 1/3!)
// add checks on parameters
// aggiungi check a LEN_SRC anche rispetto a ordine di modulazione!
// sistema Makefile (print, utest, etc..)

// sposta "CnvCod_GetConnectorPuncturationVectors" dentro encoder/decoder e rendila statica
// aggiungi ".vscode" a .gitignore
// aggiungi interleaver + RS + scrambler
// rendi funzioni sempre operanti su parametri passati come argomenti, non su macro globali!!!
// sistema print di parametri (una riga per tipo) e aggiungi parametri di canale
// prova CC_STR tramite XMACRO!
// crea BY2BI_SHIFT e BI2BY_SHIFT come macro functions! (>> inside!)
// spostare i 2 printf di inizio e fine esecuzione da qui a Makefile
// sistema cmake in modo che non sia obbligatorio cancellare ogni volta cartella di build (solo se esplicitato in comando), così più veloce a ricompilare!







/**
 * @brief Function for checking the parameters correctness.
 * @return none
 */
//void CheckParam( void ){
//	if( (K < 3) || (K>8) ){
//		printf("\n Error-CC : Invalid constrain length!\n");
//		exit(1);
//	} else if ( (Rc != RATE_12) && (Rc != RATE_23) && (Rc != RATE_34) && (Rc != RATE_56) && (Rc != RATE_78) ){
//		printf("\n Error-CC : Invalid code rate!\n");
//		exit(1);
//	} else if ( (SrcBytLen < 1) || (SrcBytLen%Rc != 0) ){
//		printf("\n Error-CC : Invalid info stream length\n");
//		exit(1);
//	} else if ( (VitDecMth != HARD) && (VitDecMth != SOFT) ){
//		printf("\n Error-CC : Invalid decoding method!\n");
//		exit(1);
//	} else if ( (ModType != PSK) && (ModType != QAM) ){
//		printf("\n Error-MOD : Invalid modulation type!\n");
//		exit(1);
//	} else if ( (ModType == PSK) && (log2(M) != round(log2(M))) ){
//		printf("\n Error-MOD : Invalid modulation order!\n");
//		exit(1);
//	} else if ( (ModType == QAM) && ((log2(M) != round(log2(M))) || (L % 2)) ){
//		printf("\n Error-MOD : Invalid modulation order!\n");
//		exit(1);
//	} else if ( PunBitLen % L ){
//		printf("\n Error-MOD : Invalid info stream length\n");
//		exit(1);
//	}
//}
