
/****************/
/*** INCLUDES ***/
/****************/

#include "led_matrix.h"
#include "gpio.h"
//#include "Arduino_LED_Matrix.h"



/***************/
/*** DEFINES ***/
/***************/

#define TOGGLE_TIME         4     // ms



/************************/
/*** GLOBAL VARIABLES ***/
/************************/

char printStr[PRINT_BUFFER_SIZE];


/*****************/
/*** FUNCTIONS ***/
/*****************/

void setup()
{
  // Initialize serial debug interface 
  Serial.begin(115200);

  // Initialize built-in LED
  Gpio_SetPinDirection(GPIO_BUILT_IN_LED, GPIO_DIR_OUTPUT);
  
  // Initialize LED matrix
  Gpio_SetPinDirection(LED_MATRIX_ROW_0, GPIO_DIR_OUTPUT);
  Gpio_SetPinDirection(LED_MATRIX_ROW_1, GPIO_DIR_OUTPUT);

  Gpio_SetPinLevel(LED_MATRIX_ROW_0, GPIO_LEV_LOW);
  Gpio_SetPinLevel(LED_MATRIX_ROW_1, GPIO_LEV_HIGH);
}


void loop()
{
  static uint8_t cnt = 0;

  delay(TOGGLE_TIME);
//  Gpio_ToggleDigitalPin(GPIO_BUILT_IN_LED);

//  Gpio_ToggleDigitalPin(LED_MATRIX_ROW_0);
//  Gpio_ToggleDigitalPin(LED_MATRIX_ROW_1);

//  sprintf (printStr, "Cnt: %u | Dr: %u | Lv: %u", cnt++, Gpio_GetPinDirection(GPIO_P012), Gpio_GetPinLevel(GPIO_P012));
//  Serial.println (printStr);
//  sprintf (printStr, "Cnt: %u | Dr: %u | Lv: %u\n", cnt, Gpio_GetPinDirection(GPIO_P213), Gpio_GetPinLevel(GPIO_P213));
//  Serial.println (printStr);

}



// NB: delete everythin inside this to clean project:
// C:\Users\Filippo\AppData\Local\arduino\sketches