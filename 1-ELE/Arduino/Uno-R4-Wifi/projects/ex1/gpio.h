
#ifndef GPIO_H
#define GPIO_H


/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



/***************/
/*** DEFINES ***/
/***************/

#define GPIO_BUILT_IN_LED       GPIO_P102

#define SECTOR_DIVIDER          ((uint16_t) 100)
#define NUM_PINS_PER_SECTOR     ((uint16_t) 16)

// Pins definition
#define LIST_OF_PINS(ENTRY)   \
  ENTRY( 000, 0 ),            \
  ENTRY( 001, 1 ),            \
  ENTRY( 002, 2 ),            \
  ENTRY( 003, 3 ),            \
  ENTRY( 004, 4  ),           \
  ENTRY( 011, 11 ),           \
  ENTRY( 012, 12 ),           \
  ENTRY( 013, 13 ),           \
  ENTRY( 014, 14 ),           \
  ENTRY( 015, 15 ),           \
  ENTRY( 100, 100 ),          \
  ENTRY( 101, 101 ),          \
  ENTRY( 102, 102 ),   /* P102_SPI0_RSPCK_GPT2_B_CAN0_RX >> D13/SCK */  \
  ENTRY( 103, 103 ),          \
  ENTRY( 104, 104 ),          \
  ENTRY( 105, 105 ),          \
  ENTRY( 106, 106 ),          \
  ENTRY( 107, 107 ),          \
  ENTRY( 109, 109 ),          \
  ENTRY( 110, 110 ),          \
  ENTRY( 111, 111 ),          \
  ENTRY( 112, 112 ),          \
  ENTRY( 201, 201 ),          \
  ENTRY( 204, 204 ),          \
  ENTRY( 205, 205 ),          \
  ENTRY( 206, 206 ),          \
  ENTRY( 212, 212 ),          \
  ENTRY( 213, 213 ),          \
  ENTRY( 301, 301 ),          \
  ENTRY( 302, 302 ),          \
  ENTRY( 303, 303 ),          \
  ENTRY( 304, 304 )

#define DEF_GPIO_ID(id, num) GPIO_P##id = num
#define DEF_GPIO_NAME(id, ...) GPIO_P##id



/****************/
/*** TYPEDEFS ***/
/****************/

typedef enum
{
  LIST_OF_PINS(DEF_GPIO_ID)
} gpio_number_t;

typedef enum
{
  GPIO_TYP_DIGITAL = 0,
  GPIO_TYP_ANALOG = 1,
  GPIO_TYP_INVALID = 255,
} gpio_type_t;

typedef enum
{
  GPIO_DIR_INPUT = 0,
  GPIO_DIR_OUTPUT = 1,
  GPIO_DIR_INVALID = 255,
} gpio_direction_t;

typedef enum
{
  GPIO_LEV_LOW = 0,
  GPIO_LEV_HIGH = 1,
  GPIO_LEV_INVALID = 255,
} gpio_level_t;



/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

gpio_type_t Gpio_GetPinType( gpio_number_t pinNum );
void Gpio_SetPinType( gpio_number_t pinNum, gpio_type_t pinTyp );

gpio_direction_t Gpio_GetPinDirection( gpio_number_t pinNum );
void Gpio_SetPinDirection( gpio_number_t pinNum, gpio_direction_t pinDir );

gpio_level_t Gpio_GetPinLevel( gpio_number_t pinNum );
void Gpio_SetPinLevel( gpio_number_t pinNum, gpio_level_t pinLev );
void Gpio_ToggleDigitalPin( gpio_number_t pinNum );


#endif