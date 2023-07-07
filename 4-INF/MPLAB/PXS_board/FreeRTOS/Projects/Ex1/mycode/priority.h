
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

/** Hardware ISR priorities */

#define PRT_HW_ADC3             (uint8_t) 5                                     //!< Interrupt priority of ADC AN3 channel
#define PRT_HW_INT1             (uint8_t) 6                                     //!< Interrupt priority of INT1 EXTI
#define PRT_HW_U1TX             (uint8_t) 3                                     //!< Interrupt priority of UART1 TX
#define PRT_HW_U1ER             (uint8_t) 4                                     //!< Interrupt priority of UART1 errors
#define PRT_HW_CCT8             configKERNEL_INTERRUPT_PRIORITY                 //!< Interrupt priority of CCT8

/** Software ISR priorities */
#define PRT_SW_ADC3             (uint8_t) 6                                     //!< Interrupt priority of ADC3 task
#define PRT_SW_LED0             (uint8_t) 2                                     //!< Interrupt priority of LED0 task
#define PRT_SW_LED1             (uint8_t) 3                                     //!< Interrupt priority of LED1 task
#define PRT_SW_QTX3             (uint8_t) 6                                     //!< Interrupt priority of TX queue task
#define PRT_SW_QRX3             (uint8_t) 5                                     //!< Interrupt priority of RX queue task
#define PRT_SW_WDT4             (uint8_t) 4                                     //!< Interrupt priority of WDT task


#endif
