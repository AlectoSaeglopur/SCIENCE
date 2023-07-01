/**
 * @file led.c
 * @author Filippo Valmori
 * @date 28/03/2023
 * @ingroup ASW_C
 * @brief LED LIBRARY
 *
 * Script containing LED functions and tasks.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "gpio.h"
#include "led.h"



/*****************/
/*** FUNCTIONS ***/
/*****************/

/**
 * @brief <i> Function to create and run new task for blinking LED0. </i>
 * @param pvParameters pointer to parameters
 */
void Blink_LED0(  void *pvParameters ){
    Unlock_GPIOs();                                                             /** - Unlock GPIOs and PP assignments before configuring */
    gpio_t Par;
    Par.AnaDig = xDIGITAL;
    Par.InOut = xOUTPUT;
    Par.OpenDr = xDISABLE;
    Config_GPIO(oEXTR1,Par);
    Lock_GPIOs();                                                               /** - Lock GPIOs and PPS assignments after configuring */
    Set_GPIO(oEXTR1,xHIGH);
    while( 1 ){
        vTaskDelay(pdMS_TO_TICKS(5));                                          /** - Self-suspend task for 50 ms (estimated in relative time) */
        Toggle_GPIO(oEXTR1);
    }
}

/**
 * @brief <i> Function to create and run new task for blinking LED1. </i>
 * @param pvParameters pointer to parameters
 */
void Blink_LED1( void *pvParameters ){
    uint8_t * const GpioId = (uint8_t*)pvParameters;
    Unlock_GPIOs();                                                             /** - Unlock GPIOs and PP assignments before configuring */
    gpio_t Par;
    Par.AnaDig = xDIGITAL;
    Par.InOut = xOUTPUT;
    Par.OpenDr = xDISABLE;
    Config_GPIO(GpioId,Par);
    Lock_GPIOs();                                                               /** - Lock GPIOs and PPS assignments after configuring */
    Set_GPIO(GpioId,xHIGH);
    TickType_t xLastWakeTime = xTaskGetTickCount();
    while( 1 ){
        vTaskDelayUntil(&xLastWakeTime, pdMS_TO_TICKS(17));                    /** - Self-suspend task for 125 ms (estimated in absolute time) */
        Toggle_GPIO(GpioId);
    }
}