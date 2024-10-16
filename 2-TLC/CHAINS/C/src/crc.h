/**
 * @file crc.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @see Digital communications - Fundamentals and applications (Bernard Sklar, 2014)
 * @ingroup TLC_CHAIN
 * @brief CRC library header
 */


#ifndef CRC_H
#define CRC_H


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
  CRC_DEGREE_8  = 8,                                        /** - 8-bit degree ID */
  CRC_DEGREE_16 = 16,                                       /** - 16-bit degree ID */
  CRC_DEGREE_24 = 24,                                       /** - 24-bit degree ID */
  CRC_DEGREE_32 = 32,                                       /** - 32-bit degree ID */
  CRC_DEGREE_64 = 64                                        /** - 64-bit degree ID */
} crc_degree_t;

typedef struct _crc_par_t
{
  crc_degree_t degree;
  const uint8_t * pGenPoly;
  uint8_t lenGenPoly;
} crc_par_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define CRC_DEGREE            CRC_DEGREE_16                 //!< CRC degree [b]



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t Crc_ListParameters( crc_par_t * ioParams );
error_t Crc_CalculateChecksum( const byte_stream_t * inStream, byte_stream_t * outStream, const crc_par_t * pParams );


#endif
