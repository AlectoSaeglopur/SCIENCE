/**
 * @file system.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief System header
 * 
 * Header file containing all common libraries and definitions for project files.
 */


#ifndef SYSTEM_H
#define SYSTEM_H


/****************/
/*** INCLUDES ***/
/****************/

#include <stdio.h>                                    /** - import standard i/o library */
#include <stdbool.h>                                  /** - import boolean type library */
#include <stdint.h>                                   /** - import integer types library */
#include <string.h>                                   /** - import string library (e.g. to use "memcpy" and "memset" functions) */
#include <stdlib.h>                                   /** - import random generation library */
#include <time.h>                                     /** - import time library (e.g. to link random seed to actual time) */
#include <math.h>                                     /** - import mathematical library (e.g. to use "sin/cos" and "log/exp" functions) */



/****************/
/*** TYPEDEFS ***/
/****************/

#define len_t                   uint32_t              //!< bit/byte buffer length type



/***************/
/*** DEFINES ***/
/***************/

#define BY2BI_SHIFT             3u                    //!< number of bit shifts to convert byte into bit value
#define LSBIT_MASK              ((uint8_t) 0x01)
#define LSBYTE_MASK             ((uint32_t) 0x0007)

#define NUM_BITS_PER_BYTE       8u
#define BITIDX_1LAST            (NUM_BITS_PER_BYTE-1)
#define BITIDX_2LAST            (BITIDX_1LAST-1)





typedef struct _byte_buf_t
{
  uint8_t * pBuf;
  len_t len;
} byte_buf_t;



//#define PunBytLen    (uint32_t)(LEN_SRC_BY*(Rc+1)/Rc)                /** Punctured convolutional coded byte-length [B] */


/**************/
/*** MACROS ***/
/**************/

//#define SymLen      (uint32_t)PunBitLen/L                    /** Mapped stream symbol-length [S] */

//#define SrcBitLen     (uint32_t)(LEN_SRC_BY<<3)                  /** Source info stream bit-length [b] */
//#define DepBytLen    (uint32_t)(2*LEN_SRC_BY)                    /** Depunctured convolutional coded byte-length [B] */
//#define DepBitLen    (uint32_t)(DepBytLen<<3)                  /** Depunctured convolutional coded bit-length [b] */
//#define PunBytLen    (uint32_t)(LEN_SRC_BY*(Rc+1)/Rc)                /** Punctured convolutional coded byte-length [B] */
//#define PunBitLen    (uint32_t)(PunBytLen<<3)                  /** Punctured convolutional coded bit-length [b] */



/****************/
/*** TYPEDEFS ***/
/****************/

//
//typedef struct TD6 {
//  uint8_t Bits[M];
//  complex Symbs[M];
//} phasemap;


#endif