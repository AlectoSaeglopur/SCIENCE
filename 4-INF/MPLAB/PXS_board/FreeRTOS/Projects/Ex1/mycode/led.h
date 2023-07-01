/**
 * @file led.h
 * @author Filippo Valmori
 * @date 15/11/2022
 * @ingroup ASW_H
 * @brief LED HEADER
 * 
 * Header containing all LED parameters and function prototypes.
 */


#ifndef LED_H
#define	LED_H


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



/******************/
/*** PROTOTYPES ***/
/******************/

void Blink_LED0(  void *pvParameters  );
void Blink_LED1( void *pvParameters  );


#endif