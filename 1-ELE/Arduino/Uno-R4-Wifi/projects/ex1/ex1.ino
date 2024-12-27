
/****************/
/*** INCLUDES ***/
/****************/

#include "led_matrix.h"
#include "gpio.h"
//#include "Arduino_LED_Matrix.h"



/***************/
/*** DEFINES ***/
/***************/

#define TOGGLE_TIME         1     // ms



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
  LedMatrix_InitializePixels();
}

#define PX_MIN (49-1)
#define PX_MAX (78)

void loop()
{
  
  static uint8_t idx = 0;
  LedMatrix_SwitchOnPixel((led_matrix_pixel_t)idx);
  delay(TOGGLE_TIME);

  idx++;
  if (PX_MAX == idx)
  {
    idx = PX_MIN;
  }




  
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