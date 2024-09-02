
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

#define LEN_SRC_BY 100                                                      //!< source info stream length [B] (NB: Max value = 1000)



/*****************/
/*** CONSTANTS ***/
/*****************/

#define LEN_CC_UNP_BY     ((len_t) (CC_NBRANCHES*LEN_SRC_BY))               //!< unpunctured convolutional coded stream length [B]
#define LEN_CC_PUN_BY     ((len_t) (LEN_CC_UNP_BY/CC_NBRANCHES* \
                                    (CC_RATE+1)/CC_RATE))                   //!< punctured convolutional coded stream length [B]
#define LEN_MOD_SY        ((len_t) (LEN_CC_UNP_BY/MOD_BPS))                 //!< modulated symbol stream length [Sy]

#define DEF_STREAM_DECLARE(name,type,length) type##_stream_t name##Stream = {.pBuf = NULL, .len = 0, .id = memory_type_##type};
#define DEF_STREAM_ALLOCATE(name,type,length) Memory_AllocateStream(&name##Stream,length,name##Stream.id);
#define DEF_STREAM_FREE(name,type,length) Memory_FreeStream(&name##Stream,memory_type_##type);



/*****************/
/*** VARIABLES ***/
/*****************/

static cc_par_t ccParams;
static mod_par_t modParams;
static chan_par_t chanParams;

// list of streams (name, type, length)
#define LIST_OF_STREAMS(ENTRY)           \
  ENTRY( txSrc, byte,    LEN_SRC_BY    ) \
  ENTRY( rxSrc, byte,    LEN_SRC_BY    ) \
  ENTRY( txCc,  byte,    LEN_CC_UNP_BY ) \
  ENTRY( rxCc,  byte,    LEN_CC_PUN_BY ) \
  ENTRY( txMod, complex, LEN_MOD_SY    )



/************/
/*** MAIN ***/
/************/

int main( void )
{
  LIST_OF_STREAMS(DEF_STREAM_DECLARE);                                      /** -# declare all streams */
  LIST_OF_STREAMS(DEF_STREAM_ALLOCATE);                                     /** -# allocate memory for all streams */
  Debug_PrintParameters(LEN_SRC_BY);                                        /** -# print all simulation parameters */
  Debug_GenerateRandomBytes(&txSrcStream,NULL);                             /** -# fill tx source buffer with random bytes */
  Debug_PrintBytes(&txSrcStream,PID_TX_SRC);                                /** -# print tx source buffer content */
  CnvCod_ListParameters(&ccParams);                                         /** -# list convolutional coding parameters */
  CnvCod_Encoder(&txSrcStream,&txCcStream,&ccParams);                       /** -# convolutional encoding */
  Debug_PrintBytes(&txCcStream,PID_TX_CNVCOD);                              /** -# print tx convolutional coded buffer content */
  Channel_ListParameters(&chanParams);                                      /** -# list channel parameters */
  if (CHAN_BSC == CHAN_TYPE)
  {
    Channel_BSC(&txCcStream,&rxCcStream,&chanParams);                       /** -# apply bsc channel corruption */
  }
  else if (CHAN_AWGN == CHAN_TYPE)
  {
    Modulation_ListParameters(&modParams);                                  /** -# list modulation parameters */
    Modulation_Mapper(&txCcStream,&txModStream,&modParams);                 /** -# modulation mapper */
  }
  Debug_PrintBytes(&rxCcStream,PID_RX_CNVCOD);                              /** -# print rx convolutional coded buffer content */
  Debug_CheckWrongBits(&txCcStream,&rxCcStream,PID_RX_CNVCOD);              /** -# check number of corrupted bits at convolutional coding level */
  CnvCod_HardDecoder(&rxCcStream,&rxSrcStream,&ccParams);                   /** -# convolutional decoding */
  Debug_CheckWrongBits(&txSrcStream,&rxSrcStream,PID_RX_SRC);               /** -# check number of corrupted bits at source level */

  if (IS_CSV_ENABLED)
  {
    Debug_WriteBytesToCsv(&txSrcStream,PID_TX_SRC);                         /** -# write tx source buffer content into csv file */
  }
  LIST_OF_STREAMS(DEF_STREAM_FREE);                                         /** -# free memory for all streams */
  printf(" >> Execution completed successfully!\n");










//  phasemap ModTable;                                /** Constellation mapping table */
//  float SoftLLR[DepBitLen];                            /** RX soft LLR stream */
//  complex ChSym[SymLen];                              /** Complex modulated symbol stream passing through channel */
//
//  switch( ModType ){
//    case PSK:
//      GetPskTable(&ModTable);                          /** Get PSK constellation mapping table */
//      break;
//    case QAM:
//      GetQamTable(&ModTable);                          /** Get QAM constellation mapping table */
//      break;
//    default:
//      break;
//  }
//  Mapper(TxConvByt,ChSym,&ModTable);                        /** Map bits into modulated symbols */
//  // PrintSym(ChSym,SymLen,TXSYMB);                          /** Print TX symbol stream on terminal */
//  // WriteSymCsv(ChSym,SymLen,TXSYMB);                        /** Write TX symbol stream into .csv file */
//
//  ChanAWGN(ChSym);                                /** AWGN channel simulation */
//  // PrintSym(ChSym,SymLen,RXSYMB);                        /** Print RX symbol stream on terminal */
//  // WriteSymCsv(ChSym,SymLen,RXSYMB);                        /** Write RX symbol stream into .csv file */
//  GetTrellis(ConVect,&ConvDiagr);                          /** Get convolutional decoder trellis diagram */
//
//  if ( VitDecMth == HARD ){
//    HardDemapper(ChSym,DemByt,&ModTable);                    /** Hard demapping (symbol to bit conversion) */
//    CheckWrongBits(TxConvByt,DemByt,PunBytLen,PRID_RXCCB);              /** Check number of corrupted bits before convolutional decoding */
//    HardConvDecoder(DemByt,rxSrcBytes,&ConvDiagr,PunctVect);            /** Viterbi hard decoding */
//  } else if ( VitDecMth == SOFT ){  
//    SoftDemapper(ChSym,SoftLLR,&ModTable);                    /** Soft demapping (symbol to LLR conversion) */
//    SoftConvDecoder(SoftLLR,rxSrcBytes,&ConvDiagr,PunctVect);            /** Viterbi soft decoding */
//  }
//
//  PrintByt(rxSrcBytes,LEN_SRC_BY,PRID_RXINFOB);                      /** Print RX source info stream on terminal */
//  CheckWrongBits(tx_src_bytes,rxSrcBytes,LEN_SRC_BY,PRID_RXINFOB);              /** Check number of corrupted bits after convolutional decoding */

  return 0;
}



/*************/
/*** NOTES ***/
/*************/

/*
 * 1. To run the project, use the following command :
 *    cls && gcc -c extra.c convolutional.c modulation.c main.c && gcc extra.o convolutional.o modulation.o main.o -o asd && asd
 */



// MOD: non usare macro globali ma info di pParams!!
// MOD: add header for all functions
// MOD: add checks on parameters validity

// test add doxygen generation

// add CC with rate lower than 1/2 (e.g 1/3!)
// add checks on parameters
// aggiungi check a LEN_SRC anche rispetto a ordine di modulazione!
// sistema Makefile (print, utest, etc..)
// usa byte_buf_t per tutti array di byte (e stesso per complessi poi)

// alloca "txCcBytes" su PUN_LEN (non UNP_LEN) per risparmiare memoria (richiede aggiornamento in encoder!)
// alloca/free di tutti i buffer in un'unica funzione a inizio/fine esecuzione!
// sposta "CnvCod_GetConnectorPuncturationVectors" dentro encoder/decoder e rendila statica
// aggiungi ".vscode" a .gitignore
// aggiungi interleaver + RS + scrambler
// rendi funzioni sempre operanti su parametri passati come argomenti, non su macro globali!!!
// sistema print di parametri (una riga per tipo) e aggiungi parametri di canale
// prova CC_STR tramite XMACRO!
/// rimpiazza MATH_PI ovunque
