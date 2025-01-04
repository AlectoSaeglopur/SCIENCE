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



/***************/
/*** DEFINES ***/
/***************/

#define PODR_MASK   (LSBIT_MASK_U32 << 0)           // set-level mask (R/W)
#define PIDR_MASK   (LSBIT_MASK_U32 << 1)           // get-level mask (R)
#define PDR_MASK    (LSBIT_MASK_U32 << 2)           // direction mask (R/W)
#define ASEL_MASK   (LSBIT_MASK_U32 << 15)          // type mask (R/W)
#define PRM_MASK    (LSBIT_MASK_U32 << 16)          // mode mask (R/W)



/*****************/
/*** CONSTANTS ***/
/*****************/

static const gpio_number_t AVAILABLE_GPIOS[] = {LIST_OF_PINS(DEF_GPIO_NAME)};


/**************************/
/*** PRIVATE PROTOTYPES ***/
/**************************/

static bool IsPinNumberValid( gpio_number_t pinNum);



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for getting GPIO type. </i>
 * 
 * @param[in] pinNum GPIO number
 * 
 * @return GPIO type
 */
gpio_type_t Gpio_GetPinType( gpio_number_t pinNum )
{
  gpio_type_t pinTyp = GPIO_TYP_INVALID;
  uint8_t sectIdx;
  uint8_t pinIdx;
  uint32_t regVal;

  if (true == IsPinNumberValid(pinNum))
  {
    sectIdx = pinNum / SECTOR_DIVIDER;
    pinIdx = pinNum % SECTOR_DIVIDER;
    regVal = R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS & ASEL_MASK;
    pinTyp = (0 == regVal) ? GPIO_TYP_DIGITAL : GPIO_TYP_ANALOG;
  }

  return pinTyp;
}


/**
 * @brief <i> Function for setting GPIO type. </i>
 * 
 * @param[in] pinNum GPIO number
 * @param[in] pinTyp type to set
 * 
 * @return none
 */
void Gpio_SetPinType( gpio_number_t pinNum, gpio_type_t pinTyp )
{
  uint8_t sectIdx;
  uint8_t pinIdx;

  if (true == IsPinNumberValid(pinNum))
  {
    sectIdx = pinNum / SECTOR_DIVIDER;
    pinIdx = pinNum % SECTOR_DIVIDER;

    switch (pinTyp)
    {
      case GPIO_TYP_DIGITAL:
        R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS &= (~ASEL_MASK);
        break;

      case GPIO_TYP_ANALOG:
        R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS |= ASEL_MASK;
        break;

      default:
        // do nothing
        break;
    }
  }
}

/**
 * @brief <i> Function for getting GPIO direction. </i>
 * 
 * @param[in] pinNum GPIO number
 * 
 * @return GPIO direction
 */
gpio_direction_t Gpio_GetPinDirection( gpio_number_t pinNum )
{
  gpio_direction_t pinDir = GPIO_DIR_INVALID;
  uint8_t sectIdx;
  uint8_t pinIdx;
  uint32_t regVal;

  if (true == IsPinNumberValid(pinNum))
  {
    sectIdx = pinNum / SECTOR_DIVIDER;
    pinIdx = pinNum % SECTOR_DIVIDER;
    regVal = R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS & PDR_MASK;
    pinDir = (0 == regVal) ? GPIO_DIR_INPUT : GPIO_DIR_OUTPUT;
  }

  return pinDir;
}


/**
 * @brief <i> Function for setting GPIO direction. </i>
 * 
 * @param[in] pinNum GPIO number
 * @param[in] pinDir direction to set
 * 
 * @return none
 */
void Gpio_SetPinDirection( gpio_number_t pinNum, gpio_direction_t pinDir )
{
  uint8_t sectIdx;
  uint8_t pinIdx;

  if (true == IsPinNumberValid(pinNum))
  {
    sectIdx = pinNum / SECTOR_DIVIDER;
    pinIdx = pinNum % SECTOR_DIVIDER;

    switch (pinDir)
    {
      case GPIO_DIR_INPUT:
        R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS &= (~PDR_MASK);
        break;

      case GPIO_DIR_OUTPUT:
        R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS |= PDR_MASK;
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
 * @param[in] pinNum GPIO number
 * 
 * @return GPIO level
 */
gpio_level_t Gpio_GetPinLevel( gpio_number_t pinNum )
{
  gpio_level_t pinLev = GPIO_LEV_INVALID;
  uint8_t sectIdx;
  uint8_t pinIdx;
  uint32_t regVal;

  if ((true == IsPinNumberValid(pinNum)) &&
      (GPIO_TYP_DIGITAL == Gpio_GetPinType(pinNum)))
  {
    sectIdx = pinNum / SECTOR_DIVIDER;
    pinIdx = pinNum % SECTOR_DIVIDER;
    regVal = R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS & PIDR_MASK;
    pinLev = (0 == regVal) ? GPIO_LEV_LOW : GPIO_LEV_HIGH;
  }

  return pinLev;
}


/**
 * @brief <i> Function for setting digital GPIO level. </i>
 * 
 * @param[in] pinNum GPIO number
 * @param[in] pinLev level to set
 * 
 * @return none
 */
void Gpio_SetPinLevel( gpio_number_t pinNum, gpio_level_t pinLev )
{
  uint8_t sectIdx;
  uint8_t pinIdx;

  if ((true == IsPinNumberValid(pinNum)) &&
      (GPIO_TYP_DIGITAL == Gpio_GetPinType(pinNum)) &&
      (GPIO_DIR_OUTPUT == Gpio_GetPinDirection(pinNum)))
  {
    sectIdx = pinNum / SECTOR_DIVIDER;
    pinIdx = pinNum % SECTOR_DIVIDER;

    switch (pinLev)
    {
      case GPIO_LEV_LOW:
        R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS &= (~PODR_MASK);
        break;

      case GPIO_LEV_HIGH:
        R_PFS->PORT[sectIdx].PIN[pinIdx].PmnPFS |= PODR_MASK;
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
 * @param[in] pinNum GPIO number
 * 
 * @return none
 */
void Gpio_ToggleDigitalPin( gpio_number_t pinNum )
{
  gpio_level_t pinLev = Gpio_GetPinLevel(pinNum);

  switch (pinLev)
  {
    case GPIO_LEV_LOW:
      Gpio_SetPinLevel(pinNum, GPIO_LEV_HIGH);
      break;

    case GPIO_LEV_HIGH:
      Gpio_SetPinLevel(pinNum, GPIO_LEV_LOW);
      break;

    default:
      // do nothing
      break;
  }
}



/*************************/
/*** PRIVATE FUNCTIONS ***/
/*************************/

/**
 * @brief <i> Function for checking if pin number is valid. </i>
 * 
 * @param[in] pinNum GPIO number
 * 
 * @return true if valid, false otherwise
 */
static bool IsPinNumberValid( gpio_number_t pinNum)
{
  bool bRet = false;
  uint16_t j;

  for (j=0; j<NUM_ELEMENTS(AVAILABLE_GPIOS); j++)
  {
    if (AVAILABLE_GPIOS[j] == pinNum)
    {
      bRet = true;
      break;
    }
  }

  return bRet;
}
