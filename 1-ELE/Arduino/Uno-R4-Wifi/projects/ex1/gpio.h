
#ifndef GPIO_H
#define GPIO_H


#include "system.h"

// Sectors definition
#define LIST_OF_SECTORS(ENTRY)  \
  ENTRY( 0 ),                   \
  ENTRY( 1 ),                   \
  ENTRY( 2 ),                   \
  ENTRY( 3 ),                   \
  ENTRY( 4 ),                   \
  ENTRY( 5 ),                   \
  ENTRY( 6 ),                   \
  ENTRY( 7 ),                   \
  ENTRY( 8 ),                   \
  ENTRY( 9 ),

#define DEF_SECTOR_IDX(num) SECTOR_IDX_##num = num

typedef enum
{
  LIST_OF_SECTORS(DEF_SECTOR_IDX)
  SECTOR_IDX_NUM
} sector_idx_t;

#define DEF_SECTOR_ADR(num) R_PORT##num##_BASE



// Pins definition
#define LIST_OF_PINS(ENTRY)   \
  ENTRY( 000 ),               \
  ENTRY( 001 ),               \
  ENTRY( 002 ),               \
  ENTRY( 003 ),               \
  ENTRY( 004 ),               \
  ENTRY( 011 ),               \
  ENTRY( 012 ),               \
  ENTRY( 013 ),               \
  ENTRY( 014 ),               \
  ENTRY( 015 ),               \
  ENTRY( 100 ),               \
  ENTRY( 101 ),               \
  ENTRY( 102 ),   /* P102_SPI0_RSPCK_GPT2_B_CAN0_RX >> D13/SCK */  \
  ENTRY( 103 ),               \
  ENTRY( 104 ),               \
  ENTRY( 105 ),               \
  ENTRY( 106 ),               \
  ENTRY( 107 ),               \
  ENTRY( 109 ),               \
  ENTRY( 110 ),               \
  ENTRY( 111 ),               \
  ENTRY( 112 ),               \
  ENTRY( 204 ),               \
  ENTRY( 205 ),               \
  ENTRY( 206 ),               \
  ENTRY( 213 ),               \
  ENTRY( 304 )


#define DEF_GPIO_ID(num) GPIO_P##num = num

typedef enum
{
  LIST_OF_PINS(DEF_GPIO_ID)
} gpio_id_t;


#define SECTOR_DIVIDER    ((uint16_t) 100)
#define NUM_PINS_PER_SECTOR   ((uint16_t) 16)


typedef enum
{
  GPIO_TYPE_DIGITAL = 0,
  GPIO_TYPE_ANALOG = 1,
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


#define GPIO_BUILT_IN_LED  GPIO_P102


/*************************/
/*** PUBLIC PROTOTYPES ***/
/*************************/

gpio_type_t Gpio_GetPinType( gpio_id_t pinId );

gpio_direction_t Gpio_GetPinDirection( gpio_id_t pinId );
void Gpio_SetPinDirection( gpio_id_t pinId, gpio_direction_t pinDir );

gpio_level_t Gpio_GetPinLevel( gpio_id_t pinId );
void Gpio_SetPinLevel( gpio_id_t pinId, gpio_level_t pinLev );
void Gpio_ToggleDigitalPin( gpio_id_t pinId );


#endif