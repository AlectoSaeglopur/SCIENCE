/**
 * @file modulation.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @see Digital communications - Fundamentals and applications (Bernard Sklar, 2014)
 * @ingroup TLC_CHAIN
 * @brief Modulation library header
 */


#ifndef MODULATION_H
#define MODULATION_H


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"
#include "memory.h"
#include "system.h"



/*************/
/*** ENUMS ***/
/*************/

typedef enum
{
  MOD_PSK = 0,                                              /** - PSK modulation ID */
  MOD_QAM,                                                  /** - QAM modulation ID */
  // keep NUM as final entry
  MOD_NUM
} mod_type_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define MOD_TYPE          MOD_PSK                           //!< modulation type
#define MOD_BPS           2u                                //!< modulation number of bits per symbol [b/Sy]



/*****************/
/*** CONSTANTS ***/
/*****************/

#define MOD_SD_N0         ((float) 4.0)                     /** Assumed linear noise variance for soft demapper (e.g. 4 equals 6 dB) */

#define MOD_BPS_MIN       1u                                //!< Minimum BPS value allowed
#define MOD_BPS_MAX       6u                                //!< Maximum BPS value allowed

#define MOD_ORDER         (0x01<<MOD_BPS)                   //!< modulation order (NB: Min. = 2 | Max = 64)
#define MOD_BINARY        2u                                //!< Binary modulation order

#define MOD_TYPE_STR(x)   ((x == MOD_PSK) ? "PSK" : \
                           (x == MOD_QAM) ? "QAM" : \
                           "N/A")                           //!< macro to convert modulation type value into string

#if (MOD_BPS < MOD_BPS_MIN)
#error MOD_BPS shall be positve!
#endif



/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct _mod_par_t
{
  mod_type_t type;                                          /** - modulation type */
  uint8_t order;                                            /** - modulation order (aka "M") */
  uint8_t bps;                                              /** - number of bits per symbol (aka "L") */
  float phOfst;                                             /** - constellation phase offset [rad] */
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
error_t Modulation_HardDemapper( const complex_stream_t * inStream, byte_stream_t * outStream, const mod_par_t * pParams );
error_t Modulation_SoftDemapper( const complex_stream_t * inStream, float_stream_t * outStream, const mod_par_t * pParams );

#endif