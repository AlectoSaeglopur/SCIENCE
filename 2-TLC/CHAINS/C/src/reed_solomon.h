/**
 * @file reed_solomon.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @see Digital communications - Fundamentals and applications (Bernard Sklar, 2014)
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



/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct _rs_par_t
{
  rs_gf_degree_t m;                                               /** - Galois filed degree [b/Sy] */
  uint8_t kSh;                                                    /** - shortened message size [Sy] */
  uint8_t nSh;                                                    /** - shortened codeword size [Sy] */
  uint8_t t;                                                      /** - maximum number of recoverable corrupted symbols */
  uint16_t kUn;                                                   /** - unshortened message size [Sy] */
  uint16_t nUn;                                                   /** - unshortened codeword size [Sy] */
  uint16_t dimGF;                                                 /** - overall number of symbols in GF(2^m) */
} rs_par_t;



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t RsCod_ListParameters( rs_par_t * ioParams );
error_t RcCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams );
error_t RcCod_Decoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams );


#endif