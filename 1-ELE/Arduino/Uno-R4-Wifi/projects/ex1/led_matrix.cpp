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
 * @brief <i> Function for initilizing LED matrix with all pixels off. </i>
 * 
 * @return none
 */
void LedMatrix_InitializePixels( void )
{
  uint8_t j;

  for (j=0; j<LED_MATRIX_ROW_NUM; j++)
  {
    Gpio_SetPinDirection((gpio_number_t)ROWS_ARRAY[j], GPIO_DIR_OUTPUT);
    Gpio_SetPinLevel((gpio_number_t)ROWS_ARRAY[j], GPIO_LEV_LOW);
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
void LedMatrix_SetPixelLevel( led_matrix_pixel_t pxIdx, gpio_level_t level )
{
  if (pxIdx < LED_MATRIX_PIXEL_NUM)
  {
    Gpio_SetPinLevel((gpio_number_t)PIXELS_ARRAY[pxIdx].cathode, GPIO_LEV_LOW);
    Gpio_SetPinLevel((gpio_number_t)PIXELS_ARRAY[pxIdx].anode, level);
  }
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

