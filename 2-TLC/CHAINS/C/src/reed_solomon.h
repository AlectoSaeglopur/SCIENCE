/**
 * @file reed_solomon.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Reed-Solomon library header
 */


#ifndef REEDSOLOMON_H
#define REEDSOLOMON_H


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
  RS_GF_DEGREE_4 = 4,                                              /** - 4-bit Galois filed ID */
  RS_GF_DEGREE_8 = 8                                               /** - 8-bit Galois filed ID */
} rs_gf_degree_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define GF_DEGREE                 RS_GF_DEGREE_8                  //!< extended Galois field degree [b/Sy]
#define MESSAGE_SIZE              188u                            //!< message length [Sy]
#define CODEWORD_SIZE             204u                            //!< codeword length [Sy]



/*****************/
/*** CONSTANTS ***/
/*****************/





/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct _rs_par_t
{
  rs_gf_degree_t m;                                               /** - Galois filed degree [b/Sy] */
  uint8_t k;                                                      /** - message size [Sy] */
  uint8_t n;                                                      /** - codeword size [Sy] */
  uint8_t t;													                            /** - maximum number of recoverable corrupted symbols */
} rs_par_t;



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/




#endif