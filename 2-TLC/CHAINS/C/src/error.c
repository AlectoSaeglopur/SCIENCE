/**
 * @file error.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup TLC_CHAIN
 * @brief Error library
 * 
 * Library containing error handling functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "debug.h"
#include "error.h"




/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for handling detected error. </i>
 * 
 * @param[in] inErr detected error
 * 
 * @return error ID
 */
error_t Error_HandleErr( error_t inErr )
{
  if (ERR_NONE != inErr)
  {
    switch (ALARM_TYPE)
    {
      case ALARM_PRINT:
        Debug_SetTerminalAppearance(COLOR_ERROR,STYLE_ERROR);
        printf(" >> WARNING: DETECTED ALARM #%d\n",inErr);
        Debug_PrintWatermarks();
        Debug_ResetTerminalAppearance();
        Debug_SetTerminalAppearance(COLOR_DEFAULT,STYLE_DEFAULT);
        break;

      case ALARM_STOP:
        Debug_SetTerminalAppearance(COLOR_ERROR,STYLE_ERROR);
        printf(" >> ERROR: DETECTED ALARM #%d\n",inErr);
        Debug_PrintWatermarks();
        Debug_ResetTerminalAppearance();
        exit(EXIT_FAILURE);
        break;

      default:
        // do nothing
        break;
    }
  }

  return inErr;
}
