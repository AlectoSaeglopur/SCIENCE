
/**
 * @file isr_priority.h
 * @author Filippo Valmori
 * @date 15/11/2022
 * @ingroup BSP_H
 * @brief INTERRUPT PRIORITY HEADER
 * 
 * Header containing ISR priority parameters.
 */


#ifndef ISR_PRIORITY_H
#define	ISR_PRIORITY_H



/***************/
/*** DEFINES ***/
/***************/

/** ISR priorities (HW) */
#define PRT_CCT8                configKERNEL_INTERRUPT_PRIORITY                 //!< Interrupt priority of CCT8, related to FreeRTOS tick-timing

/** Task priorities (SW) */
#define PRT_LED0                (uint16_t) 2
#define PRT_LED1                (uint16_t) 3


#endif
