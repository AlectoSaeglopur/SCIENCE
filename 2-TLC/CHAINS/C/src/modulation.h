/**
 * @file modulation.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Modulation library header
 */


#ifndef MODULATION_H
#define MODULATION_H


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
  MOD_PSK = 0,                                          /** - PSK modulation ID */
  MOD_QAM,                                              /** - QAM modulation ID */
  // keep NUM as final entry
  MOD_NUM
} modulation_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define MOD_TYPE          ((modulation_t) MOD_PSK)      //!< modulation type
#define MOD_BPS           2u                            //!< modulation number of bits per symbol [b/Sy]



/*****************/
/*** CONSTANTS ***/
/*****************/

#define MOD_ORDER         (0x01<<MOD_BPS)               //!< modulation order



/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct _mod_par_t
{
  modulation_t type;                                  /** - modulation type */
  uint8_t order;                                      /** - modulation order (aka "M") */
  uint8_t bps;                                        /** - number of bits per symbol (aka "L") */
  float phOfst;                                       /** - constellation phase offset [rad] */
} mod_par_t;


typedef struct _mod_maptable_t
{
  byte_t bits[MOD_ORDER];
  complex_t symbs[MOD_ORDER];
} mod_maptable_t;



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t Modulation_ListParameters( mod_par_t * ioParams );
error_t Modulation_Mapper( const byte_stream_t * inStream, complex_stream_t * outStream, const mod_par_t * pParams );


#endif