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

/** Custom libraries */
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
    Init_Clock();                                                               /** - Initialize clock */
    Init_GI();                                                                  /** - Initialize interrupt */
    Init_U1();                                                                  /** - Initialize UART1 */
    
    /*** LED ***/
    uint8_t * Gpio_Led1 = oEXTR3;                                               /** - Create parameter for specifying GPIO related to LED1 as parameter */
    ConfigMod_LEDs(Gpio_Led1);                                                  /** - Configure module for blinking LEDs */

    /*** PRINT STATS ***/
    ConfigMod_Stats();                                                          /** - Configure module for retrieving and printing statistics over UART */

    /*** ADC-DAC FILTERING THROUGH QUEUE ***/
    ConfigMod_Filter();                                                         /** - Configure module for ADC-to-DAC filtering with queue */

    /*** WATCHDOG ***/
    ConfigMod_Watchdog();                                                       /** - Configure module for watchdog enabling and periodic kicking */
    
    /* START SCHEDULER */
    vTaskStartScheduler();                                                      /** - Initialize tick timer, scheduler, idle-task and start loop execution */
	return 0;                                                                   /** - Execution should never reach this line unless the scheduler returns upon detecting there is not enough heap memory to run tasks... */

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

// 0. If after flashing the MCU the code does not work, try one of the following action:
//    - reduce compiler optimization level (NB: for optimization levels larger than 0 FreeRTOS has issues);
//    - increase "MIN_STACK_SZ" in "FreeRTOSConfig.h";
//    - comment out some tasks and check outcome through statistics;
//    - comment out statistics task and use the "printf()" functions over U1;
//    - check FAQ at https://www.freertos.org/FAQHelp.html.

// 1. To check if enough stack space has been assigned to a task (e.g. 8*MIN_STACK_SZ), have a look at the "F-STK" field in Print_Stats().
//    The lower this value, the more the task is running out of stack space (so increase it when task is created).

// 2. "vTaskGetRunTimeStats()" just invokes "uxTaskGetSystemState()" and then simply executes some sprintf cycles to fill info into the provided
//    buffer. However, using sprintf() proved to be highly problematic and inefficient, so the custom "Print_Stats()" has been created.

// 3. To change heap memory format, just go here in MPLAB to "Source Files > FreeRTOS" and remove from project the current heap file (e.g. heap_1.c)
//    and add the new one as existing item (e.g. pointing to .\Ex1\source\portable\MemMang\heap_4.c)

// 4. All main FreeRTOS configurations can be set via "FreeRTOSConfig.h" (mainly for customization) and "FreeRTOS.h" (mainly for enabling modules,
//    e.g. timers, queue, etc).

// 5. A parameters pointer given as input (4th argument) to "xTaskCreate()" risks to be dereferenced before initialization if assigned inside another
//    function. For example, assigning "Gpio_Led1" directly inside "ConfigMod_LEDs()" would compile but not work in practice! As it is now (i.e.
//    "Gpio_Led1" defined in main function) yes, instead. Anyway, it is not so recommended to give parameters.

// 6. Remember that MCU RAM (aka data memory) is divided into x3 sections:
//    - STATIC, reserved to "global" and "static" variables definition -> Its amount is fixed at compilation-time and shall be kept small;
//    - AUTOMTIC (aka STACK), reserved to functions execution  -> Its amount is variable, is fast, uses a FIFO fashion and is automatically de/allocated;
//    - DYNAMIC (aka HEAP), reserved to run-time allocations  -> Its amount is big (even though variable), is slow, shall be manually de/allocated;

// 7. Tasks explanation:
//    - 1. Create auto-blocking tasks to periodically blink LEDs;
//    - 2. Create task to periodically trigger a software timer for printing tasks statistics over UART;
//    - 3. Create task for filtering samples from ADC to DAC. Samples are forwarded through a queue from ADC ISR to DAC task. The DAC task receives the
//         samples and low-pass filters them through an averaging-window buffer. Moreover, INT1 EXTI is used to modify the averaging-window buffer length
//         between x2 possible values, resulting in a different filtering capability (the longer this length, the more filtered will be the DAC output).
//         Test setup (assuming ADC and DAC tasks run every 5 ms):
//           * Signal generator providing a square wave at 10 Hz between 0 and 3.3 V with 50% duty, whose output is connected to pin "oVI1";
//           * Pull-up network (e.g. 40k Ohm resistor) for button generating EXTI, connected to pin "oEXTR5";
//           * Oscilloscope for comparing ADC input with DAC output.
//    - 4. Create task for enabling and periodically kicking watchdog.
