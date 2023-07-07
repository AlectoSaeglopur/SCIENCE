/**
 * @file misc.h
 * @author Filippo Valmori
 * @date 15/11/2022
 * @ingroup ASW_H
 * @brief LED HEADER
 * 
 * Header containing all custom parameters and function prototypes.
 */


#ifndef LED_H
#define	LED_H


/****************/
/*** INCLUDES ***/
/****************/

/** Custom libraries */
#include "system.h"
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

#define LED0_PERIOD             (uint16_t) 51                                   //!< Blink-LED0 task period [ms]
#define LED1_PERIOD             (uint16_t) 9                                    //!< Blink-LED1 task period [ms]
#define STATS_PERIOD            (uint16_t) 1000                                 //!< Print-statistics task period [ms]
#define ADC_PERIOD              (uint16_t) 5                                    //!< Trigger-ADC-sampling task period [ms]
#define DAC_PERIOD              (uint16_t) 5                                    //!< Update-DAC task period [ms]
#define WDT_PERIOD              (uint16_t) 3500                                 //!< Kick-watchdog task period [ms] -> NB: shall be between 0.75x and 1x 4.096s

#define QUEUE_FILTER_LEN        (uint8_t) 5                                     //!< ADC-DAC filtering queue length
#define DAC_WIN_SZ1             (uint8_t) 4                                     //!< DAC averaging-window buffer length #1
#define DAC_WIN_SZ2             (uint8_t) 10                                    //!< DAC averaging-window buffer length #2



/******************/
/*** PROTOTYPES ***/
/******************/

void ConfigMod_LEDs( uint8_t * Led1 );
void ConfigMod_Stats( void);
void ConfigMod_Filter( void );
void ConfigMod_Watchdog( void );


#endif