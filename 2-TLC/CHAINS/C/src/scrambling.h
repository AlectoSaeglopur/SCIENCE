/**
 * @file scrambling.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Scrambling library header
 */


#ifndef SCRAMBLING_H
#define SCRAMBLING_H


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"
#include "memory.h"
#include "system.h"



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  SCRAMB_ADT = 0,                                       /** - additive scrambling ID */
  SCRAMB_MLT,                                           /** - multiplicative scrambling ID */
  // keep NUM as final entry
  SCRAMB_NUM
} scramb_type_t;


typedef struct _scr_par_t
{
  scramb_type_t type;
  uint8_t nCells;                                       /** - number of LFSR cells */
  uint32_t conVect;                                     /** - connection vector */
  uint32_t initSt;                                      /** - LFSR initial state */
} scr_par_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define SCRAMB_TYPE         SCRAMB_ADT

#define NCELLS_ADT          15u									        //!< cells number of additive LFSR
#define CONVECT_ADT         0x00060000								  //!< connection vector of additive LFSR [e.g. DVB-S: 0x00060000 = (1+)z^-14+z^-15]
#define INITST_ADT          0x95000000                  //!< initial state of additive LFSR

#define NCELLS_MLT          17u									        //!< cells number of multiplicative LFSR
#define CONVECT_MLT         0x00108000								  //!< connection vector of multiplicative LFSR [e.g. 0x00108000 = (1+)z^-12+z^-17]
#define INITST_MLT          0x2C350000                  //!< initial state of multiplicative LFSR



/*****************/
/*** CONSTANTS ***/
/*****************/

#define SCR_TYPE_STR(x)   ((x == SCRAMB_ADT) ? "Additive" : \
                           (x == SCRAMB_MLT) ? "Multiplicative" : \
                           "N/A")                       //!< macro to convert scrambling type value into string

/******************/
/*** PROTOTYPES ***/
/******************/

error_t Scramb_ListParameters( scr_par_t * ioParams );
error_t Scramb_Scrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scr_par_t * pParams );
error_t Scramb_Descrambler( const byte_stream_t * inStream, byte_stream_t * outStream, const scr_par_t * pParams );


#endif
