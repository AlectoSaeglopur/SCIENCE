/**
 * @file interleaving.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Interleaving library header
 */


#ifndef INTERLEAVING_H
#define INTERLEAVING_H


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
  INTRLV_BLOCK = 0,                                     /** - block interleaving ID */
  INTRLV_CONV,                                          /** - convolutional interleaving ID */
  // keep NUM as final entry
  INTRLV_NUM
} itlv_type_t;


typedef struct _itlv_par_t
{
  itlv_type_t type;                                     /** - number of LFSR cells */
  union
  {
    uint8_t rows;                                       /** - block number of rows */
    uint8_t dlys;                                       /** - convolutional number of delay lines */
  };
  union 
  {
    uint8_t cols;                                       /** - block number of columns */
    uint8_t cells;                                      /** - convolutional number of delay cells per block */                                                               
  };
} itlv_par_t;



/******************/
/*** PARAMETERS ***/
/******************/

#define INTRLV_TYPE         INTRLV_CONV

#define BLK_NROWS           4u                          //!< number of matrix rows for block interleaving (R)
#define BLK_NCOLS           51u                         //!< number of matrix columns for block interleaving (C)

#define CONV_NDLYS          12u                         //!< number of delay lines for convolutional interleaving (I)
#define CONV_NCELLS         17u                         //!< number of delay cells per block for convolutional interleaving (M)



/*****************/
/*** CONSTANTS ***/
/*****************/

#define INTRLV_NAN          UINT16_MAX

#define INTRLV_TYPE_STR(x)  ((x == INTRLV_BLOCK) ? "Block" : \
                            (x == INTRLV_CONV) ? "Convolutional" : \
                            "N/A")                      //!< macro to convert scrambling type value into string



/******************/
/*** PROTOTYPES ***/
/******************/

error_t Intrlv_ListParameters( itlv_par_t * ioParams );
error_t Intrlv_Interleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams );
error_t Intrlv_Deinterleaver( const byte_stream_t * inStream, byte_stream_t * outStream, const itlv_par_t * pParams );


#endif
