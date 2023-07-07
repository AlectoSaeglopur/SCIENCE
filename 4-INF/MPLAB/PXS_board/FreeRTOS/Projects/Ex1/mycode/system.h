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




/***************/
/*** DEFINES ***/
/***************/

/** Clock */
#define FCY                     (uint32_t) 90000000                             //!< PLL-boosted clock frequency [Hz] (actual value is 59,904,000 Hz, from original 7,372,800 Hz)
#include <libpic30.h>                                                           //!< Add library for built-in functions "__delay_ms" and "__delay_us" (NB: requires FCY to be already defined)

/** ISR */
#define XISR                    __attribute__((interrupt, auto_psv))            //!< Standard ISR redefinition (needed for Doxygen documentation)

/** Statistics */
#define U1B_SIZE                (uint8_t) 50                                    //!< UART1 TX buffer size [B] (NB: shall contain all characters of each statistics line to be printed)
#define STATS_DELAY             (uint8_t) 2                                     //!< Delay in ms (NB: shall give enough time to print single statistics line, e.g. U1@450 kb/s and SZ=50B -> 50*(8+3)/450k = 1.2 ms



/******************/
/*** PROTOTYPES ***/
/******************/

void Init_Clock( void );
void Init_GI( void );
void Soft_Reset( void );

void Init_U1( void );
void Add_Printf_udec8( uint8_t WordIn );
void Add_Printf_udec16( uint16_t WordIn );
void Add_Printf_udec32( uint32_t WordIn );
void Add_Printf_str( const char * Str, uint16_t Len );
void Start_Printf( void );

void Config_CCT8( void );
uint32_t Get_CCT8( void );

void Init_ADC( void );
void Disable_SELF_TEST( void );
void Init_DAC( void );
void Init_INT1( void );



#endif

