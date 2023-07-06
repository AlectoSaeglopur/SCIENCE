/**
 * @file misc.c
 * @author Filippo Valmori
 * @date 05/07/2023
 * @ingroup ASW_C
 * @brief MISC LIBRARY
 *
 * Script containing all custom functions and tasks.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"
#include "gpio.h"
#include "misc.h"
#include "priority.h"


/*****************/
/*** VARIABLES ***/
/*****************/

static QueueHandle_t Hdl_Queue = NULL;                                          //!< Queue handler -> NB: it needs to be global since shall be seen from inside ADC3 ISR


/******************/
/*** PROTOTYPES ***/
/******************/

static void Blink_LED0( void *pvParameters );
static void Blink_LED1( void *pvParameters );
static void Print_Stats( TimerHandle_t xTimer );
static void Trigger_ADC3(  void *pvParameters );
static void Update_DAC( void *pvParameters );
static void Kick_WDT( void *pvParameters );



/*****************/
/*** FUNCTIONS ***/
/*****************/

/*** 1. LED ***/

/**
 * @brief <i> Function to initialise tasks for periodically blink LED0 and LED1. </i>
 */
void ConfigMod_LEDs( void ){
    BaseType_t Ret;
    Ret = xTaskCreate( Blink_LED0, "LED0", 7*MIN_STACK_SZ,
        NULL, PRT_SW_LED0, NULL );                                              /** - Create new task (with no parameters and linked to function "Blink_LED0") to blink LED0 */
    if( Ret == errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ){
            Set_ErrFlag(ERR_TASK_INIT);                                         /** - Notify error: Task could not be initialised (LED0) */
        }
    Ret = xTaskCreate( Blink_LED1, "LED1", 7*MIN_STACK_SZ,
        (void *)oEXTR3, PRT_SW_LED1, NULL );                                    /** - Create new task (with parameters specified as 4th input as void pointer) to blink LED1 */
    if( Ret == errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ){
            Set_ErrFlag(ERR_TASK_INIT);                                         /** - Notify error: Task could not be initialised (LED1) */
        }
}

/**
 * @brief <i> Function to create and run new task for blinking LED0. </i>
 * @param pvParameters pointer to parameters
 */
static void Blink_LED0( void *pvParameters ){
    Unlock_GPIOs();
    gpio_t Par;
    Par.AnaDig = xDIGITAL;
    Par.InOut = xOUTPUT;
    Par.OpenDr = xDISABLE;
    Config_GPIO(oEXTR1,Par);                                                    /** - Initialise LED0 GPIO*/
    Lock_GPIOs();
    Set_GPIO(oEXTR1,xHIGH);
    while( 1 ){
        vTaskDelay(pdMS_TO_TICKS(LED0_PERIOD));                                 /** - Self-block task for X ms (estimated in relative time, thus less accurate) */
        Toggle_GPIO(oEXTR1);
    }
}

/**
 * @brief <i> Function to create and run new task for blinking LED1. </i>
 * @param pvParameters pointer to parameters
 */
static void Blink_LED1( void *pvParameters ){
    uint8_t * const GpioId = (uint8_t *)pvParameters;
    Unlock_GPIOs();
    gpio_t Par;
    Par.AnaDig = xDIGITAL;
    Par.InOut = xOUTPUT;
    Par.OpenDr = xDISABLE;
    Config_GPIO(GpioId,Par);                                                    /** - Initialise LED0 GPIO*/
    Lock_GPIOs();
    Set_GPIO(GpioId,xHIGH);
    TickType_t xLastWakeTime = xTaskGetTickCount();
    while( 1 ){
        vTaskDelayUntil(&xLastWakeTime,pdMS_TO_TICKS(LED1_PERIOD));             /** - Self-block task for X ms (estimated in absolute time, thus more accurate) */
        Toggle_GPIO(GpioId);
    }
}



/*** 2. PRINT STATS ***/

/**
 * @brief <i> Function to initialise timer and task for retrieving and printing statistics over UART. </i>
 */
void ConfigMod_Stats( void ){
    xTimerHandle Hdl_Timer = xTimerCreate( "TMR2",
        pdMS_TO_TICKS(STATS_PERIOD), pdTRUE, (void *)2, Print_Stats );          /** - Create new timer task (with ID #2 and auto-reload) to periodically print statistics -> Note its stack size is fixed by "configTIMER_TASK_STACK_DEPTH" in FreeRTOS.h */
    if( Hdl_Timer == NULL ){
        Set_ErrFlag(ERR_TIMER_INIT);                                            /** - Notify error: Timer could not be initialised */
    } else {
        xTimerStart(Hdl_Timer,0);                                               /** - Start time (with no initial delay) */
    }
}

/**
 * @brief <i> Function executed each timer task expires to retrieve and print tasks statistics over UART1. </i>
 * @param xTimer timer task handler
 */
static void Print_Stats( TimerHandle_t xTimer ){
    static uint16_t Cnt = 0;
    uint8_t j;
    uint32_t TotalRunTime;
    uint16_t TasksNumber = uxTaskGetNumberOfTasks();                            /** - Retrieve number of active tasks */
    TaskStatus_t TasksStatus[TasksNumber];
    TasksNumber = uxTaskGetSystemState(
            TasksStatus,TasksNumber,&TotalRunTime);                              /** - Built-in function retrieving info and statistics about all tasks */
    TotalRunTime /= 10000;                                                      /** - Scale total execution time so that final CPU utilisation percentage is in form X.YZ% */
    if( (TotalRunTime > 0)  ){                                                  /** - To avoid division by zero */
        /* Print header */
        Add_Printf_str("NAME  ",configMAX_TASK_NAME_LEN);
        Add_Printf_str(" | ",3);
        Add_Printf_str("STA",3);
        Add_Printf_str(" | ",3);
        Add_Printf_str("PRT",3);
        Add_Printf_str(" | ",3);
        Add_Printf_str("STK-F",5);
        Add_Printf_str(" | ",3);
        Add_Printf_str("CPU-U",5);
        Start_Printf();
        __delay_ms(STATS_DELAY);
        Add_Printf_str("--------------------------------------",38);
        Start_Printf();
        __delay_ms(STATS_DELAY);
        /* Print tasks info */
        for( j=0; j<TasksNumber; j++ ){
            Add_Printf_str(TasksStatus[j].pcTaskName,configMAX_TASK_NAME_LEN);  /** - Get task name */
            Add_Printf_str(" | ",3);
            Add_Printf_udec8(TasksStatus[j].eCurrentState);                     /** - Get task current state (e.g. 1=Ready, 2=Blocked, etc) */
            Add_Printf_str(" | ",3);
            Add_Printf_udec8(TasksStatus[j].uxCurrentPriority);                 /** - Get task priority */
            Add_Printf_str(" | ",3);
            Add_Printf_udec16(TasksStatus[j].usStackHighWaterMark);             /** - Get task free stack space (in words) */
            Add_Printf_str(" | ",3);
            Add_Printf_udec16((uint16_t)(TasksStatus[j].ulRunTimeCounter/
                    TotalRunTime));                                             /** - Get task CPU utilisation percentage (and multiplied x100, e.g. 9983 means 99.83 %) */
            Add_Printf_str(" %",2);
            Start_Printf();
            __delay_ms(STATS_DELAY);
        }
        Add_Printf_str("[#",2);
        Add_Printf_udec16(Cnt++);                                               /** - Add execution cycle counter */
        Add_Printf_str("] | Free Heap = ",16);
        Add_Printf_udec16(xPortGetFreeHeapSize());                              /** - Get total amount of free heap memory -> NB: "size_t" is 2-byte big (can be checked with "sizeof(size_t)") */
        Add_Printf_str(" B\r\n",4);
        Start_Printf();                                                         /** - Trigger info transmission over UART1 */
    } else {
        Add_Printf_str("ERROR",5);
        Start_Printf();
    }
}



/*** 3. ADC-DAC FILTERING ***/

/**
 * @brief <i> Function to initialise queue and tasks for ADC-to-DAC filtering module. </i>
 */
void ConfigMod_Filter( void ){
    /* QUEUE */
    Hdl_Queue = xQueueCreate(QUEUE_FILTER_LEN,sizeof(uint16_t));                /** - Create queue (specifying length and element size) to safely pass data from ADC task to DAC task */
    if( Hdl_Queue == NULL ){                                                    /** - Check if queue handler is NULL (i.e. initialisation failed) */
        Set_ErrFlag(ERR_QUEUE_INIT);                                            /** - Notify error: Queue could not be initialised */
    } else {
        BaseType_t Ret;
        /* ADC TASK */
        Ret = xTaskCreate( Trigger_ADC3, "ADC3", 8*MIN_STACK_SZ,
                NULL, PRT_SW_ADC3, NULL );                                      /** - Create new task linked to periodically trigger ADC sampling */
        if( Ret == errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ){
            Set_ErrFlag(ERR_TASK_INIT);                                         /** - Notify error: Task could not be initialised (ADC3) */
        }
        /* DAC TASK */
        Ret = xTaskCreate( Update_DAC, "DAC3", 6*MIN_STACK_SZ,
                NULL, PRT_SW_QRX3,NULL );                                             /** - Create RX queue task */
        if( Ret == errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ){
            Set_ErrFlag(ERR_TASK_INIT);                                         /** - Notify error: Task could not be initialised (DAC3) */
        }
    }
}

/**
 * @brief <i> Function to create and run new task for initialising and triggering ADC. </i>
 * @param pvParameters pointer to parameters
 */
static void Trigger_ADC3( void *pvParameters ){
    Disable_SELF_TEST();                                                        /** - Initialise SELF_TEST line*/
    Init_ADC();                                                                 /** - Initialise ADC module */
    TickType_t xLastWakeTime = xTaskGetTickCount();
    while( 1 ){
        vTaskDelayUntil(&xLastWakeTime,pdMS_TO_TICKS(ADC_PERIOD));              /** - Self-block task for X ms */
        ADCON3Lbits.SWCTRG = 1;                                                 /** - Trigger new ADC sampling (from software) */
    }
}

/**
 * @brief <i> ISR triggered when new sample from AN3-channel ADC buffer is ready. </i>
 */
void XISR _ADCAN3Interrupt( void ){
    const uint16_t AdcVal6 = ADCBUF3;                                           /** - NB: value from ADCBUF shall be read before clearing the interrupt flag, otherwise the latter is asserted again! */
    IFS5bits.ADCAN3IF = 0;                                                      /** - Clear interrupt flag */
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;                              /** - Flag overwritten by "xQueueSendToBackFromISR", specifying if after sending new element to queue another blocked task with higher priority could be resumed [NOT NEEDED HERE] */
    BaseType_t Ret = xQueueSendToBackFromISR(Hdl_Queue,&AdcVal6,
            &xHigherPriorityTaskWoken);                                         /** - Add new element to queue */
//    static uint16_t Cnt = 0;                                                    // for debug purpose only
    if( Ret == errQUEUE_FULL ){
        Set_ErrFlag(ERR_QUEUE_TX_FULL);                                         /** - Notify error: New item could not be added to queue since full */
//        Add_Printf_str("ADC #",5);
//        Add_Printf_udec16(Cnt++);
//        Add_Printf_str(" = FULL",7);
//        Start_Printf();
//        __delay_ms(1);
    } else {
//        Add_Printf_str("ADC #",5);
//        Add_Printf_udec16(Cnt++);
//        Add_Printf_str(" = ",3);
//        Add_Printf_udec16(AdcVal6);
//        Start_Printf();
//        __delay_ms(1);
    }
}

/**
 * @brief <i> Function to create and run new task for initialising and updating DAC. </i>
 * @param pvParameters pointer to parameters
 */
static void Update_DAC( void *pvParameters ){
    Init_DAC();                                                                 /** Initialise DAC module */
    TickType_t xLastWakeTime = xTaskGetTickCount();
    BaseType_t Ret;
    uint16_t WinIdx = 0;                                                        /** - Index over averaging-window buffer */
    uint16_t * WinBuf = pvPortMalloc(DAC_WIN_SZ*sizeof(uint16_t));              /** - Averaging-window buffer (allocated in heap memory and automatically initialised to 0) */
    memset(WinBuf,0,DAC_WIN_SZ*sizeof(uint16_t));                               /** - Initialise all buffer elements to 0 */
    uint16_t WinSum = 0;                                                        /** - Sum value of averaging-window buffer -> uint16 size can be used as long as DAC_WIN_SZ <= 16 (since ADC actually provides 12-bit values!) */
    uint16_t NewVal;                                                            /** - New value read from queue */    
    for( ;; ){
        vTaskDelayUntil(&xLastWakeTime,pdMS_TO_TICKS(DAC_PERIOD));              /** - Self-block task for X ms */
        Ret = xQueueReceive(Hdl_Queue,(void *)&NewVal,0);                       /** - Fetch new element from queue -> setting last argument to "portMAX_DELAY" causes the task to wait indefinitely (i.e. no timeout) */ 
//        static uint16_t Cnt = 0;                                                // for debug purpose only
        if( Ret == errQUEUE_EMPTY ){
            Set_ErrFlag(ERR_QUEUE_RX_EMPTY);                                    /** - Notify error: New item could not be fetched from queue since empty */
//            Add_Printf_str("DAC #",5);
//            Add_Printf_udec16(Cnt++);
//            Add_Printf_str(" = EMPTY",8);
//            Start_Printf();
//            __delay_ms(1);
        } else {
            WinSum = WinSum-WinBuf[WinIdx]+NewVal;                              /** - Update sum */
            WinBuf[WinIdx] = NewVal;                                            /** - Overwrite oldest buffer element with latest value from queue */
            WinIdx = (WinIdx+1)%DAC_WIN_SZ;                                     /** - Update index */
            DAC1DATHbits.DACDATH = WinSum/DAC_WIN_SZ;                           /** - Update DAC output level with mean value */
//            Add_Printf_str("DAC #",5);
//            Add_Printf_udec16(Cnt++);
//            Add_Printf_str(" = ",3);
//            Add_Printf_udec16(DAC1DATHbits.DACDATH);
//            Start_Printf();
//            __delay_ms(1);
        }
    }
}



/*** 4. WATCHDOG ***/

/**
 * @brief <i> Function to initialise watchdog module. </i>
 */
void ConfigMod_Watchdog( void ){
    BaseType_t Ret;
    Ret = xTaskCreate( Kick_WDT, "WDT", 5*MIN_STACK_SZ,
        NULL, PRT_SW_WDT4, NULL );                                              /** - Create new task (with no parameters and linked to function "Blink_LED0") to blink LED0 */
    if( Ret == errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ){
            Set_ErrFlag(ERR_TASK_INIT);                                         /** - Notify error: Task could not be initialised (WDT) */
        }
}

/**
 * @brief <i> Function to create and run new task for initialising and kicking internal watchdog. </i>
 * @param pvParameters pointer to parameters
 */
static void Kick_WDT( void *pvParameters ){
    WDTCONLbits.ON = 1;                                                         /** - Enable watchdog in software -> NB: set to 4.096 s (see #pragma configuration register "FWDT" in system.c for more details) */
    TickType_t xLastWakeTime = xTaskGetTickCount();
    for( ;; ){
        vTaskDelayUntil(&xLastWakeTime,pdMS_TO_TICKS(WDT_PERIOD));              /** - Self-block task for X ms */
        __asm__ volatile ("CLRWDT");                                            /** - Kick watchdog to clear timer */
    }
}
