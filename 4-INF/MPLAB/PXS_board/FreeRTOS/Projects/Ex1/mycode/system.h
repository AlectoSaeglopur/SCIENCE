/**
 * @file system.h
 * @author Filippo Valmori
 * @date 15/11/2022
 * @ingroup BSP_H
 * @brief SYSTEM HEADER
 * 
 * Header containing all internal MCU system parameters and function prototypes.
 * 
 * @addtogroup BSP_H
 * Group with all BSP header files.
 */


#ifndef SYSTEM_H
#define	SYSTEM_H


/****************/
/*** INCLUDES ***/
/****************/

/** Standard C libraries */
#include <stdio.h>
#include <stdlib.h>                                                             //!< Library added to use function "calloc"
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
/** Hardware-specific libraries */
#include <xc.h>
/** FreeRTOS libraries */
#include "FreeRTOS.h"
#include "croutine.h"
#include "queue.h"
#include "task.h"
#include "timers.h"
#include "blocktim.h"
#include "semphr.h"



/***************/
/*** DEFINES ***/
/***************/

/** Clock */
#define FCY                     (uint32_t) 60000000                             //!< PLL-boosted clock frequency [Hz] (actual value is 59,904,000 Hz, from original 7,372,800 Hz)
#include <libpic30.h>                                                           //!< Add library for built-in functions "__delay_ms" and "__delay_us" (NB: requires FCY to be already defined)


/** ISR */
#define XISR                    __attribute__((interrupt, auto_psv))            //!< Standard ISR redefinition (needed for Doxygen documentation)



#define MIN_STACK_SZ            (uint16_t) 64



/******************/
/*** PROTOTYPES ***/
/******************/

void Init_Clock( void );
void Init_GI( void );
void Soft_Reset( void );


#endif

