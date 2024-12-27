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



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

