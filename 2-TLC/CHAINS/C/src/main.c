
/**
 * @file main.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Main file
 * 
 * File for simulation execution, containing:
 * 1. random info bytes generation;
 * 2. convolutional coding.
 * 
 * @addtogroup TLC_CHAIN
 * 
 * Main library containing all telecommunication chain functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "channel.h"                                      /** - import channel library */
#include "convolutional.h"                                /** - import convolutional coding library */
#include "debug.h"                                        /** - import debug library */
#include "error.h"                                        /** - import error library */
#include "memory.h"                                       /** - import memory library */
#include "modulation.h"                                   /** - import modulation library */



/******************/
/*** PARAMETERS ***/
/******************/

#define LEN_SRC_BY        ((len_t) 100)                           //!< source info stream length [B] (NB: Max value = 1000)
#define LEN_CC_UNP_BY     ((len_t) (CC_NBRANCHES*LEN_SRC_BY))     //!< unpunctured convolutional coded stream length [B]
#define LEN_CC_PUN_BY     ((len_t) (LEN_CC_UNP_BY/CC_NBRANCHES*(CC_RATE+1)/CC_RATE))     //!< punctured convolutional coded stream length [B]
#define LEN_MOD_SY        ((len_t) (LEN_CC_UNP_BY/MOD_BPS))


/*****************/
/*** VARIABLES ***/
/*****************/


//static uint8_t txSrcBytes[LEN_SRC_BY];                    //!< tx source info stream
//static uint8_t rxSrcBytes[LEN_SRC_BY];                    //!< rx source info stream
//static uint8_t txCcBytes[LEN_CC_UNP_BY];                  //!< tx convolutional coded stream
//static uint8_t rxCcBytes[LEN_CC_UNP_BY];                  //!< rx convolutional coded stream


static byte_stream_t txSrcBytes = {.pBuf = NULL};              //!< tx source buffer
static byte_stream_t rxSrcBytes = {.pBuf = NULL};              //!< rx source buffer
static byte_stream_t txCcBytes = {.pBuf = NULL};               //!< tx convolutional coded buffer
static byte_stream_t rxCcBytes = {.pBuf = NULL};               //!< rx convolutional coded buffer




//static complex_t txModSymbols[LEN_MOD_SY];

static cc_par_t ccParams;
static cc_encoder_info_t ccEncoderInfo;
static mod_par_t modParams;

//static len_t ccPuncLen = 0; >>> = txCcBytes.len !!



/************/
/*** MAIN ***/
/************/

int main( void )
{
  Memory_AllocateByteBuffer(&txSrcBytes,LEN_SRC_BY);
  Memory_AllocateByteBuffer(&rxSrcBytes,LEN_SRC_BY);
  Memory_AllocateByteBuffer(&txCcBytes,LEN_CC_UNP_BY);
  Memory_AllocateByteBuffer(&rxCcBytes,LEN_CC_PUN_BY);
  



  Debug_PrintParameters(LEN_SRC_BY);                                        /** -# print all simulation parameters */
  Debug_GenerateRandomBytes(&txSrcBytes,NULL);                              /** -# fill tx source buffer with random bytes */
  Debug_PrintBytes(&txSrcBytes,PID_TX_SRC);                                 /** -# print tx source buffer content */
  CnvCod_ListParameters(&ccParams);                                         /** -# list convolutional coding parameters */
  CnvCod_GetConnectorPuncturationVectors(&ccEncoderInfo,&ccParams);         /** -# retrieve convolutional encoder info */
  CnvCod_Encoder(&txSrcBytes,&txCcBytes,&ccParams,&ccEncoderInfo);          /** -# convolutional encoding */
  Debug_PrintBytes(&txCcBytes,PID_TX_CNVCOD);                               /** -# print tx convolutional coded buffer content */
  if (CHAN_BSC == CHAN_TYPE)
  {
    Channel_BSC(&txCcBytes,&rxCcBytes,BSC_PEB,NULL);                        /** -# apply bsc channel corruption */
  }
  else if (CHAN_AWGN == CHAN_TYPE)
  {
    Modulation_ListParameters(&modParams);                                  /** -# list modulation parameters */
  }
  Debug_PrintBytes(&rxCcBytes,PID_RX_CNVCOD);                               /** -# print rx convolutional coded buffer content */
  Debug_CheckWrongBits(&txCcBytes,&rxCcBytes,PID_RX_CNVCOD);                /** -# check number of corrupted bits at convolutional coding level */
  CnvCod_HardDecoder(&rxCcBytes,&rxSrcBytes,&ccParams,&ccEncoderInfo);      /** -# convolutional decoding */
  Debug_CheckWrongBits(&txSrcBytes,&rxSrcBytes,PID_RX_SRC);                 /** -# check number of corrupted bits at source level */

  if (IS_CSV_ENABLED)
  {
    Debug_WriteBytesToCsv(&txSrcBytes,PID_TX_SRC);                          /** -# write tx source buffer content into csv file */
  }

  Memory_FreeByteBuffer(&txSrcBytes);
  Memory_FreeByteBuffer(&rxSrcBytes);
  Memory_FreeByteBuffer(&txCcBytes);
  Memory_FreeByteBuffer(&rxCcBytes);

  printf(" >> Execution completed successfully!\n");


  //printf("\n\n>> DEBUG2 !!!!!\n\n");











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