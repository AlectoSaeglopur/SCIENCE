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

#define CHANNEL_TYPE      ((channel_t) CHAN_BSC)
#define PEB_BSC           ((float) 3.1E-2)



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t Channel_BSC( const uint8_t * inBuffer, uint8_t *outBuffer, uint32_t ioLen, float Peb, const uint32_t * pSeed );


#endif
