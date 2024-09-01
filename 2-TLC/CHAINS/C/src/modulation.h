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



/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct _complex_t
{
  float re;
  float im;
} complex_t;

typedef struct _mod_par_t
{
  modulation_t type;                                  /** - modulation type */
  uint8_t order;                                      /** - modulation order (aka "M") */
  uint8_t bps;                                        /** - number of bits per symbol (aka "L") */
  float phOfst;                                       /** - constellation phase offset [rad] */
} mod_par_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define MOD_TYPE          ((modulation_t) MOD_PSK)      //!< modulation type
#define MOD_BPS           2u                            //!< modulation number of bits per symbol [b/Sy]







/******************/
/*** PARAMETERS ***/
/******************/

#define MOD_ORDER         (0x01<<MOD_BPS)               //!< modulation order



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t Modulation_ListParameters( mod_par_t * ioParams );

//void GetPskTable( phasemap *IoTable );
//void GetQamTable( phasemap *IoTable );
//void Mapper( uint8_t *InBytes, complex *OutSymbs, phasemap *Table );
//void HardDemapper( complex *InSymbs, uint8_t *OutBytes, phasemap *Table );
//void SoftDemapper( complex *InSymbs, float *OutLLRs, phasemap *Table );
//void GetGray( uint8_t *IoArray );


#endif