/**
 * @file error.c
 * @author Filippo Valmori
 * @date 30/03/2023
 * @ingroup BSP_C
 * @brief ERROR LIBRARY
 * 
 * Script containing error setting functions.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "error.h"



/*****************/
/*** VARIABLES ***/ 
/*****************/

static uint8_t ErrRegs[ERR_PG_SIZE] = {0};                                      //!< Master core error registers array



/*****************/
/*** FUNCTIONS ***/
/*****************/

/**
 * @brief <i> Function to assert an error flag within the error registers array. </i>
 * @param ErrId ID specifying page and mask of the error flag to be written 
 */
void Set_ErrFlag( uint16_t ErrId ){
    uint8_t Idx = (ErrId&0xFF00u)>>8;                                           /** - Retrieve error index */
    uint8_t Mask = (uint8_t)(ErrId&0x00FFu);                                    /** - Retrieve error mask */
    if( Idx < ERR_PG_SIZE ){                                                    /** - Check if index is within range */
        ErrRegs[Idx] |= Mask;                                                   /** - Assert error flag */
    }
}


/**
 * @brief <i> Function to retrieve a specific error flag within the error registers array. </i>
 * @param ErrId ID specifying page and mask of the error flag to be read  
 * @return error flag value
 */
bool Get_ErrFlag( uint16_t ErrId ){
    uint8_t Idx = (ErrId&0xFF00u)>>8;                                           /** - Retrieve error index */
    uint8_t Mask = (uint8_t)(ErrId&0x00FFu);                                    /** - Retrieve error mask */
    return  (ErrRegs[Idx]&Mask);                                                /** - Read error flag */
}


/**
 * @brief <i> Function to retrieve a specific error page within the error registers array. </i>
 * @param ErrId Flag ID from which the page to be read is extracted
 * @return error page value
 */
uint8_t Get_ErrPage( uint16_t ErrId ){
    uint8_t Idx = (ErrId&0xFF00u)>>8;                                           /** - Retrieve error page */
    return ErrRegs[Idx];                                                        /** - Read error page */
}


/**
 * @brief <i> Function to clear an error flag within the error registers array. </i>
 * @param ErrId ID specifying page and mask of the error flag to be cleared  
 */
void Clear_ErrFlag( uint16_t ErrId ){
    uint8_t Idx = ((ErrId&0xFF00u)>>8);                                         /** - Retrieve error index */
    uint8_t Mask = ((uint8_t)(ErrId&0x00FFu));                                  /** - Retrieve error mask */
    if( Idx < ERR_PG_SIZE ){                                                    /** - Check if index is within range */
        ErrRegs[Idx] &= ~Mask;                                                  /** - Assert error flag */
    }
}


/**
 * @brief <i> Function to reset all error registers. </i>
 */
void Reset_ErrRegs( void ){
    void *Ret = memset(ErrRegs,0,ERR_PG_SIZE);
    if( Ret != ErrRegs ){
       Set_ErrFlag(ERR_MEMSET);
    }
}



/**********************************/
/*** INTERRUPT SERVICE ROUTINES ***/
/**********************************/

/**
 * @brief <i> ISR related to oscillator failure trap. </i>
 */
void XISR _OscillatorFail(void) {
    if( INTCON1bits.OSCFAIL == 1 ){
        Set_ErrFlag(ERR_TRAP_OSC);
    }
    if( OSCCONbits.CF == 1 ){
        Set_ErrFlag(ERR_TRAP_CLOCK);
    }
    if( OSCCONbits.LOCK == 1 ){
        Set_ErrFlag(ERR_TRAP_PPL);
    }
    INTCON1bits.OSCFAIL = 0;
}


/**
 * @brief <i> ISR related to address trap. </i>
 */
void XISR _AddressError(void) {
    if( INTCON1bits.ADDRERR == 1 ){
        Set_ErrFlag(ERR_TRAP_ADDR);
    }
    INTCON1bits.ADDRERR = 0;
}


/**
 * @brief <i> ISR related to stack trap. </i>
 */
void XISR _StackError(void) {
    if( INTCON1bits.STKERR == 1 ){
        Set_ErrFlag(ERR_TRAP_STACK);
    }
    INTCON1bits.STKERR = 0;
}


/**
 * @brief <i> ISR related to math error trap. </i>
 */
void XISR _MathError(void) {
    if( INTCON1bits.OVAERR == 1 ){                                              /** - Check OVA_TERR error flag */
        Set_ErrFlag(ERR_TRAP_OVLA);
    }
    if( INTCON1bits.OVBERR == 1 ){                                              /** - Check OVB_TERR error flag */
        Set_ErrFlag(ERR_TRAP_OVLB);
    }
    if( INTCON1bits.COVAERR == 1 ){                                             /** - Check COVA_TERR error flag */
        Set_ErrFlag(ERR_TRAP_COVLA);
    }
    if( INTCON1bits.COVBERR == 1 ){                                             /** - Check COVB_TERR error flag */
        Set_ErrFlag(ERR_TRAP_COVLB);
    }
    if( INTCON1bits.SFTACERR == 1 ){                                            /** - Check SFTAC_TERR error flag */
        Set_ErrFlag(ERR_TRAP_SHACC);
    }   
    if( INTCON1bits.DIV0ERR == 1 ){                                             /** - Check DIV0_TERR error flag */
        Set_ErrFlag(ERR_TRAP_DIV0);
    }
    if( INTCON1bits.MATHERR == 1){                                              /** - Check MATH_TERR error flag */
        Set_ErrFlag(ERR_TRAP_MATH);
    }
    INTCON1bits.OVAERR = 0;                                                     /** - Clear all error flags */
    INTCON1bits.OVBERR = 0;
    INTCON1bits.COVAERR = 0;
    INTCON1bits.COVBERR = 0;
    INTCON1bits.SFTACERR = 0;
    INTCON1bits.DIV0ERR = 0;
    INTCON1bits.MATHERR = 0;
}


/**
 * @brief <i> ISR related to Generic Soft Trap vector. </i>
 */
void XISR _SoftTrapError( void ){
    if(INTCON3bits.DAE == 1 ){                                                  /** - Check DAE error flag */
        Set_ErrFlag(ERR_TRAP_DMA_ADR);
    }
    if(INTCON3bits.DOOVR == 1){                                                 /** - Check DOOVR error flag */
        Set_ErrFlag(ERR_TRAP_DOSOVL);
    }                                          
    INTCON3bits.DAE = 0;                                                        /** - Clear all error flags */
    INTCON3bits.DOOVR = 0;
}


/**
 * @brief <i> ISR related to generic hard trap. </i>
 */
void XISR _HardTrapError(void) {
    if( INTCON4bits.SGHT == 1 ){
        Set_ErrFlag(ERR_TRAP_SG_HARD);
    }
    INTCON4bits.SGHT = 0;
}
