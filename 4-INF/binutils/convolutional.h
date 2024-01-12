
/**
 * @file convolutional.h
 * @author Filippo Valmori
 * @date 14/12/2018
 * @brief Convolutional coding block header.
 */

#ifndef CONVOLUTIONAL_H
#define CONVOLUTIONAL_H


/****************/
/*** INCLUDES ***/
/****************/

#include "setting.h"



/******************/
/*** PROTOTYPES ***/
/******************/

void GetConvCP( uint8_t *ConVect, uint8_t *PuncVect );
void ConvEncoder( uint8_t *InBits, uint8_t *OutBits, uint8_t *ConVect, uint8_t *PunctVect );
void GetTrellis( uint8_t *ConVect, trellis *CodeDiagr );
void HardConvDecoder( uint8_t *InBits, uint8_t *OutBits, trellis *CodeDiagr, uint8_t *PunctVect );
void SoftConvDecoder( float *InLLRs, uint8_t *OutBits, trellis *CodeDiagr, uint8_t *PunctVect );


#endif