/**
 * @file crc.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief CRC library header
 */


#ifndef CRC_H
#define CRC_H


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  CHAN_DEGREE_8   = 8,                                      /** - 8-bit degree ID */
  CHAN_DEGREE_16  = 16,                                     /** - 16-bit degree ID */
  CHAN_DEGREE_24  = 24,                                     /** - 24-bit degree ID */
  CHAN_DEGREE_32  = 32,                                     /** - 32-bit degree ID */
  CHAN_DEGREE_64  = 64,                                     /** - 64-bit degree ID */
} crc_degree_t;


typedef struct _crc_par_t
{
  crc_degree_t degre;
  uint8_t * pGenPoly;
  uint8_t lenGenPoly;
} crc_par_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define CRC_DEGREE          CHAN_DEGREE_16                  //!< CRC degree



/*****************/
/*** CONSTANTS ***/
/*****************/

#define CRC_GENPOLY_8         ((uint8_t[]) {0,2,4,6,7})           //!< Generator polynomial for 8-bit CRC (ITU standard)
#define CRC_GENPOLY_16        ((uint8_t[]) {0,5,12})              //!< Generator polynomial for 16-bit CRC (DVB-S2 standard)
#define CRC_GENPOLY_24        ((uint8_t[]) {0,1,5,6,23})          //!< Generator polynomial for 24-bit CRC (UMTS standard)
#define CRC_GENPOLY_32        ((uint8_t[]) {0,1,2,4,5,7,8,10, \
                                            11,12,16,22,23,26})   //!< Generator polynomial for 32-bit CRC (MPEG-2 standard)
#define CRC_GENPOLY_64        ((uint8_t[]) {0,1,3,4})             //!< Generator polynomial for 64-bit CRC (ISO standard)



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/




#endif
