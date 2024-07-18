
/**
 * @file modulation.h
 * @author Filippo Valmori
 * @date 14/12/2018
 * @brief Modulation block header.
 */

#ifndef MODULATION_H
#define MODULATION_H


/****************/
/*** INCLUDES ***/
/****************/

#include "setting.h"



/******************/
/*** PROTOTYPES ***/
/******************/

void GetPskTable( phasemap *IoTable );
void GetQamTable( phasemap *IoTable );
void Mapper( uint8_t *InBytes, complex *OutSymbs, phasemap *Table );
void HardDemapper( complex *InSymbs, uint8_t *OutBytes, phasemap *Table );
void SoftDemapper( complex *InSymbs, float *OutLLRs, phasemap *Table );
void GetGray( uint8_t *IoArray );


#endif