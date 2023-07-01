/**
 * @file gpio.c
 * @author Filippo Valmori
 * @date 23/03/2023
 * @ingroup BSP_C
 * @brief GPIO LIBRARY
 * 
 * Script containing GPIO setting functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"
#include "gpio.h"



/*****************/
/*** FUNCTIONS ***/
/*****************/

/**
 * @brief <i> Function to initialize GPIO settings. </i>
 * @param PinId 2-element array specifying GPIO sector and number
 * @param Param Structure containing all configuration parameters 
 */
void Config_GPIO( uint8_t *PinId, gpio_t Param ){
    uint8_t Sect = PinId[0];                                                    /** - Retrieve pin sector */
    uint8_t Numb = PinId[1];                                                    /** - Retrieve pin number */
    uint16_t Mask = (0x0001u)<<Numb;
    if( (Numb < xN_PPS) && (Sect < xN_SECT) ){
        /* Analog-digital setting */
        if( Param.AnaDig == xANALOG ){
            xREG(xANSEL[Sect]) |= Mask;
        } else if( Param.AnaDig == xDIGITAL ){
            xREG(xANSEL[Sect]) &= ~Mask;
        } else {
            Set_ErrFlag(ERR_GPIO_INV_AD);
        }
        /* Input-output setting */
        if( Param.InOut == xINPUT ){
            xREG(xTRIS[Sect]) |= Mask;
        } else if( Param.InOut == xOUTPUT ){
            xREG(xTRIS[Sect]) &= ~Mask;
        } else {
            Set_ErrFlag(ERR_GPIO_INV_IO);
        }
        if( (Param.AnaDig == xDIGITAL) && (Param.InOut == xINPUT) ){
            /* Pull-down setting */
            if( Param.PullDw == xENABLE ){
                xREG(xCNPD[Sect]) |= Mask;
            } else if( Param.PullDw == xDISABLE ){
                xREG(xCNPD[Sect]) &= ~Mask;
            } else {
                Set_ErrFlag(ERR_GPIO_INV_PD);
            }
            /* Pull-up setting */
            if( (Param.PullUp == xENABLE) && (Param.PullDw == xDISABLE) ){
                xREG(xCNPU[Sect]) |= Mask;
            } else if( Param.PullUp == xDISABLE ){
                xREG(xCNPU[Sect]) &= ~Mask;
            } else {
                Set_ErrFlag(ERR_GPIO_INV_PU);
            }
            
            /* Change-notification enable #0 setting */
            if( Param.CnEn0 == xENABLE ){
                xREG(xCNEN0[Sect]) |= Mask;                
            } else if( Param.CnEn0 == xDISABLE ){
                xREG(xCNEN0[Sect]) &= ~Mask;
            } else {
                Set_ErrFlag(ERR_GPIO_INV_CN);
            }
            /* Change-notification enable #1 setting */
            if( Param.CnEn1 == xENABLE ){
                xREG(xCNEN1[Sect]) |= Mask;                
            } else if( Param.CnEn1 == xDISABLE ){
                xREG(xCNEN1[Sect]) &= ~Mask;
            } else {
                Set_ErrFlag(ERR_GPIO_INV_CN);
            }
        } else {
            xREG(xCNPD[Sect]) &= ~Mask;                                         /** - Disable pull-down by default for analog and/or output GPIOs */
            xREG(xCNPU[Sect]) &= ~Mask;                                         /** - Disable pull-up by default for analog and/or output GPIOs */
            xREG(xCNEN0[Sect]) &= ~Mask;                                        /** - Disable change-notification enable #0 by default for analog and/or output GPIOs */
            xREG(xCNEN1[Sect]) &= ~Mask;                                        /** - Disable change-notification enable #1 by default for analog and/or output GPIOs */
        }
        /* Open-drain setting */
        if( Param.InOut == xOUTPUT ){
            if( Param.OpenDr == xENABLE ){
                xREG(xODC[Sect]) |= Mask;
            } else if( Param.OpenDr == xDISABLE ){
                xREG(xODC[Sect]) &= ~Mask;
            } else {
                Set_ErrFlag(ERR_GPIO_INV_OD);
            }
        } else {
            xREG(xODC[Sect]) &= ~Mask;                                          /** - Disable open-drain collector by default for input GPIOs */
        }
    } else {
        Set_ErrFlag(ERR_GPIO_INV_SN);
    }

}


/**
 * @brief <i> Function to read the state of specified input digital pin. </i>
 * @param PinId 2-element array specifying GPIO sector and number
 * @return GPIO level read (HIGH or LOW)
 */
uint8_t Get_GPIO( uint8_t *PinId ){
    uint8_t Sect = PinId[0];
    uint8_t Numb = PinId[1];
    uint16_t Mask = 0x0001;
    uint8_t Val = 0xFF;
    if( (Numb < xN_PPS) && (Sect < xN_SECT) ){
        Val = (uint8_t)((xREG(xPORT[Sect])>>Numb)&Mask);
    } else {
        Set_ErrFlag(ERR_GPIO_INV_SN);
    }
    return Val;
}


/**
 * @brief <i> Function to write the state of specified input digital pin. </i>
 * @param PinId 2-element array specifying GPIO sector and number
 * @param State GPIO level to be set (HIGH or LOW)
 */
void Set_GPIO( uint8_t *PinId, uint8_t State ){
    uint8_t Sect = PinId[0];
    uint8_t Numb = PinId[1];
    uint16_t Mask = (0x0001u)<<Numb;
    if( (State == xLOW) || (State == xHIGH) ){
        if( (Numb < xN_PPS) && (Sect < xN_SECT) ){
            if( State == xHIGH ){
                xREG(xLAT[Sect]) |= Mask;
            } else {
                xREG(xLAT[Sect]) &= ~Mask;
            }
        } else {
            Set_ErrFlag(ERR_GPIO_INV_SN);
        }
    } else {
        Set_ErrFlag(ERR_GPIO_INV_LV);
    }
}


/**
 * @brief <i> Function to toggle the state of specified output digital pin. </i>
 * @param PinId 2-element array specifying GPIO sector and number
 */
void Toggle_GPIO( uint8_t *PinId ){
    uint8_t Sect = PinId[0];
    uint8_t Numb = PinId[1];
    uint16_t Mask = (0x0001u)<<Numb;
    if( (Numb < xN_PPS) && (Sect < xN_SECT) ){
        if( Get_GPIO(PinId) == xLOW ){
            xREG(xLAT[Sect]) |= Mask;
        } else {
            xREG(xLAT[Sect]) &= ~Mask;
        }
    } else {
        Set_ErrFlag(ERR_GPIO_INV_SN);
    }

}


/**
 * @brief <i> Function to unlock GPIOs and PPS assignments configuration. </i>
 */
void Unlock_GPIOs( void ){
    __builtin_write_OSCCONL(OSCCON&(~0x40));                                    /** - Invoke built-in function to unlock pins configuration (IOLOCK=0) */
}


/**
 * @brief <i> Function to lock GPIOs and PPS assignments configuration. </i>
 */
void Lock_GPIOs( void ){
    __builtin_write_OSCCONL(OSCCON|0x40);                                       /** - Invoke built-in function to lock pins configuration (IOLOCK=1) */
}
