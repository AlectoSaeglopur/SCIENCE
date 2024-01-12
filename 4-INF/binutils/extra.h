
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

#define TXINFOB 			(uint8_t)0											/** ID for the Tx uncoded byte stream printing */
#define RXINFOB				(uint8_t)1											/** ID for the Rx uncoded byte stream printing */
#define TXCCB				(uint8_t)2											/** ID for the Tx convolutional coded byte stream printing */
#define RXCCB				(uint8_t)3											/** ID for the Rx convolutional coded byte stream printing */
#define TXSYMB				(uint8_t)4											/** ID for the Tx symbol stream printing */
#define RXSYMB 				(uint8_t)5											/** ID for the Rx symbol stream printing */



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
void CheckWrongBits( uint8_t *Stream_A, uint8_t *Stream_B, uint32_t Len, uint8_t Label );


#endif