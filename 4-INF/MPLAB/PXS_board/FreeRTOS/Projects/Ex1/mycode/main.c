/**
 * @file main.c
 * @author Filippo Valmori
 * @date 30/03/2023
 * @ingroup ASW_C
 * @brief MAIN
 * 
 * Script containing main initialization and loop.
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
#include "led.h"



/*****************/
/*** VARIABLES ***/
/*****************/

uint8_t LogBuf[50] = {0};


/************/
/*** MAIN ***/
/************/

/**
 * @brief <i> Main function creating demo tasks and then starting scheduler. </i>
 */
int main( void ){
    
    /* INITIALIZATION */
    Init_Clock();
    Init_GI();
    
    /* LED */
    xTaskCreate( Blink_LED0, "LED0", 4*MIN_STACK_SZ,
            NULL, PRT_LED0, NULL );                                             /** Create new task with no parameters */
    xTaskCreate( Blink_LED1, "LED1", 4*MIN_STACK_SZ,
            (void *)oEXTR3, PRT_LED1, NULL );                                   /** Create new task with parameters (to be specified as 4th input as void pointer) */
    
    /* START SCHEDULER */
    vTaskStartScheduler();                                                      /** Initialize tick timer, scheduler, idle task and start loop execution */
    
	return 0;                                                                   /** Actually never executed unless the scheduler returns upon detecting there is not enough heap memory to run tasks... */
}
/*-----------------------------------------------------------*/






/**
 * @brief <i> IdleMain function creating demo tasks and then starting scheduler. </i>
 */
void vApplicationIdleHook( void ){
	vCoRoutineSchedule();                                                       /** @vkn: To execute highest priority co-routine (if any) */
    Toggle_GPIO(oEXTR2);
//    vTaskGetRunTimeStats(LogBuf);
}
/*-----------------------------------------------------------*/


//configGENERATE_RUN_TIME_STATS