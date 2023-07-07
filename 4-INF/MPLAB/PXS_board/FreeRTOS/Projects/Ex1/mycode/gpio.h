/**
 * @file gpio.h
 * @author Filippo Valmori
 * @date 23/03/2023
 * @ingroup BSP_H
 * @brief GPIO HEADER
 * 
 * Header containing GPIOs macros, constants and prototypes.
 */


#ifndef GPIO_H
#define	GPIO_H


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct {
    uint8_t     AnaDig;                                                         /** - Analog/digital type */
    uint8_t     InOut;                                                          /** - Input/output type */
    uint8_t     PullUp;                                                         /** - Pull-up resistor enable */
    uint8_t     PullDw;                                                         /** - Pull-down resistor enable */
    uint8_t     OpenDr;                                                         /** - Open-drain configuration enable */
    uint8_t     CnEn0;                                                          /** - Change-notification #0 enable */
    uint8_t     CnEn1;                                                          /** - Change-notification #1 enable */
} gpio_t;



/***************/
/*** DEFINES ***/
/***************/
 
 /** ACCESS */
 #define xREG(Y)                (*((volatile uint16_t *)(Y)))                   //!< Macro to access MCU register

/** TYPE */
#define xANALOG                 (uint8_t) 1                                     //!< Analog GPIO ID
#define xDIGITAL                (uint8_t) 0                                     //!< Digital GPIO ID
#define xINPUT                  (uint8_t) 1                                     //!< Input GPIO ID
#define xOUTPUT                 (uint8_t) 0                                     //!< Output GPIO ID
#define xHIGH                   (uint8_t) 1                                     //!< High-level GPIO ID
#define xLOW                    (uint8_t) 0                                     //!< Low-level GPIO ID
#define xENABLE                 (uint8_t) 1                                     //!< Enable GPIO feature ID
#define xDISABLE                (uint8_t) 0                                     //!< Disable GPIO feature ID

/** SECTORS */
#define xN_PPS                  (uint8_t) 16                                    //!< Number of pins per sector
#define xN_SECT                 (uint8_t) 5                                     //!< Number of sectors
#define xA                      (uint8_t) 0                                     //!< Sector-A GPIO ID
#define xB                      (uint8_t) 1                                     //!< Sector-B GPIO ID
#define xC                      (uint8_t) 2                                     //!< Sector-C GPIO ID
#define xD                      (uint8_t) 3                                     //!< Sector-D GPIO ID
#define xE                      (uint8_t) 4                                     //!< Sector-E GPIO ID

 /** SETTING */
 #define xANSEL                 (uint16_t [xN_SECT]){   \
                                        0x0E00,         \
                                        0x0E1C,         \
                                        0x0E38,         \
                                        0x0E54,         \
                                        0x0E70 }                                //!< Analog-selecting registers array

#define xTRIS                   (uint16_t [xN_SECT]){   \
                                        0x0E02,         \
                                        0x0E1E,         \
                                        0x0E3A,         \
                                        0x0E56,         \
                                        0x0E72 }                                //!< Data-direction registers array

#define xPORT                   (uint16_t [xN_SECT]){   \
                                        0x0E04,         \
                                        0x0E20,         \
                                        0x0E3C,         \
                                        0x0E58,         \
                                        0x0E74 }                                //!< Reading-port registers array

#define xLAT                    (uint16_t [xN_SECT]){   \
                                        0x0E06,         \
                                        0x0E22,         \
                                        0x0E3E,         \
                                        0x0E5A,         \
                                        0x0E76 }                                //!< Writing-latch registers array

#define xODC                    (uint16_t [xN_SECT]){   \
                                        0x0E08,         \
                                        0x0E24,         \
                                        0x0E40,         \
                                        0x0E5C,         \
                                        0x0E78 }                                //!< Open-drain registers array

#define xCNPU                   (uint16_t [xN_SECT]){   \
                                        0x0E0A,         \
                                        0x0E26,         \
                                        0x0E42,         \
                                        0x0E5E,         \
                                        0x0E7A }                                //!< Pull-up registers array

#define xCNPD                   (uint16_t [xN_SECT]){   \
                                        0x0E0C,         \
                                        0x0E28,         \
                                        0x0E44,         \
                                        0x0E60,         \
                                        0x0E7C }                                //!< Pull-down registers array

 #define xCNCON                 (uint16_t [xN_SECT]){   \
                                        0x0E0E,         \
                                        0x0E2A,         \
                                        0x0E46,         \
                                        0x0E62,         \
                                        0x0E7E }                                //!< Change-notification on registers array

 #define xCNEN0                 (uint16_t [xN_SECT]){   \
                                        0x0E10,         \
                                        0x0E2C,         \
                                        0x0E48,         \
                                        0x0E64,         \
                                        0x0E80 }                                //!< Change-notification #0 enable registers array

 #define xCNEN1                 (uint16_t [xN_SECT]){   \
                                        0x0E14,         \
                                        0x0E30,         \
                                        0x0E4C,         \
                                        0x0E68,         \
                                        0x0E84 }                                //!< Change-notification #1 enable registers array

 #define xCNSTAT                (uint16_t [xN_SECT]){   \
                                        0x0E12,         \
                                        0x0E2E,         \
                                        0x0E4A,         \
                                        0x0E66,         \
                                        0x0E82 }                                //!< Change-notification status registers array

 #define xCNF                   (uint16_t [xN_SECT]){   \
                                        0x0E16,         \
                                        0x0E32,         \
                                        0x0E4E,         \
                                        0x0E6A,         \
                                        0x0E86 }                                //!< Change-notification flag registers array

/** MAPPING */
#define oEXTR1                  (uint8_t[2]) {xB,15}                            //!< #3
#define oEXTR2                  (uint8_t[2]) {xE,0}                             //!< #2
#define oEXTR3                  (uint8_t[2]) {xB,14}                            //!< #1
#define oEXTR4                  (uint8_t[2]) {xB,13}                            //!< #80
#define oEXTR5                  (uint8_t[2]) {xB,12}                            //!< #78
#define oEXTR6                  (uint8_t[2]) {xE,14}                            //!< #77
#define oEXTR7                  (uint8_t[2]) {xB,11}                            //!< #76
#define oCAN_TRIP               (uint8_t[2]) {xB,9}                             //!< #61
#define oTRIP_REQ               (uint8_t[2]) {xC,4}                             //!< #63
#define oSW_STAT0               (uint8_t[2]) {xC,5}                             //!< #65
#define oSW_STAT1               (uint8_t[2]) {xC,10}                            //!< #66
#define oREM_ON                 (uint8_t[2]) {xC,11}                            //!< #67
#define oRC_TRIP                (uint8_t[2]) {xE,12}                            //!< #62
#define oREFCLKO                (uint8_t[2]) {xD,3}                             //!< #69
#define oSOA_TRIP               (uint8_t[2]) {xE,13}                            //!< #64
#define oSELF_TEST              (uint8_t[2]) {xD,4}                             //!< #68
#define oTDT                    (uint8_t[2]) {xB,7}                             //!< #58
#define oFEEL_G                 (uint8_t[2]) {xB,8}                             //!< #60
#define oFEEL_B                 (uint8_t[2]) {xE,11}                            //!< #59
#define oU1TX                   (uint8_t[2]) {xB,6}                             //!< #56
#define oU1RX                   (uint8_t[2]) {xB,5}                             //!< #55
#define oVI1                    (uint8_t[2]) {xA,3}                             //!< #21
#define oDAC                    (uint8_t[2]) {xB,2}                             //!< #41
#define oSELF_TEST              (uint8_t[2]) {xD,4}                             //!< #68



/******************/
/*** PROTOTYPES ***/
/******************/

void Config_GPIO( uint8_t *PinId, gpio_t Param );
void Unlock_GPIOs( void );
void Lock_GPIOs( void );
void Config_GPIO( uint8_t *PinId, gpio_t Param );
void Set_GPIO( uint8_t *PinId, uint8_t State );
void Toggle_GPIO( uint8_t *PinId );
uint8_t Get_GPIO( uint8_t *PinId );


#endif
