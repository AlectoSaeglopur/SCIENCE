/*
    FreeRTOS V9.0.0 - Copyright (C) 2016 Real Time Engineers Ltd.
    All rights reserved

    VISIT http://www.FreeRTOS.org TO ENSURE YOU ARE USING THE LATEST VERSION.

    This file is part of the FreeRTOS distribution.

    FreeRTOS is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License (version 2) as published by the
    Free Software Foundation >>>> AND MODIFIED BY <<<< the FreeRTOS exception.

    ***************************************************************************
    >>!   NOTE: The modification to the GPL is included to allow you to     !<<
    >>!   distribute a combined work that includes FreeRTOS without being   !<<
    >>!   obliged to provide the source code for proprietary components     !<<
    >>!   outside of the FreeRTOS kernel.                                   !<<
    ***************************************************************************

    FreeRTOS is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE.  Full license text is available on the following
    link: http://www.freertos.org/a00114.html

    ***************************************************************************
     *                                                                       *
     *    FreeRTOS provides completely free yet professionally developed,    *
     *    robust, strictly quality controlled, supported, and cross          *
     *    platform software that is more than just the market leader, it     *
     *    is the industry's de facto standard.                               *
     *                                                                       *
     *    Help yourself get started quickly while simultaneously helping     *
     *    to support the FreeRTOS project by purchasing a FreeRTOS           *
     *    tutorial book, reference manual, or both:                          *
     *    http://www.FreeRTOS.org/Documentation                              *
     *                                                                       *
    ***************************************************************************

    http://www.FreeRTOS.org/FAQHelp.html - Having a problem?  Start by reading
    the FAQ page "My application does not run, what could be wrong?".  Have you
    defined configASSERT()?

    http://www.FreeRTOS.org/support - In return for receiving this top quality
    embedded software for free we request you assist our global community by
    participating in the support forum.

    http://www.FreeRTOS.org/training - Investing in training allows your team to
    be as productive as possible as early as possible.  Now you can receive
    FreeRTOS training directly from Richard Barry, CEO of Real Time Engineers
    Ltd, and the world's leading authority on the world's leading RTOS.

    http://www.FreeRTOS.org/plus - A selection of FreeRTOS ecosystem products,
    including FreeRTOS+Trace - an indispensable productivity tool, a DOS
    compatible FAT file system, and our tiny thread aware UDP/IP stack.

    http://www.FreeRTOS.org/labs - Where new FreeRTOS products go to incubate.
    Come and try FreeRTOS+TCP, our new open source TCP/IP stack for FreeRTOS.

    http://www.OpenRTOS.com - Real Time Engineers ltd. license FreeRTOS to High
    Integrity Systems ltd. to sell under the OpenRTOS brand.  Low cost OpenRTOS
    licenses offer ticketed support, indemnification and commercial middleware.

    http://www.SafeRTOS.com - High Integrity Systems also provide a safety
    engineered and independently SIL3 certified version for use in safety and
    mission critical applications that require provable dependability.

    1 tab == 4 spaces!
*/

/*
	Changes from V4.2.1

	+ Introduced the configKERNEL_INTERRUPT_PRIORITY definition.
*/

/*-----------------------------------------------------------
 * Implementation of functions defined in portable.h for the PIC24 port.
 *----------------------------------------------------------*/

/* Scheduler include files. */
#include "FreeRTOS.h"
#include "task.h"

//#include "vfi_custom.h"

/* Hardware specifics. */
#define portBIT_SET 1
#define portTIMER_PRESCALE 8
#define portINITIAL_SR	0

/* Defined for backward compatability with project created prior to
FreeRTOS.org V4.3.0. */
#ifndef configKERNEL_INTERRUPT_PRIORITY
	#define configKERNEL_INTERRUPT_PRIORITY 1
#endif

/* Use _T1Interrupt as the interrupt handler name if the application writer has
not provided their own. */
#ifndef configTICK_INTERRUPT_HANDLER
	#define configTICK_INTERRUPT_HANDLER _CCT8Interrupt
#endif /* configTICK_INTERRUPT_HANDLER */

/* The program counter is only 23 bits. */
#define portUNUSED_PR_BITS	0x7f

/* Records the nesting depth of calls to portENTER_CRITICAL(). */
UBaseType_t uxCriticalNesting = 0xef;

#if configKERNEL_INTERRUPT_PRIORITY != 1
	#error If configKERNEL_INTERRUPT_PRIORITY is not 1 then the #32 in the following macros needs changing to equal the portINTERRUPT_BITS value, which is ( configKERNEL_INTERRUPT_PRIORITY << 5 )
#endif

#if defined( __PIC24E__ ) || defined ( __PIC24F__ ) || defined( __PIC24FK__ ) || defined( __PIC24H__ )

    #ifdef __HAS_EDS__
		#define portRESTORE_CONTEXT()																						\
					asm volatile(	"MOV	_pxCurrentTCB, W0		\n"	/* Restore the stack pointer for the task. */		\
							"MOV	[W0], W15				\n"																\
							"POP	W0						\n"	/* Restore the critical nesting counter for the task. */	\
							"MOV	W0, _uxCriticalNesting	\n"																\
							"POP	DSWPAG					\n"																\
							"POP    DSRPAG					\n"																\
							"POP	CORCON					\n"																\
							"POP	TBLPAG					\n"																\
							"POP	RCOUNT					\n"	/* Restore the registers from the stack. */					\
							"POP	W14						\n"																\
							"POP.D	W12						\n"																\
							"POP.D	W10						\n"																\
							"POP.D	W8						\n"																\
							"POP.D	W6						\n"																\
							"POP.D	W4						\n"																\
							"POP.D	W2						\n"																\
							"POP.D	W0						\n"																\
							"POP	SR						  " );
	#else /* __HAS_EDS__ */
		#define portRESTORE_CONTEXT()																						\
			asm volatile(	"MOV	_pxCurrentTCB, W0		\n"	/* Restore the stack pointer for the task. */				\
							"MOV	[W0], W15				\n"																\
							"POP	W0						\n"	/* Restore the critical nesting counter for the task. */	\
							"MOV	W0, _uxCriticalNesting	\n"																\
							"POP	PSVPAG					\n"																\
							"POP	CORCON					\n"																\
							"POP	TBLPAG					\n"																\
							"POP	RCOUNT					\n"	/* Restore the registers from the stack. */					\
							"POP	W14						\n"																\
							"POP.D	W12						\n"																\
							"POP.D	W10						\n"																\
							"POP.D	W8						\n"																\
							"POP.D	W6						\n"																\
							"POP.D	W4						\n"																\
							"POP.D	W2						\n"																\
							"POP.D	W0						\n"																\
							"POP	SR						  " );
		#endif /* __HAS_EDS__ */
#endif /* MPLAB_PIC24_PORT */

#if defined( __dsPIC30F__ ) || defined( __dsPIC33F__ ) 

	#define portRESTORE_CONTEXT()																						\
		asm volatile(	"MOV	_pxCurrentTCB, W0		\n"	/* Restore the stack pointer for the task. */				\
						"MOV	[W0], W15				\n"																\
						"POP	W0						\n"	/* Restore the critical nesting counter for the task. */	\
						"MOV	W0, _uxCriticalNesting	\n"																\
						"POP	PSVPAG					\n"																\
						"POP	CORCON					\n"																\
						"POP	DOENDH					\n"																\
						"POP	DOENDL					\n"																\
						"POP	DOSTARTH				\n"																\
						"POP	DOSTARTL				\n"																\
						"POP	DCOUNT					\n"																\
						"POP	ACCBU					\n"																\
						"POP	ACCBH					\n"																\
						"POP	ACCBL					\n"																\
						"POP	ACCAU					\n"																\
						"POP	ACCAH					\n"																\
						"POP	ACCAL					\n"																\
						"POP	TBLPAG					\n"																\
						"POP	RCOUNT					\n"	/* Restore the registers from the stack. */					\
						"POP	W14						\n"																\
						"POP.D	W12						\n"																\
						"POP.D	W10						\n"																\
						"POP.D	W8						\n"																\
						"POP.D	W6						\n"																\
						"POP.D	W4						\n"																\
						"POP.D	W2						\n"																\
						"POP.D	W0						\n"																\
						"POP	SR						  " );
#elif defined( __dsPIC33E__ ) || defined( __dsPIC33C__ )
	#define portRESTORE_CONTEXT()																						\
		asm volatile(	"MOV	_pxCurrentTCB, W0		\n"	/* Restore the stack pointer for the task. */				\
						"MOV	[W0], W15				\n"																\
						"POP	W0						\n"	/* Restore the critical nesting counter for the task. */	\
						"MOV	W0, _uxCriticalNesting	\n"	                                                            \
                        "POP	DSWPAG					\n"																\
                        "POP	DSRPAG					\n"																\
						"POP	CORCON					\n"																\
						"POP	DOENDH					\n"																\
						"POP	DOENDL					\n"																\
						"POP	DOSTARTH				\n"																\
						"POP	DOSTARTL				\n"																\
						"POP	DCOUNT					\n"																\
						"POP	ACCBU					\n"																\
						"POP	ACCBH					\n"																\
						"POP	ACCBL					\n"																\
						"POP	ACCAU					\n"																\
						"POP	ACCAH					\n"																\
						"POP	ACCAL					\n"																\
						"POP	TBLPAG					\n"																\
						"POP	RCOUNT					\n"	/* Restore the registers from the stack. */					\
						"POP	W14						\n"																\
						"POP.D	W12						\n"																\
						"POP.D	W10						\n"																\
						"POP.D	W8						\n"																\
						"POP.D	W6						\n"																\
						"POP.D	W4						\n"																\
						"POP.D	W2						\n"																\
						"POP.D	W0						\n"																\
						"POP	SR						  " );
#endif /* MPLAB_DSPIC_PORT */

#ifndef portRESTORE_CONTEXT
	#error Unrecognised device selected

	/* Note:  dsPIC parts with EDS are not supported as there is no easy way to
	recover the hardware stacked copies for DOCOUNT, DOHIGH, DOLOW. */
#endif

/*
 * Setup the timer used to generate the tick interrupt.
 */
void vApplicationSetupTickTimerInterrupt( void );

/*
 * See header file for description.
 */
StackType_t *pxPortInitialiseStack( StackType_t *pxTopOfStack, TaskFunction_t pxCode, void *pvParameters )
{
volatile uint16_t usCode;
UBaseType_t i;

const StackType_t xInitialStack[] =
{
	0x1111,	/* W1 */
	0x2222, /* W2 */
	0x3333, /* W3 */
	0x4444, /* W4 */
	0x5555, /* W5 */
	0x6666, /* W6 */
	0x7777, /* W7 */
	0x8888, /* W8 */
	0x9999, /* W9 */
	0xaaaa, /* W10 */
	0xbbbb, /* W11 */
	0xcccc, /* W12 */
	0xdddd, /* W13 */
	0xeeee, /* W14 */
	0xcdce, /* RCOUNT */
	0xabac, /* TBLPAG */

	/* dsPIC specific registers. */
	#ifdef MPLAB_DSPIC_PORT
		0x0202, /* ACCAL */
		0x0303, /* ACCAH */
		0x0404, /* ACCAU */
		0x0505, /* ACCBL */
		0x0606, /* ACCBH */
		0x0707, /* ACCBU */
		0x0808, /* DCOUNT */
		0x090a, /* DOSTARTL */
		0x1010, /* DOSTARTH */
		0x1110, /* DOENDL */
		0x1212, /* DOENDH */
	#endif
};

	/* Setup the stack as if a yield had occurred.

	Save the low bytes of the program counter. */
	usCode = ( uint16_t ) pxCode;
	*pxTopOfStack = ( StackType_t ) usCode;
	pxTopOfStack++;

	/* Save the high byte of the program counter.  This will always be zero
	here as it is passed in a 16bit pointer.  If the address is greater than
	16 bits then the pointer will point to a jump table. */
	*pxTopOfStack = ( StackType_t ) 0;
	pxTopOfStack++;

	/* Status register with interrupts enabled. */
	*pxTopOfStack = portINITIAL_SR;
	pxTopOfStack++;

	/* Parameters are passed in W0. */
	*pxTopOfStack = ( StackType_t ) pvParameters;
	pxTopOfStack++;

	for( i = 0; i < ( sizeof( xInitialStack ) / sizeof( StackType_t ) ); i++ )
	{
		*pxTopOfStack = xInitialStack[ i ];
		pxTopOfStack++;
	}

	*pxTopOfStack = CORCON;
	pxTopOfStack++;

	#if defined(__HAS_EDS__)
		*pxTopOfStack = DSRPAG;
		pxTopOfStack++;
		*pxTopOfStack = DSWPAG;
		pxTopOfStack++;
	#else /* __HAS_EDS__ */
		*pxTopOfStack = PSVPAG;
		pxTopOfStack++;
	#endif /* __HAS_EDS__ */

	/* Finally the critical nesting depth. */
	*pxTopOfStack = 0x00;
	pxTopOfStack++;

	return pxTopOfStack;
}
/*-----------------------------------------------------------*/

BaseType_t xPortStartScheduler( void )
{
	/* Setup a timer for the tick ISR. */
	vApplicationSetupTickTimerInterrupt();                                      /** @vkn: Tick timer initialized here! */

	/* Restore the context of the first task to run. */
	portRESTORE_CONTEXT();

	/* Simulate the end of the yield function. */
	asm volatile ( "return" );

	/* Should not reach here. */
	return pdTRUE;
}
/*-----------------------------------------------------------*/

void vPortEndScheduler( void )
{
	/* Not implemented in ports where there is nothing to return to.
	Artificially force an assert. */
	configASSERT( uxCriticalNesting == 1000UL );
}

/*-----------------------------------------------------------*/

/**
 * @brief <i> Function to setup the tick timer. </i>
 * NB#1: The related ISR is remapped above as "configTICK_INTERRUPT_HANDLER".
 * NB#2: The timeout set here shall match the constant "configTICK_RATE_HZ".
 */
__attribute__(( weak )) void vApplicationSetupTickTimerInterrupt( void ){
    CCP8CON1Lbits.CCPON = 0;                                                    /** - Disable module before configuring */
    CCP8CON1Lbits.CLKSEL = 0;                                                   /** - Use FP as clock source (assuming FP = 90 MHz) */
    CCP8CON1Lbits.TMRPS = 2;                                                    /** - Set clock pre-scaler to 1:16 */
    CCP8CON1Lbits.TMRSYNC = 0;                                                  /** - Use synchronous mode */
    CCP8CON2Lbits.SSDG = 0;                                                     /** - Disable gating feature */
    CCP8CON1Lbits.CCSEL = 0;                                                    /** - Select OC/PWM/T operation */
    CCP8CON1Lbits.T32 = 0;                                                      /** - Use 16-bit time operation */
    CCP8CON1Lbits.MOD = 0;                                                      /** - Select Timer mode */
    CCP8CON1Hbits.SYNC = 0;                                                     /** - Use only CCPxPR period match as synchronization source */
    CCP8PRL = 5625;                                                             /** - Set period for primary timer (16/90M*5625 = 875 us) */
    CCP8PRH = 0;                                                                /** - Disable secondary timer (not used) */
    CCP8TMRL = 0;                                                               /** - Reset primary counter */
    IPC38bits.CCT8IP = configKERNEL_INTERRUPT_PRIORITY;                         /** - Set interrupt priority */
    IFS9bits.CCT8IF = 0;                                                        /** - Clear interrupt flag */
    IEC9bits.CCT8IE = 1;                                                        /** - Enable CCP8 interrupt */
    CCP8CON1Lbits.CCPON = 1;                                                    /** - Enable module */
}

/*-----------------------------------------------------------*/

void vPortEnterCritical( void )
{
	portDISABLE_INTERRUPTS();
	uxCriticalNesting++;
}
/*-----------------------------------------------------------*/

void vPortExitCritical( void )
{
	configASSERT( uxCriticalNesting );
	uxCriticalNesting--;
	if( uxCriticalNesting == 0 )
	{
		portENABLE_INTERRUPTS();
	}
}
/*-----------------------------------------------------------*/

/**
 * @brief <i> ISR related to tick timer. </i>
 */
void __attribute__((__interrupt__, auto_psv)) configTICK_INTERRUPT_HANDLER( void ){
	if( xTaskIncrementTick() != pdFALSE ){
		portYIELD();
	}
	IFS9bits.CCT8IF = 0;                                                        /** - Clear interrupt flag */
}
