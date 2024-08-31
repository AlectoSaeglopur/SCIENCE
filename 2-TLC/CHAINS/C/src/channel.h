/**
 * @file channel.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Channel library header
 */


#ifndef CHANNEL_H
#define CHANNEL_H


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"                                      /** - import error library */
#include "memory.h"                                     /** - import memory library */
#include "system.h"                                     /** - import system library */



/*************/
/*** ENUMS ***/
/*************/

typedef enum
{
  CHAN_BSC = 0,                                         /** - BSC channel ID */
  CHAN_AWGN,                                            /** - AWGN channel ID */
  // keep NUM as final entry
  CHAN_NUM
} channel_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define CHAN_TYPE         ((channel_t) CHAN_BSC)        //!< channel type
#define BSC_PEB           ((float) 3.1E-2)              //!< BSC channel bit-error probability
#define AWGN_EBN0         ((float) 5.0)                 //!< AWGN channel energy-per-bit-to-noise-power-spectral-density ratio [dB] (NB: SNR=Eb/N0*log2(M)/sps)



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t Channel_BSC( const byte_stream_t * inStream, byte_stream_t * outStream, float Peb, const uint32_t * pSeed );


#endif
