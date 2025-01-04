
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
  ENTRY(  0, 205 ),                     \
  ENTRY(  1, 012 ),                     \
  ENTRY(  2, 013 ),                     \
  ENTRY(  3, 206 ),                     \
  ENTRY(  4, 003 ),                     \
  ENTRY(  5, 204 ),                     \
  ENTRY(  6, 015 ),                     \
  ENTRY(  7, 004 ),                     \
  ENTRY(  8, 011 ),                     \
  ENTRY(  9, 213 ),                     \
  ENTRY( 10, 212 ),

#define DEF_LED_MATRIX_ROW_IDX(num, ...) LED_MATRIX_ROW_##num##_IDX
#define DEF_LED_MATRIX_ROW_PIN(num, ...) LED_MATRIX_ROW_##num##_PIN
#define DEF_LED_MATRIX_ROW_MAP(num, gpio) LED_MATRIX_ROW_##num##_PIN = GPIO_P##gpio

// List of LED matrix pixels (name, anode row pin, cathode row pin)
#define LIST_OF_LED_MATRIX_PIXELS(ENTRY)  \
  ENTRY(  1,  0,  1 ),                    \
  ENTRY(  2,  1,  0 ),                    \
  ENTRY(  3,  0,  2 ),                    \
  ENTRY(  4,  2,  0 ),                    \
  ENTRY(  5,  1,  2 ),                    \
  ENTRY(  6,  2,  1 ),                    \
  ENTRY(  7,  0,  3 ),                    \
  ENTRY(  8,  3,  0 ),                    \
  ENTRY(  9,  1,  3 ),                    \
  ENTRY( 10,  3,  1 ),                    \
  ENTRY( 11,  2,  3 ),                    \
  ENTRY( 12,  3,  2 ),                    \
  ENTRY( 13,  0,  4 ),                    \
  ENTRY( 14,  4,  0 ),                    \
  ENTRY( 15,  1,  4 ),                    \
  ENTRY( 16,  4,  1 ),                    \
  ENTRY( 17,  2,  4 ),                    \
  ENTRY( 18,  4,  2 ),                    \
  ENTRY( 19,  3,  4 ),                    \
  ENTRY( 20,  4,  3 ),                    \
  ENTRY( 21,  0,  5 ),                    \
  ENTRY( 22,  5,  0 ),                    \
  ENTRY( 23,  1,  5 ),                    \
  ENTRY( 24,  5,  1 ),                    \
  ENTRY( 25,  2,  5 ),                    \
  ENTRY( 26,  5,  2 ),                    \
  ENTRY( 27,  3,  5 ),                    \
  ENTRY( 28,  5,  3 ),                    \
  ENTRY( 29,  4,  5 ),                    \
  ENTRY( 30,  5,  4 ),                    \
  ENTRY( 31,  0,  6 ),                    \
  ENTRY( 32,  6,  0 ),                    \
  ENTRY( 33,  1,  6 ),                    \
  ENTRY( 34,  6,  1 ),                    \
  ENTRY( 35,  2,  6 ),                    \
  ENTRY( 36,  6,  2 ),                    \
  ENTRY( 37,  3,  6 ),                    \
  ENTRY( 38,  6,  3 ),                    \
  ENTRY( 39,  4,  6 ),                    \
  ENTRY( 40,  6,  4 ),                    \
  ENTRY( 41,  5,  6 ),                    \
  ENTRY( 42,  6,  5 ),                    \
  ENTRY( 43,  0,  7 ),                    \
  ENTRY( 44,  7,  0 ),                    \
  ENTRY( 45,  1,  7 ),                    \
  ENTRY( 46,  7,  1 ),                    \
  ENTRY( 47,  2,  7 ),                    \
  ENTRY( 48,  7,  2 ),                    \
  ENTRY( 49,  3,  7 ),                    \
  ENTRY( 50,  7,  3 ),                    \
  ENTRY( 51,  4,  7 ),                    \
  ENTRY( 52,  7,  4 ),                    \
  ENTRY( 53,  5,  7 ),                    \
  ENTRY( 54,  7,  5 ),                    \
  ENTRY( 55,  6,  7 ),                    \
  ENTRY( 56,  7,  6 ),                    \
  ENTRY( 57,  0,  8 ),                    \
  ENTRY( 58,  8,  0 ),                    \
  ENTRY( 59,  1,  8 ),                    \
  ENTRY( 60,  8,  1 ),                    \
  ENTRY( 61,  2,  8 ),                    \
  ENTRY( 62,  8,  2 ),                    \
  ENTRY( 63,  3,  8 ),                    \
  ENTRY( 64,  8,  3 ),                    \
  ENTRY( 65,  4,  8 ),                    \
  ENTRY( 66,  8,  4 ),                    \
  ENTRY( 67,  5,  8 ),                    \
  ENTRY( 68,  8,  5 ),                    \
  ENTRY( 69,  6,  8 ),                    \
  ENTRY( 70,  8,  6 ),                    \
  ENTRY( 71,  7,  8 ),                    \
  ENTRY( 72,  8,  7 ),                    \
  ENTRY( 73,  0,  9 ),                    \
  ENTRY( 74,  9,  0 ),                    \
  ENTRY( 75,  1,  9 ),                    \
  ENTRY( 76,  9,  1 ),                    \
  ENTRY( 77,  2,  9 ),                    \
  ENTRY( 78,  9,  2 ),                    \
  ENTRY( 79,  3,  9 ),                    \
  ENTRY( 80,  9,  3 ),                    \
  ENTRY( 81,  4,  9 ),                    \
  ENTRY( 82,  9,  4 ),                    \
  ENTRY( 83,  5,  9 ),                    \
  ENTRY( 84,  9,  5 ),                    \
  ENTRY( 85,  6,  9 ),                    \
  ENTRY( 86,  9,  6 ),                    \
  ENTRY( 87,  7,  9 ),                    \
  ENTRY( 88,  9,  7 ),                    \
  ENTRY( 89,  8,  9 ),                    \
  ENTRY( 90,  9,  8 ),                    \
  ENTRY( 91,  0, 10 ),                    \
  ENTRY( 92, 10,  0 ),                    \
  ENTRY( 93,  1, 10 ),                    \
  ENTRY( 94, 10,  1 ),                    \
  ENTRY( 95,  2, 10 ),                    \
  ENTRY( 96, 10,  2 ),

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

typedef enum
{
  LED_MATRIX_SIZE_ROWS = 8,
  LED_MATRIX_SIZE_COLS = 12
} led_matrix_size_t;



/******************/
/*** CHARACTERS ***/
/******************/

#define SYMBOL_C  ((uint8_t[]) {0x3C, 0x42, 0x42, 0x24})
#define SYMBOL_I  ((uint8_t[]) {0x7E})
#define SYMBOL_O  ((uint8_t[]) {0x3C, 0x42, 0x42, 0x3C})



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

void LedMatrix_InitializePixels( void );
void LedMatrix_InitializeTimer( void );
void LedMatrix_SwitchOnPixel( led_matrix_pixel_t pxIdx );


#endif
