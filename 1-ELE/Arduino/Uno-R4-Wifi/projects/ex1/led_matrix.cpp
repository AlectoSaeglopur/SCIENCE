/**
 * @file led_matrix.cpp
 * @author Filippo Valmori
 * @date 23/12/2024
 * @brief LED matrix library
 * 
 * Library containing LED matrix handling functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "led_matrix.h"



/*****************/
/*** CONSTANTS ***/
/*****************/

static const led_matrix_row_pin_t ROWS_ARRAY[LED_MATRIX_ROW_NUM] = {LIST_OF_LED_MATRIX_ROWS(DEF_LED_MATRIX_ROW_PIN)};
static const led_pixel_t PIXELS_ARRAY[LED_MATRIX_PIXEL_NUM] = {LIST_OF_LED_MATRIX_PIXELS(DEF_LED_MATRIX_PIXEL_MAP)};

static const IRQn_Type IRQn_OVF3 = IRQn_Type(IRQ_EXC_NUMBER_OVF3);



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

void ISR_GPT3_OVF( void );



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for initilizing LED matrix with pins as tristate. </i>
 * 
 * @return none
 */
void LedMatrix_InitializePixels( void )
{
  uint8_t rowIdx;
  gpio_number_t rowPin;

  for (rowIdx=0; rowIdx<LED_MATRIX_ROW_NUM; rowIdx++)
  {
    rowPin = (gpio_number_t)ROWS_ARRAY[rowIdx];
    Gpio_SetPinDirection(rowPin, GPIO_DIR_INPUT);
  }
}


/**
 * @brief <i> Function for setting level of a single pixel within LED matrix. </i>
 * 
 * @param[in] pxIdx pixel index
 * @param[in] level digital level to set
 * 
 * @return none
 */
void LedMatrix_SwitchOnPixel( led_matrix_pixel_t pxIdx )
{
#if 0 // #1:generic implementation

  uint8_t rowIdx;
  gpio_number_t rowPin;

  if (pxIdx < LED_MATRIX_PIXEL_NUM)
  {
    for (rowIdx=0; rowIdx<LED_MATRIX_ROW_NUM; rowIdx++)
    {
      rowPin = (gpio_number_t)ROWS_ARRAY[rowIdx];

      if (rowPin == (gpio_number_t)PIXELS_ARRAY[pxIdx].cathode)
      {
        Gpio_SetPinDirection(rowPin, GPIO_DIR_OUTPUT);
        Gpio_SetPinLevel(rowPin, GPIO_LEV_LOW);
      }
      else if (rowPin == (gpio_number_t)PIXELS_ARRAY[pxIdx].anode)
      {
        Gpio_SetPinDirection(rowPin, GPIO_DIR_OUTPUT);
        Gpio_SetPinLevel(rowPin, GPIO_LEV_HIGH);
      }
      else
      {
        Gpio_SetPinDirection(rowPin, GPIO_DIR_INPUT);
      }
    }
  }

#else // #2: more efficient implementation

  static led_matrix_pixel_t prevPxIdx = LED_MATRIX_PIXEL_NUM;
  gpio_number_t rowPin;

  if ((pxIdx < LED_MATRIX_PIXEL_NUM) && (pxIdx != prevPxIdx))
  {
    // Switch off previous pixel
    rowPin = (gpio_number_t)PIXELS_ARRAY[prevPxIdx].cathode;
    Gpio_SetPinDirection(rowPin, GPIO_DIR_INPUT);
    rowPin = (gpio_number_t)PIXELS_ARRAY[prevPxIdx].anode;
    Gpio_SetPinDirection(rowPin, GPIO_DIR_INPUT);
    // Switch on new pixel
    rowPin = (gpio_number_t)PIXELS_ARRAY[pxIdx].cathode;
    Gpio_SetPinDirection(rowPin, GPIO_DIR_OUTPUT);
    Gpio_SetPinLevel(rowPin, GPIO_LEV_LOW);
    rowPin = (gpio_number_t)PIXELS_ARRAY[pxIdx].anode;
    Gpio_SetPinDirection(rowPin, GPIO_DIR_OUTPUT);
    Gpio_SetPinLevel(rowPin, GPIO_LEV_HIGH);
    // Update previous pixel
    prevPxIdx = pxIdx;
  }

#endif
}


/**
 * @brief <i> Function for initializing 16-bit timer GPT3 for LED matrix switching. </i>
 * 
 * @return none
 */
void LedMatrix_InitializeTimer( void )
{
  // Setup GPT3 overflow interrupt request
  R_ICU->IELSR_b[IRQn_OVF3].IELS = ELC_EVENT_GPT3_COUNTER_OVERFLOW;
  NVIC_SetVector(IRQn_OVF3, (uint32_t)ISR_GPT3_OVF);
  NVIC_SetPriority(IRQn_OVF3, IRQ_PRIORITY_OVF3);
  NVIC_EnableIRQ(IRQn_OVF3);

  // Enable GTP modules
  R_MSTP->MSTPCRD_b.MSTPD5 = 0;
  R_MSTP->MSTPCRD_b.MSTPD6 = 0;

  // Unlock timer registers writing
  R_GPT3->GTWP = (uint32_t)((((uint16_t)PROTECTION_KEY)<<8) & 0xFFFE);
  // Enable software source counter start
  R_GPT3->GTSSR_b.CSTRT = 1;
  // Enable software source counter stop
  R_GPT3->GTPSR_b.CSTOP = 1;
  // Enable software source counter clear
  R_GPT3->GTCSR_b.CCLR = 1;
  // Set saw-wave PWM mode
  R_GPT3->GTCR_b.MD = 0;
  // Set prescaler
  R_GPT3->GTCR_b.TPCS = 5;   //>>> mismatch with documentation (expected value is right-shifted by 1)
  // Set counting in up-direction
  R_GPT3->GTUDDTYC_b.UD = 1;
  // Set maximum counter value
  R_GPT3->GTPR = 0x0000FADE;
  // Clear current counter value
  R_GPT3->GTCNT = 0x00000000;      // alternatively: R_GPT3->GTCLR_b.CCLR0 = 1;
  // Reset interrupt flag
  R_GPT3->GTST_b.TCFPO = 0;  
  // Start timer
  R_GPT3->GTSTR_b.CSTRT0 = 1;
  R_GPT3->GTCR_b.CST = 1;
}



/**********************************/
/*** INTERRUPT SERVICE ROUTINES ***/
/**********************************/

void ISR_GPT3_OVF( void )
{
  // Clear interrupt flag
  R_ICU->IELSR_b[IRQn_OVF3].IR = 0;
  // Toggle built-in flag
  Gpio_ToggleDigitalPin(GPIO_BUILT_IN_LED);


//  static uint16_t cnt = 0;
//
//  if (1000 == cnt)
//  {
//    cnt = 0;
//    Serial.print("\n ISR #");
//    Serial.println(cnt, DEC);
//  }
//  else
//  {
//    cnt++;
//  }
}






