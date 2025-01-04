
/****************/
/*** INCLUDES ***/
/****************/

#include "debug.h"
#include "led_matrix.h"
#include "gpio.h"
#include "Arduino_LED_Matrix.h"



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
  Gpio_SetPinLevel(GPIO_BUILT_IN_LED, GPIO_LEV_LOW);
  
  // Initialize LED matrix
  LedMatrix_InitializePixels();
  LedMatrix_InitializeTimer();




#if 0
  // sETUP CLOCK (CRETE FUNCTION, PLUS SETUP AS very 1st initialization function!!!!)
  
  // Enable writing to clock registers
  R_SYSTEM->PRCR = PRC_KEY | 0x0001;

//  // Select middle-speed on-chip oscillator (8 MHz)
//  R_SYSTEM->SCKSCR_b.CKSEL = 1;
//  // Set clock divider to 64 for PCKD
  R_SYSTEM->SCKDIVCR_b.PCKD = 6;
//  // Enable MOCO
//  R_SYSTEM->MOCOCR_b.MCSTP = 0;
#endif
}

#define PX_MIN (49-1)
#define PX_MAX (78)

void loop()
{
  
//  static uint8_t idx = 0;
//  LedMatrix_SwitchOnPixel((led_matrix_pixel_t)idx);
//  delay(TOGGLE_TIME);
//
//  idx++;
//  if (PX_MAX == idx)
//  {
//    idx = PX_MIN;
//  }

  delay(2000);
  Debug_PrintClockRegs();
//  Debug_PrintTimerRegs();

//  Gpio_ToggleDigitalPin(LED_MATRIX_ROW_0);
//  Gpio_ToggleDigitalPin(LED_MATRIX_ROW_1);

//  sprintf (printStr, "Cnt: %u | Dr: %u | Lv: %u", cnt++, Gpio_GetPinDirection(GPIO_P012), Gpio_GetPinLevel(GPIO_P012));
//  Serial.println (printStr);
//  sprintf (printStr, "Cnt: %u | Dr: %u | Lv: %u\n", cnt, Gpio_GetPinDirection(GPIO_P213), Gpio_GetPinLevel(GPIO_P213));
//  Serial.println (printStr);

}



// NB: delete everythin inside this to clean project:
// C:\Users\Filippo\AppData\Local\arduino\sketches