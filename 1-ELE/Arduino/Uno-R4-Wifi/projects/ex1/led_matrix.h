
#ifndef LED_MATRIX_H
#define LED_MATRIX_H


/****************/
/*** INCLUDES ***/
/****************/

#include "gpio.h"
#include "system.h"



/***************/
/*** DEFINES ***/
/***************/

// List of LED matrix rows (name, MCU pin)
#define LIST_OF_LED_MATRIX_ROWS(ENTRY)  \
  ENTRY( 0,  205 ),                     \
  ENTRY( 1,  012 ),                     \
  ENTRY( 2,  013 ),                     \
  ENTRY( 3,  206 ),                     \
  ENTRY( 4,  003 ),                     \
  ENTRY( 5,  204 ),                     \
  ENTRY( 6,  015 ),                     \
  ENTRY( 7,  004 ),                     \
  ENTRY( 8,  011 ),                     \
  ENTRY( 9,  213 ),                     \
  ENTRY( 10, 212 ),

#define DEF_LED_MATRIX_ROW_IDX(num, ...) LED_MATRIX_ROW_##num##_IDX
#define DEF_LED_MATRIX_ROW_PIN(num, ...) LED_MATRIX_ROW_##num##_PIN
#define DEF_LED_MATRIX_ROW_MAP(num, gpio) LED_MATRIX_ROW_##num##_PIN = GPIO_P##gpio

// List of LED matrix pixels (name, anode row pin, cathode row pin)
#define LIST_OF_LED_MATRIX_PIXELS(ENTRY)  \
  ENTRY( 1,   0,  1 ),                    \
  ENTRY( 2,   1,  0 ),                    \
  ENTRY( 3,   0,  2 ),                    \
  ENTRY( 4,   2,  0 ),                    \
  ENTRY( 5,   1,  2 ),                    \
  ENTRY( 6,   2,  1 ),                    \
  ENTRY( 7,   0,  3 ),                    \
  ENTRY( 8,   3,  0 ),                    \
  ENTRY( 9,   1,  3 ),                    \
  ENTRY( 10,  3,  1 ),                    \
  ENTRY( 11,  2,  3 ),                    \
  ENTRY( 12,  3,  2 ),

#define DEF_LED_MATRIX_PIXEL_NAME(num, ...) LED_MATRIX_PIXEL_##num
#define DEF_LED_MATRIX_PIXEL_MAP(num, ano, cat) {.anode = LED_MATRIX_ROW_##ano##_PIN, .cathode = LED_MATRIX_ROW_##cat##_PIN}



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  LIST_OF_LED_MATRIX_ROWS(DEF_LED_MATRIX_ROW_MAP)
} led_matrix_row_pin_t;

typedef enum
{
  LIST_OF_LED_MATRIX_ROWS(DEF_LED_MATRIX_ROW_IDX)
  LED_MATRIX_ROW_NUM
} led_matrix_row_idx_t;

typedef struct
{
  led_matrix_row_pin_t anode;
  led_matrix_row_pin_t cathode;
} led_pixel_t;

typedef enum
{
  LIST_OF_LED_MATRIX_PIXELS(DEF_LED_MATRIX_PIXEL_NAME)
  LED_MATRIX_PIXEL_NUM
} led_matrix_pixel_t;



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

void LedMatrix_InitializePixels( void );
void LedMatrix_SetPixelLevel( led_matrix_pixel_t pxIdx, gpio_level_t level );


#endif
