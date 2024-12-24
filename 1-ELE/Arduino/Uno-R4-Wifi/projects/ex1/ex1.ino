
#include "gpio.h"

//#include "Arduino_LED_Matrix.h"


#define TOGGLE_TIME         500     // ms

char printStr[PRINT_BUFFER_SIZE];

void setup()
{
  Gpio_SetPinDirection(GPIO_BUILT_IN_LED, GPIO_DIR_OUTPUT);
  Serial.begin(115200);

//  Gpio_SetPinDirection(GPIO_P112, GPIO_DIR_OUTPUT);
//  Gpio_SetPinLevel(GPIO_P112, GPIO_LEV_HIGH);
//
//  Gpio_SetPinDirection(GPIO_P304, GPIO_DIR_OUTPUT);
//  Gpio_SetPinLevel(GPIO_P304, GPIO_LEV_LOW);

///// 3 012
///// 7 205 gnd 

  Gpio_SetPinDirection(GPIO_P213, GPIO_DIR_OUTPUT);
  Gpio_SetPinLevel(GPIO_P213, GPIO_LEV_HIGH);

  Gpio_SetPinDirection(GPIO_P012, GPIO_DIR_OUTPUT);
  Gpio_SetPinLevel(GPIO_P012, GPIO_LEV_HIGH);

  Gpio_SetPinDirection(GPIO_P206, GPIO_DIR_OUTPUT);
  Gpio_SetPinLevel(GPIO_P206, GPIO_LEV_HIGH);

  Gpio_SetPinDirection(GPIO_P205, GPIO_DIR_OUTPUT);
  Gpio_SetPinLevel(GPIO_P205, GPIO_LEV_LOW);

  

}

void loop()
{
  static uint8_t cnt = 0;

  delay(TOGGLE_TIME);
  Gpio_ToggleDigitalPin(GPIO_BUILT_IN_LED);

//  Gpio_ToggleDigitalPin(GPIO_P112);

//  sprintf (printStr, "Cnt: %u | Dr: %u | Lv: %u", cnt++, Gpio_GetPinDirection(GPIO_P012), Gpio_GetPinLevel(GPIO_P012));
//  Serial.println (printStr);
//  sprintf (printStr, "Cnt: %u | Dr: %u | Lv: %u\n", cnt, Gpio_GetPinDirection(GPIO_P213), Gpio_GetPinLevel(GPIO_P213));
//  Serial.println (printStr);

}



//aggiungere controllo su gpio write e toggle su direzione gpio (solo se OUTPUT!)

// NB: delete everythin inside this to clean project:
// C:\Users\Filippo\AppData\Local\arduino\sketches