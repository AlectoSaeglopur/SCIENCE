/**
 * @file error.c
 * @author Filippo Valmori
 * @date 26/08/2024
 * @ingroup TLC_CHAIN
 * @brief Error library
 * 
 * Library containing error handling functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"



/************************/
/*** PUBLIC FUNCTIONS ***/
/************************/

/**
 * @brief <i> Function for handling detected error. </i>
 * 
 * @param inErr: detected error
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
        printf("\n >> WARNING: DETECTED ALARM #%d\n",inErr);
        break;
      case ALARM_STOP:
        printf("\n >> ERROR: DETECTED ALARM #%d\n",inErr);
        exit(EXIT_FAILURE);
        break;
      default:
        // do nothing
        break;
    }
  }

  return inErr;
}
