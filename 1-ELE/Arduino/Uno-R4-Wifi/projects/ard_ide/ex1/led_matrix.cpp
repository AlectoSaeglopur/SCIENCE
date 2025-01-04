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



/***************/
/*** DEFINES ***/
/***************/


/*****************/
/*** CONSTANTS ***/
/*****************/

static const led_matrix_row_pin_t ROWS_ARRAY[LED_MATRIX_ROW_NUM] = {LIST_OF_LED_MATRIX_ROWS(DEF_LED_MATRIX_ROW_PIN)};
static const led_pixel_t PIXELS_ARRAY[LED_MATRIX_PIXEL_NUM] = {LIST_OF_LED_MATRIX_PIXELS(DEF_LED_MATRIX_PIXEL_MAP)};



/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/



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
  #define PRC_KEY 0xA500

///    // Enable writing to clock registers
///    R_SYSTEM->PRCR = PRC_KEY | 0x0001;
///  
///  //  // Select middle-speed on-chip oscillator (8 MHz)
///  //  R_SYSTEM->SCKSCR_b.CKSEL = 1;
///  //  // Set clock divider to 64 for PCKD
///    R_SYSTEM->SCKDIVCR_b.PCKD = 6;
///  //  // Enable MOCO
///  //  R_SYSTEM->MOCOCR_b.MCSTP = 0;

//  Serial.print(R_SYSTEM->PRCR, HEX);  // >> x1
//  Serial.print(" | ");
//  Serial.print(R_SYSTEM->SCKSCR, HEX);  // >> x0, i.e. HOCO
//  Serial.print(" | ");
//  Serial.println(R_SYSTEM->SCKDIVCR, HEX);  // >> x10010106

// -------------------------------------

#define MYTIMER R_GPT3

  // Enable GTP modules
  R_MSTP->MSTPCRD_b.MSTPD5 = 0;
  R_MSTP->MSTPCRD_b.MSTPD6 = 0;

  // Unlock timer registers writing
  MYTIMER->GTWP = (uint32_t)(PRC_KEY & 0xFFFE);

  // Enable software source counter start
  MYTIMER->GTSSR_b.CSTRT = 1;
  // Enable software source counter stop
  MYTIMER->GTPSR_b.CSTOP = 1;
  // Enable software source counter clear
  MYTIMER->GTCSR_b.CCLR = 1;
 
// ok so far...

  

  // Set saw-wave PWM mode
  MYTIMER->GTCR_b.MD = 0;
  // Set prescaler
  MYTIMER->GTCR_b.TPCS = 4;   //>>> mismatch with documentation (expected value is right-shifted by 1)

  // Set counting in up-direction
  MYTIMER->GTUDDTYC_b.UD = 1;

  // Set maximum counter value
  MYTIMER->GTPR = 0x00005678;

  // Reset current counter value
  MYTIMER->GTCNT = 0x00000000;




  // ... go on from 22.2.18

// How to set-up GTP interruots: https://forum.arduino.cc/t/enabling-compare-match-interrupts-for-gpt-on-arduino-r4-wifi/1331688
// READ HERE:  file:///C:/Renesas/RA/e2studio_v2024-10_fsp_v5.7.0/fsp_documentation/v5.7.0/fsp_user_manual_v5.7.0/index.html



//  clear interrupt flag here : GTST


  // Clear timer
  MYTIMER->GTCLR_b.CCLR0 = 1;

  // Start timer
  MYTIMER->GTSTR_b.CSTRT0 = 1;  //NB: requires GTSSR to be asserted first!
  MYTIMER->GTCR_b.CST = 1; // >> actual start



  // Relock registers writing
//  R_GPT3->GTWP_b.WP = 1;


  // Reset interrupt flag
//  R_GPT3->GTST_b.TCFPO = 0;

//R_ICU->IELSR13 = 0xFFFFFFFF;

//R_ICU->IELSR_b[13].IELS = 0x00;  //>> 0 or 1 to be used???

//R_IELSR2;

//ICU.IELSR28 4000 6370h, ICU.IELSR29 4000 6374h, ICU.IELSR30 4000 6378h,
//
//75h




}

 void GPT3_OVF( void )
 {
  Gpio_SetPinLevel(GPIO_BUILT_IN_LED, GPIO_LEV_HIGH);

  // raset flag?
  // enable interrupt?
  // set interrupt priority?

  //Chap.13
  //IELSRn ??
 }



 void LedMatrix_InitializeTimer2( void )
 {
  //https://forum.arduino.cc/t/using-gpt-to-drive-a-step-pulse/1196139/3

///  // enable in Master stop register
///  R_MSTP->MSTPCRD &= ~(1 << R_MSTP_MSTPCRD_MSTPD6_Pos);
  // Enable GTP modules
  R_MSTP->MSTPCRD_b.MSTPD5 = 0;
  R_MSTP->MSTPCRD_b.MSTPD6 = 0;

///  // enable Write GTWP
///  R_GPT3->GTWP = 0xA500;
  // Unlock timer registers writing
  MYTIMER->GTWP = (uint32_t)PRC_KEY;

///  // set count direction GTUDDTYC
///  R_GPT3->GTUDDTYC = 0x00000001;
  // Set counting in up-direction
  MYTIMER->GTUDDTYC_b.UD = 1;

///  //Select count clock GTCR  1/64 prescaler
///  R_GPT3->GTCR = 0x03000000;
  // Set prescaler to 1:64
  MYTIMER->GTCR_b.TPCS = 3;

  //Set Cycle GTPR
  R_GPT3->GTPR = 0x4321;
///  R_GPT3->GTPBR = 0x01234;

  //Set initial value GTCNT
  R_GPT3->GTCNT = 0;

  //set GTIOC pin function GTIOR
  R_GPT3->GTIOR = 0x00000009;

  //Enable GTIOC pin GTIOR
  R_GPT3->GTIOR |= 0x100;

  //Set buffer ops GTBER
  R_GPT3->GTBER = 0x010001;

  //Set compare match GTCCRA / GTCCRB
  R_GPT3->GTCCR[0] = 5;

  //Set Buffer Values GTCCRC / GTCCRE and GTCCRD / GTCCRF
  // Not applicable to our situation

  //Start count operation GTCR.CST = 1
  R_GPT3->GTCR |= 1;

}




/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

