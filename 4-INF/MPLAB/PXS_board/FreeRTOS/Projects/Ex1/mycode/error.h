
/**
 * @file error.h
 * @author Filippo Valmori
 * @date 15/11/2022
 * @ingroup BSP_H
 * @brief ERROR HEADER
 * 
 * Header containing error IDs and function prototypes.
 */


#ifndef ERROR_H
#define	ERROR_H


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



/******************/
/*** PROTOTYPES ***/
/******************/

void Set_ErrFlag( uint16_t ErrId );
bool Get_ErrFlag( uint16_t ErrId );
uint8_t Get_ErrPage( uint16_t ErrId );
void Clear_ErrFlag( uint16_t ErrId );
void Reset_ErrRegs( void );



/***************/
/*** DEFINES ***/
/***************/

#define ERR_PG_SIZE             (uint8_t) 20                                    //!< Number of error pages (NB: shall contain all error flags listed below!)

/* Error page #00 : GPIO */
#define ERR_GPIO_INV_SN         (uint16_t) 0x0001                               //!< Error ID for invalid pin sector and/or number
#define ERR_GPIO_INV_AD         (uint16_t) 0x0002                               //!< Error ID for invalid analog/digital setting
#define ERR_GPIO_INV_IO         (uint16_t) 0x0004                               //!< Error ID for invalid input/output setting
#define ERR_GPIO_INV_PD         (uint16_t) 0x0008                               //!< Error ID for invalid pull-down resistor setting
#define ERR_GPIO_INV_PU         (uint16_t) 0x0010                               //!< Error ID for invalid pull-up resistor setting
#define ERR_GPIO_INV_CN         (uint16_t) 0x0020                               //!< Error ID for invalid change-notification setting
#define ERR_GPIO_INV_OD         (uint16_t) 0x0040                               //!< Error ID for invalid open-drain setting
#define ERR_GPIO_INV_LV         (uint16_t) 0x0080                               //!< Error ID for invalid output level

/* Error flags #04 : TRAP (pt.1) */
#define ERR_TRAP_OSC            (uint16_t) 0x0401                               //!< Error ID for oscillator failure trap
#define ERR_TRAP_CLOCK          (uint16_t) 0x0402                               //!< Error ID for clock failure detected by FSCM
#define ERR_TRAP_PPL            (uint16_t) 0x0404                               //!< Error ID for oscillator PLL out-of-lock
#define ERR_TRAP_ADDR           (uint16_t) 0x0408                               //!< Error ID for address trap
#define ERR_TRAP_STACK          (uint16_t) 0x0410                               //!< Error ID for stack trap
#define ERR_TRAP_MATH           (uint16_t) 0x0420                               //!< Error ID for math trap
#define ERR_TRAP_OVLA           (uint16_t) 0x0440                               //!< Error ID for math accumulator A overflow trap
#define ERR_TRAP_OVLB           (uint16_t) 0x0480                               //!< Error ID for math accumulator B overflow trap

/* Error flags #05 : TRAP (pt.2) */
#define ERR_TRAP_COVLA          (uint16_t) 0x0501                               //!< Error ID for math accumulator A catastrophic overflow trap
#define ERR_TRAP_COVLB          (uint16_t) 0x0502                               //!< Error ID for math accumulator B catastrophic overflow trap
#define ERR_TRAP_SHACC          (uint16_t) 0x0504                               //!< Error ID for shift accumulator trap
#define ERR_TRAP_DIV0           (uint16_t) 0x0508                               //!< Error ID for divide-by-zero trap
#define ERR_TRAP_DOSOVL         (uint16_t) 0x0510                               //!< Error ID for DO stack overflow soft trap
#define ERR_TRAP_DMA_ADR        (uint16_t) 0x0520                               //!< Error ID for DMA address error soft trap
#define ERR_TRAP_SG_HARD        (uint16_t) 0x0540                               //!< Error ID for software generated hard trap

/* Error page #08 : MISCELLANEOUS */
#define ERR_MEMSET              (uint16_t) 0x0801                               //!< Error ID for memset function outcome
#define ERR_MEMCPY              (uint16_t) 0x0802                               //!< Error ID for memcpy function outcome
#define ERR_RCON                (uint16_t) 0x0804                               //!< Error ID for RCON anomalous reset error detected
#define ERR_CRC_CMM             (uint16_t) 0x0808                               //!< Error ID for flash memory FW CRC mismatch
#define ERR_CRC_UST             (uint16_t) 0x0810                               //!< Error ID for CRC unknown state


#endif
