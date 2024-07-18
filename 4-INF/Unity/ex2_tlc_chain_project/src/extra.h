
/**
 * @file extra.h
 * @author Filippo Valmori
 * @date 14/12/2018
 * @brief Simulation/debug block header.
 */

#ifndef EXTRA_H
#define EXTRA_H


/****************/
/*** INCLUDES ***/
/****************/

#include "setting.h"



/**************/
/*** MACROS ***/
/**************/

typedef enum
{
  PRID_TXINFOB = 0,											    /** ID for the Tx uncoded byte stream printing */
  PRID_RXINFOB,									            /** ID for the Rx uncoded byte stream printing */
  PRID_TXCCB,										            /** ID for the Tx convolutional coded byte stream printing */
  PRID_RXCCB,															  /** ID for the Rx convolutional coded byte stream printing */
  PRID_TXSYMB,															/** ID for the Tx symbol stream printing */
  PRID_RXSYMB, 				  										/** ID for the Rx symbol stream printing */
  PRID_INVALID = 255
} print_id_t;



/******************/
/*** PROTOTYPES ***/
/******************/

void CheckParam( void );
void RandBytGen( uint8_t *IoBytes );
void ChanBSC( uint8_t *InBytes, uint8_t *OutBytes, float Peb );
void ChanAWGN( complex *IoStream );
void PrintParam( void );
void PrintByt( uint8_t *Bytes, uint32_t Len, uint8_t Label );
void PrintSym( complex *Symbols, uint32_t Len, uint8_t Label );
void PrintLLRs( float *LLRs, uint32_t Len );
void PrintConvDiagr( trellis *ConvDiagr );
void PrintTable( phasemap *MapTable );
void WriteBytCsv( uint8_t *Bytes, uint32_t Len, uint8_t Label );
void WriteSymCsv( complex *Symbs, uint32_t Len, uint8_t Label );
bool CheckWrongBits( uint8_t *Stream_A, uint8_t *Stream_B, uint32_t Len, uint8_t Label );
float GetCpxSgnPower( complex *Stream, uint32_t Len );


#endif