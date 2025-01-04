
/****************/
/*** INCLUDES ***/
/****************/

#include "led_matrix.h"
#include "gpio.h"
#include "Arduino_LED_Matrix.h"



/***************/
/*** DEFINES ***/
/***************/

#define TOGGLE_TIME         1     // ms


#define PRINT_REG(BUCKET, REGISTER) \
  do { \
    uint32_t t = BUCKET->REGISTER; \
    Serial.print(#REGISTER " : 0x"); \
    Serial.println(t, HEX); \
  } while (false)



/************************/
/*** GLOBAL VARIABLES ***/
/************************/

char printStr[PRINT_BUFFER_SIZE];


/*****************/
/*** FUNCTIONS ***/
/*****************/

void printRegisters(){
  Serial.println("\n***Registers***\n");
  PRINT_REG(R_GPT3, GTWP);
  PRINT_REG(R_GPT3, GTPR);
//  PRINT_REG(R_GPT3, GTPBR);
  PRINT_REG(R_GPT3, GTCR);
  PRINT_REG(R_GPT3, GTUDDTYC);
  PRINT_REG(R_GPT3, GTIOR);
  PRINT_REG(R_GPT3, GTCNT);

  PRINT_REG(R_GPT3, GTCCR[0]);
}

void setup()
{
  // Initialize serial debug interface 
  Serial.begin(115200);

  // Initialize built-in LED
  Gpio_SetPinDirection(GPIO_BUILT_IN_LED, GPIO_DIR_OUTPUT);
  Gpio_SetPinLevel(GPIO_BUILT_IN_LED, GPIO_LEV_LOW);
  
  // Initialize LED matrix
  LedMatrix_InitializePixels();
#if 1
  LedMatrix_InitializeTimer();
#else
  LedMatrix_InitializeTimer2();
#endif

  printRegisters();
  delay(250);
  printRegisters();
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


//delay(500);
//LedMatrix_InitializeTimer();

//GPT163.GTCNT overflow (GPT163.GTPR compare match)
delay(500);

  




  
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