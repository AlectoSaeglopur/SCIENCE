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
#include "modulation.h"                                 /** - import modulation library */
#include "system.h"                                     /** - import system library */



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  CHAN_BSC = 0,                                         /** - BSC channel ID */
  CHAN_AWGN,                                            /** - AWGN channel ID */
  // keep NUM as final entry
  CHAN_NUM
} channel_t;


typedef struct _chan_par_t
{
  uint32_t seed;
  channel_t type;
  uint8_t bps;
  union
  {
    float Peb;                                          /** BSC error probability */
    float EbN0;                                         /** AWGN error probability */
  };
} chan_par_t;



/*****************/
/*** CONSTANTS ***/
/*****************/

#define SEED2TIME         UINT32_MAX                    //!< wildcard for linkinf seed to current time



/******************/
/*** PARAMETERS ***/
/******************/

#define CHAN_TYPE         CHAN_AWGN                     //!< channel type
#define BSC_PEB           3.5E-2                        //!< BSC channel bit-error probability
#define AWGN_EBN0         2.8f                          //!< AWGN channel energy-per-bit-to-noise-power-spectral-density ratio [dB] (NB: SNR=Eb/N0*log2(M)/sps)
#define CHAN_SEED         SEED2TIME                     //!< random seed (linked dinamically to current time via SEED2TIME wildcard)



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t Channel_ListParameters( chan_par_t * ioParams );
error_t Channel_BSC( const byte_stream_t * inStream, byte_stream_t *outStream, const chan_par_t * pParams );
error_t Channel_AWGN( const complex_stream_t * inStream, complex_stream_t * outStream, const chan_par_t * pParams );


#endif
