/**
 * @file main.c
 * @author Filippo Valmori
 * @date 30/03/2023
 * @ingroup ASW_C
 * @brief MAIN
 * 
 * Script containing main initialisation and loop.
 * 
 * @addtogroup ASW_C
 * Group with all application software library files.
 * NB: Using FreeRTOS v9.0.0 - Copyright(C) 2016 Real Time Engineers Ltd.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"
#include "priority.h"
#include "gpio.h"
#include "misc.h"

/** FreeRTOS libraries */
#include "FreeRTOS.h"
#include "croutine.h"
#include "queue.h"
#include "task.h"
#include "timers.h"
#include "blocktim.h"
#include "semphr.h"



/************/
/*** MAIN ***/
/************/

/**
 * @brief <i> Main function creating demo tasks and then starting scheduler. </i>
 */
int main( void ){

    /*** INITIALIZATION ***/
    Init_Clock();                                                               /** - Initialise clock */
    Init_GI();                                                                  /** - Initialise interrupt */
    Init_U1();                                                                  /** - Initialise UART1 */
    
    /*** LED ***/
    ConfigMod_LEDs();                                                           /** - Configure module for blinking LEDs */

    /*** PRINT STATS ***/
    ConfigMod_Stats();                                                          /** - Configure module for retrieving and printing statistics over UART */

    /*** ADC-DAC FILTERING THROUGH QUEUE ***/
    ConfigMod_Filter();                                                         /** - Configure module for ADC-to-DAC filtering with queue */

    /*** WATCHDOG ***/
    ConfigMod_Watchdog();                                                       /** - Configure module for watchdog enabling and periodic kicking */
    
    /* START SCHEDULER */
    vTaskStartScheduler();                                                      /** - Initialise tick timer, scheduler, idle-task and start loop execution */
	return 0;                                                                   /** - Actually never executed unless the scheduler returns upon detecting there is not enough heap memory to run tasks... */

}



/*****************/
/*** IDLE-HOOK ***/
/*****************/

/**
 * @brief <i> IdleMain function creating demo tasks and then starting scheduler. </i>
 */
void vApplicationIdleHook( void ){
	vCoRoutineSchedule();                                                       /** - To execute highest priority co-routine (if any) */
//    Toggle_GPIO(oEXTR2);                                                      /** - Experimentally blinking at about 300 kHz (regardless of tick period) */
}



/*************/
/*** NOTES ***/
/*************/

// 1. To check if enough stack space has been assigned to a task (e.g. 8*MIN_STACK_SZ), have a look at the "F-STK" field in Print_Stats().
//    The lower this value, the more the task is running out of stack space (so increase it when task is created).

// 2. "vTaskGetRunTimeStats()" just invokes "uxTaskGetSystemState()" and then simply executes some sprintf cycles to fill info into the provided
//    buffer. However, using sprintf() proved to be highly problematic and inefficient, so the custom "Print_Stats()" has been created.

// 3. To change heap memory format, just go here in MPLAB to "Source Files > FreeRTOS" and remove from project the current heap file (e.g. heap_1.c)
//    and add the new one as existing item (e.g. pointing to .\Ex1\source\portable\MemMang\heap_4.c)

// 4. All main FreeRTOS configurations can be set via "FreeRTOSConfig.h" (mainly for customisation) and "FreeRTOS.h" (mainly for enabling modules,
//    e.g. timers, queue, etc).




// if not working try remove optimization compiler + increse minstack + remove some tasks and check statistics! + distribution between static, automatic and dynamic RAM sections!! or change heap_x.c

// to debug some section you can comment out the statistics timer and use the printf over U1!

// explain idea behind filteringaction

// RIFAI EX filtering con semaforo invece di queue -> OR use semaphore for EXTI from BUTTON to change DAC buffer dimension!

// take oscilloscope screenshot of LEDs

