
#ifndef SYSTEM_H
#define SYSTEM_H


/****************/
/*** INCLUDES ***/
/****************/

#include <Arduino.h>                                          /** - import all MCU libraries */
//#include <stdio.h>                                          /** - import standard i/o library */
//#include <stdbool.h>                                        /** - import boolean type library */
//#include <stdint.h>                                         /** - import integer types library */
//#include <string.h>                                         /** - import string library (e.g. to use "memcpy" and "memset" functions) */
//#include <stdlib.h>                                         /** - import random generation library */
//#include <time.h>                                           /** - import time library (e.g. to link random seed to actual time) */
//#include <math.h>                                           /** - import mathematical library (e.g. to use "sin/cos" and "log/exp" functions) */



/***************/
/*** DEFINES ***/
/***************/

#define LSBIT_MASK_U8           ((uint8_t) 0x01)
#define LSBIT_MASK_U16          ((uint16_t) 0x0001)
#define LSBIT_MASK_U32          ((uint32_t) 0x00000001)

#define NUM_ELEMENTS(x)         (sizeof(x)/sizeof(x[0]))

#define PRINT_BUFFER_SIZE       50u


#endif
