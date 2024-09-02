/**
 * @file convolutional.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Convolutional coding library header
 */


#ifndef CONVOLUTIONAL_H
#define CONVOLUTIONAL_H


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"                                      /** - import error library */
#include "memory.h"                                     /** - import memory library */
#include "system.h"                                     /** - import system library */



/******************/
/*** PARAMETERS ***/
/******************/

#define CC_RATE                 CC_RATE_23                  /** Convolutional code rate */
#define CC_KLEN                 CC_KLEN_7                   /** Convolutional constrain length */
#define CC_MEMFACT              10u                         /** Viterbi decoder memory factor */
#define CC_VITDM                CC_VITDM_HARD               /** Viterbi decoding method */



/*****************/
/*** CONSTANTS ***/
/*****************/

#define CC_NBRANCHES            2u
#define CC_INMASK               ((LSBIT_MASK<<CC_NBRANCHES)-1)
#define CC_PUNCTLEN             (CC_NBRANCHES*CC_RATE)
#define CC_NTRELSTATES          (1<<(CC_KLEN-1))                                /** Number of trellis states */
#define CC_MEM_DIM              (CC_NTRELSTATES*CC_MEMFACT)                     /** Viterbi decoder memory dimension for survivor paths storage */ 

#define CC_CVMATRIX             ((uint8_t[][CC_NBRANCHES]) {{7,5},{15,11}, \
                                  {23,25},{47,53},{79,109},{159,229}})          /** Connector vectors for each K */

#define CC_PUNC_VECT_23         ((uint8_t[]) {1,1,0,1})                         /** Puncturing vector for Rc = 2/3 */
#define CC_PUNC_VECT_34         ((uint8_t[]) {1,1,0,1,1,0})                     /** Puncturing vector for Rc = 3/4 */
#define CC_PUNC_VECT_56         ((uint8_t[]) {1,1,0,1,1,0,0,1,1,0})             /** Puncturing vector for Rc = 5/6 */
#define CC_PUNC_VECT_78         ((uint8_t[]) {1,1,0,1,0,1,0,1,1,0,0,1,1,0})     /** Puncturing vector for Rc = 7/8 */



/****************/
/*** TYPEDEFS ***/
/****************/

// code rates (specify numerator and denominator of each code rate entry)
#define LIST_OF_CC_RATES(ENTRY) \
  ENTRY( 1, 2 ),                \
  ENTRY( 2, 3 ),                \
  ENTRY( 3, 4 ),                \
  ENTRY( 5, 6 ),                \
  ENTRY( 7, 8 )

#define DEF_CC_RATES_VAL(num,den) CC_RATE_##num##den = num
typedef enum
{
  LIST_OF_CC_RATES(DEF_CC_RATES_VAL)
} cc_rate_t;

#define DEF_CC_RATES_IDX(num,den) CC_RATE_IDX_##num##den
typedef enum
{
  LIST_OF_CC_RATES(DEF_CC_RATES_IDX),
  CC_RATE_NUM
} cc_rate_idx_t;

#define DEF_CC_RATES_ARRAY(num,den) CC_RATE_##num##den


// constraint lengths
typedef enum
{
  CC_KLEN_3   = 3,                                          /** - constraint length 3 ID */
  CC_KLEN_4   = 4,                                          /** - constraint length 4 ID */
  CC_KLEN_5   = 5,                                          /** - constraint length 5 ID */
  CC_KLEN_6   = 6,                                          /** - constraint length 6 ID */
  CC_KLEN_7   = 7,                                          /** - constraint length 7 ID */
  CC_KLEN_8   = 8,                                          /** - constraint length 8 ID */
  CC_KLEN_MIN = CC_KLEN_3,
  CC_KLEN_MAX = CC_KLEN_8
} cc_klen_t;


// decoding methods
typedef enum
{
  CC_VITDM_HARD = 0,                                        /** - viterbi hard decoding method ID */
  CC_VITDM_SOFT,                                            /** - viterbi soft decoding method ID */
  // keep NUM as final entry
  CC_VITDM_NUM
} cc_dec_method_t;


typedef struct _cc_par_t
{
  cc_rate_t cRate;                                    /** - code rate */
  cc_klen_t kLen;                                     /** - constrain length */
  uint16_t memFact;                                   /** - memory factor */
  cc_dec_method_t vitDM;                              /** - Viterbi decoding method */
} cc_par_t;


typedef struct _cc_encoder_info_t
{
  uint8_t connVect[CC_NBRANCHES];                     /** - connector vector */
  uint8_t puncVect[CC_PUNCTLEN];                      /** - puncturation vector */
} cc_encoder_info_t;


typedef struct _cc_trcore_t
{
  uint8_t outBits[CC_NBRANCHES];                      /** - output bits */
  uint8_t nextSt[CC_NBRANCHES];                       /** - next state */
} cc_trcore_t;


typedef struct _cc_trellis_t
{
  cc_trcore_t trSt[CC_NTRELSTATES];                   /** - trellis states */
} cc_trellis_t;


typedef struct _cc_hard_dec_info_t
{
  uint32_t iter[CC_NTRELSTATES];                      /** - iteration counters */
  uint32_t dist[CC_NTRELSTATES];                      /** - Hamming distances */
  uint8_t path[CC_NTRELSTATES][CC_MEM_DIM];           /** - survivor paths */
} cc_hard_dec_info_t;


/****************/
/*** TYPEDEFS ***/
/****************/

#define CC_VDM_STR(x)   ((x == CC_VITDM_HARD) ? "Hard" : \
                         (x == CC_VITDM_SOFT) ? "Soft" : \
                         "N/A")                       //!< macro to convert decoding method value into string



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

error_t CnvCod_ListParameters( cc_par_t * ioParams );
error_t CnvCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams );
error_t CnvCod_HardDecoder( const byte_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams );


#endif