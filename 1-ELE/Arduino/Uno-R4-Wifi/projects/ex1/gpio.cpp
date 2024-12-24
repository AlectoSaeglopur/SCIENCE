/**
 * @file gpio.cpp
 * @author Filippo Valmori
 * @date 23/12/2024
 * @brief GPIO library
 * 
 * Library containing GPIO handling functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "gpio.h"



#define DIRECTION_MASK  ((uint32_t) (1 << 2))



/*****************/
/*** CONSTANTS ***/
/*****************/

static const uint32_t SECTORS_ADDRESS[SECTOR_IDX_NUM] = {LIST_OF_SECTORS(DEF_SECTOR_ADR)};



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for getting GPIO direction. </i>
 * 
 * @param[in] pinId GPIO identifier
 * 
 * @return GPIO direction
 */
gpio_direction_t Gpio_GetPinDirection( gpio_id_t pinName )
{
//  gpio_direction_t direction = GPIO_DIR_INVALID;
//  uint8_t sectorIdx = pinId / SECTOR_DIVIDER;
//  uint8_t pinIdx = pinId % SECTOR_DIVIDER;
//
//  if ((sectorIdx < SECTOR_IDX_NUM) && (pinIdx < NUM_PINS_PER_SECTOR))
//  {
//    if (0 == ((((R_PORT0_Type *)SECTORS_ADDRESS[sectorIdx])->PDR) & (LSBIT_MASK_U16<<pinIdx)))
//    {
//      direction = GPIO_DIR_INPUT;
//    }
//    else
//    {
//      direction = GPIO_DIR_OUTPUT;
//    }
//  }
//
//  return direction;

  gpio_direction_t pinDir = GPIO_DIR_INVALID;
  uint8_t sectIdx;
  uint8_t pinIdx;
  bool bRegVal;

  if (true == IsPinIdValid(pinName))
  {
    sectIdx = pinId / SECTOR_DIVIDER;
    pinIdx = pinId % SECTOR_DIVIDER;
    bRegVal = R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS & DIRECTION_MASK;
    pinDir = bRegVal ? GPIO_DIR_OUTPUT : GPIO_DIR_INPUT;
  }

  return direction;
}


/**
 * @brief <i> Function for setting GPIO direction. </i>
 * 
 * @param[in] pinId GPIO identifier
 * @param[in] pinDir direction to set
 * 
 * @return none
 */
void Gpio_SetPinDirection( gpio_id_t pinId, gpio_direction_t pinDir )
{
  uint8_t sectorIdx = pinId / SECTOR_DIVIDER;
  uint8_t pinIdx = pinId % SECTOR_DIVIDER;

  if ((sectorIdx < SECTOR_IDX_NUM) && (pinIdx < NUM_PINS_PER_SECTOR))
  {
    switch (pinDir)
    {
      case GPIO_DIR_INPUT:
        ((R_PORT0_Type *)SECTORS_ADDRESS[sectorIdx])->PDR &= ~(LSBIT_MASK_U16<<pinIdx);
        break;

      case GPIO_DIR_OUTPUT:
        ((R_PORT0_Type *)SECTORS_ADDRESS[sectorIdx])->PDR |= (LSBIT_MASK_U16<<pinIdx);
        break;

      default:
        // do nothing
        break;
    }
  }
}


/**
 * @brief <i> Function for getting digital GPIO level. </i>
 * 
 * @param[in] pinId GPIO identifier
 * 
 * @return GPIO level
 */
gpio_level_t Gpio_GetPinLevel( gpio_id_t pinId )
{
  gpio_level_t level = GPIO_LEV_INVALID;
  uint8_t sectorIdx = pinId / SECTOR_DIVIDER;
  uint8_t pinIdx = pinId % SECTOR_DIVIDER;

  if ((sectorIdx < SECTOR_IDX_NUM) && (pinIdx < NUM_PINS_PER_SECTOR))
  {
    if (0 == ((((R_PORT0_Type *)SECTORS_ADDRESS[sectorIdx])->PIDR) & (LSBIT_MASK_U16<<pinIdx)))
    {
      level = GPIO_LEV_LOW;
    }
    else
    {
      level = GPIO_LEV_HIGH;
    }
  }

  return level;
}


/**
 * @brief <i> Function for setting digital GPIO level. </i>
 * 
 * @param[in] pinId GPIO identifier
 * @param[in] pinLev level to set
 * 
 * @return none
 */
void Gpio_SetPinLevel( gpio_id_t pinId, gpio_level_t pinLev )
{
  uint8_t sectorIdx = pinId / SECTOR_DIVIDER;
  uint8_t pinIdx = pinId % SECTOR_DIVIDER;

  if ((sectorIdx < SECTOR_IDX_NUM) && (pinIdx < NUM_PINS_PER_SECTOR))
  {
    switch (pinLev)
    {
      case GPIO_LEV_LOW:
        ((R_PORT0_Type *)SECTORS_ADDRESS[sectorIdx])->PODR &= ~(LSBIT_MASK_U16<<pinIdx);
        break;

      case GPIO_LEV_HIGH:
        ((R_PORT0_Type *)SECTORS_ADDRESS[sectorIdx])->PODR |= (LSBIT_MASK_U16<<pinIdx);
        break;

      default:
        // do nothing
        break;
    }
  }
}


/**
 * @brief <i> Function for toggling digital GPIO level. </i>
 * 
 * @param[in] pinId GPIO identifier
 * 
 * @return none
 */
void Gpio_ToggleDigitalPin( gpio_id_t pinId )
{
  gpio_level_t pinLev = Gpio_GetPinLevel(pinId);

  switch (pinLev)
  {
    case GPIO_LEV_LOW:
      Gpio_SetPinLevel(pinId, GPIO_LEV_HIGH);
      break;

    case GPIO_LEV_HIGH:
      Gpio_SetPinLevel(pinId, GPIO_LEV_LOW);
      break;

    default:
      // do nothing
      break;
  }
}




gpio_type_t Gpio_GetPinType( gpio_id_t pinId )
{
  gpio_type_t type = GPIO_TYP_INVALID;
  uint8_t sectorIdx = pinId / SECTOR_DIVIDER;
  uint8_t pinIdx = pinId % SECTOR_DIVIDER;

  char printStr[PRINT_BUFFER_SIZE];

  
  sprintf (printStr, "ID: %u | Sec: %u | Idx: %u", pinId, sectorIdx, pinIdx);
  Serial.println (printStr);

  
  
  sprintf (printStr, "#%u: 0x%X", pinId, R_PFS->PORT[sectorIdx].PIN[pinIdx].PmnPFS);
  Serial.println (printStr);


  R_PFS->PORT[0].PIN[12].PmnPFS |= 0x00000005;


  return type;
}
