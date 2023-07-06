
#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

#include "xc.h"
#include "system.h"                                                             /** @vkn: needed to link Config_CCT8() and Get_CCT8() */

/*-----------------------------------------------------------
 * Application specific definitions.
 *
 * These definitions should be adjusted for your particular hardware and
 * application requirements.
 *
 * THESE PARAMETERS ARE DESCRIBED WITHIN THE 'CONFIGURATION' SECTION OF THE
 * FreeRTOS API DOCUMENTATION AVAILABLE ON THE FreeRTOS.org WEB SITE. 
 *
 * See http://www.freertos.org/a00110.html.
 *----------------------------------------------------------*/

#define configUSE_PREEMPTION			1                                       /** @vkn: To enable preemption, thus scheduler runs the available task with highest priority */
#define configUSE_IDLE_HOOK				1                                       /** @vkn: To allow execution of "vApplicationIdleHook()" while within the idle task */
#define configUSE_TICK_HOOK				0
#define configTICK_RATE_HZ				( ( TickType_t ) 1000 )                 /** @vkn: To specify the tick rate [Hz] (here related to T1, i.e. 1 ms) */

#define configMAX_PRIORITIES			( 10 )                                  /** @vkn: To set maximum task priority allowed */
#define configTOTAL_HEAP_SIZE			( ( size_t ) 5120 )                     /** @vkn: To set overall heap memory size in bytes allocated by FreeRTOS for tasks, queues, semaphores, etc */
#define MIN_STACK_SZ                    ( uint16_t ) 20                         /** @vkn: Minimum stack size in words for task allocation (e.g. word = here 16-bit for dsPIC33CH) */
#define configMINIMAL_STACK_SIZE		( 6*MIN_STACK_SZ )                                 /** @vkn: To specify stack space (in words) allocated for the idle-task */

#define configMAX_TASK_NAME_LEN			( 8 )                                   /** @vkn: To modify number of characters for task naming in vTaskGetRunTimeStats() */
#define configUSE_TRACE_FACILITY		1                                       /** @vkn: To enable usage of "uxTaskGetSystemState()" */
#define configUSE_16_BIT_TICKS			1
#define configIDLE_SHOULD_YIELD			1
//#define configCPU_CLOCK_HZ              ((unsigned long) 60000000)

/* Co-routine definitions. */
#define configUSE_CO_ROUTINES           1                                       /** @vkn: To enable usage of co-routines */
#define configMAX_CO_ROUTINE_PRIORITIES ( 2 )                                   /** @vkn: To set maximum co-routines priority allowed */

/* Set the following definitions to 1 to include the API function, or zero
to exclude the API function. */

#define INCLUDE_vTaskPrioritySet		1
#define INCLUDE_uxTaskPriorityGet		0
#define INCLUDE_vTaskDelete				0
#define INCLUDE_vTaskCleanUpResources	0
#define INCLUDE_vTaskSuspend			1
#define INCLUDE_vTaskDelayUntil			1
#define INCLUDE_vTaskDelay				1

#define configKERNEL_INTERRUPT_PRIORITY     1                                   /** @vkn: FreeRTOS kernel (i.e. related to scheduler as well) interrupt priority -> NB: shall be always set to lowest priosity! */
#define pdMS_TO_TICKS(xTimeInMs) ((TickType_t)(((TickType_t)(xTimeInMs)))*(((TickType_t)configTICK_RATE_HZ)/( TickType_t)1000))     /** @vkn: Macro function to convert milliseconds into tick cycles */

/* @vkn: MACROS NEEDED TO RETRIEVE STATISTICS (see "run_time_stats.pdf") */
#define configUSE_STATS_FORMATTING_FUNCTIONS            1                       /** @vkn: To enable usage of "vTaskGetRunTimeStats()" */
#define configGENERATE_RUN_TIME_STATS                   1                       /** @vkn: To enable collection of run-time statistics */
#define portCONFIGURE_TIMER_FOR_RUN_TIME_STATS()        Config_CCT8()           /** @vkn: To provide timer configuration function for statistics gathering */
#define portGET_RUN_TIME_COUNTER_VALUE()                Get_CCT8()              /** @vkn: To provide timer counter read function for statistics gathering */

#endif
