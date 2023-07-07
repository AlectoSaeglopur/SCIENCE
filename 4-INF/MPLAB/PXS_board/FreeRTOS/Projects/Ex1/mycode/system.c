/**
 * @file system.c
 * @author Filippo Valmori
 * @date 28/03/2023
 * @ingroup BSP_C
 * @brief SYSTEM LIBRARY
 *
 * Script containing internal MCU system setting functions and pragmas definition.
 * 
 * @addtogroup BSP_C
 * Group with all BPS library files.
 */

/****************/
/*** INCLUDES ***/
/****************/

#include "gpio.h"
#include "priority.h"
#include "system.h"



/*****************/
/*** VARIABLES ***/
/*****************/

static uint8_t TxU1Buf[U1B_SIZE] = {0};                                         //!< UART1 TX buffer for printf operations
static uint16_t TxU1Len = 0;                                                    //!< UART1 TX length [B]
static uint16_t TxU1Idx = 0;                                                    //!< UART1 TX index [B]



/******************/
/*** PROTOTYPES ***/
/******************/

static void Trig_U1_TX( uint8_t Byte );



/*****************/
/*** FUNCTIONS ***/
/*****************/

/**
 * @brief <i> Function to initialize Master PLL network to boost FCY to 90 MHz and configure modules on/off. </i>
 */
void Init_Clock( void ){
    CLKDIV = 0x3001;                                                            /** - Set clock divider register (ROI=0, DOZE=1:8, DOZEN=0, FRCDIV=1:1, PLLPRE=1:1) */
    PLLFBDbits.PLLFBDIV = 135;                                                  /** - Set PLL feedback divider register */
    OSCTUN = 0x00;                                                              /** - Set FRC oscillator tuning register (8 MHz with 0% deviation) */
    PLLDIVbits.POST1DIV = 3;                                                    /** - Set PLL output divider #1 */
    PLLDIVbits.POST2DIV = 1;                                                    /** - Set PLL output divider #2 */
    PLLDIVbits.VCODIV = 0;                                                      /** - Set PLL VCO output divider [NOT USED] */
    ACLKCON1 = 0x101;                                                           /** - Set auxiliary clock control register [NOT USED] */ 
    APLLFBD1 = 0x96;                                                            /** - Set APLL feedback divider register [NOT USED] */
    APLLDIV1 = 0x41;                                                            /** - Set APLL output divider register [NOT USED] */
    CANCLKCON = 0x00;                                                           /** - Set CAN clock control register [NOT USED] */
    REFOCONL = 0x00;                                                            /** - Set reference clock control low register [DEFAULT] */
    REFOCONH = 0x00;                                                            /** - Set reference clock control high register [DEFAULT] */
    REFOTRIMH = 0x00;                                                           /** - Set reference oscillator trim register [DEFAULT] */
    RPCONbits.IOLOCK = 0;                                                       /** - Set all peripheral remapping registers as unlocked */
    PMD1 = 0x0000;                                                              /** - Enable T1, PWM, U1, U2, SPI1, SPI2 and ADC modules */
    PMD1bits.QEIMD = 1;                                                         /** - Disable QEI module */
    PMD1bits.I2C1MD = 1;                                                        /** - Disable I2C1 module */
    PMD1bits.C1MD = 1;                                                          /** - Disable CAN1 module */
    PMD1bits.C2MD = 1;                                                          /** - Disable CAN2 module */
    PMD2 = 0x0000;                                                              /** - Enable all CCP modules */
    PMD3 = 0x0000;                                                              /** - Enable CRC module */
    PMD3bits.I2C2MD = 1;                                                        /** - Disable I2C2 module */
    PMD4 = 0x0000;                                                              /** - Enable reference clock module */
    PMD6 = 0x0000;                                                              /** - Enable all DMA modules */
    PMD7 = 0x0000;                                                              /** - Enable CMP and PTG modules */
    PMD8 = 0x0000;                                                              /** - Enable CLC and constant-current source modules */
    PMD8bits.SENT1MD = 1;                                                       /** - Disable SENT1 module */ 
    PMD8bits.SENT2MD = 1;                                                       /** - Disable SENT2 module */
    __builtin_write_OSCCONH(0x01);                                              /** - Switch clock source to FRCPLL */
    __builtin_write_OSCCONL(0x01);                                              /** - Set the OSWEN bit to initiate oscillator switch */
    while( OSCCONbits.OSWEN != 0 ){};                                           /** - Wait until clock switch is completed */
    while( OSCCONbits.LOCK != 1 ){};                                            /** - Wait until PLL is locked */
}

/**
 * @brief <i> Function to enable interrupt nesting and global interrupt. </i>
 */
void Init_GI( void ){
    INTCON1bits.NSTDIS = 0;                                                     /** - Enable interrupt nesting */
    INTCON2bits.GIE = 1;                                                        /** - Assert global interrupt enable bit */
}

/**
 * @brief <i> Function to force a soft-reset. </i>
 */
void Soft_Reset( void ){
    __asm__ volatile ("RESET");                                                 /** - Execute RESET assembly instruction */
}

/**
 * @brief <i> Function to configure UART1 module. </i>
 */
void Init_U1( void ){
    U1MODEbits.UARTEN = 0;                                                      /** - Disable UART interface before configuring */
    U1MODEbits.UTXEN = 0;                                                       /** - Disable UART TX interface before configuring */
    U1MODEbits.URXEN = 0;                                                       /** - Disable UART RX interface before configuring */
    Unlock_GPIOs();                                                             /** - Unlock GPIOs and PP assignments before configuring */
    gpio_t Par;
    Par.AnaDig = xDIGITAL;
    Par.InOut = xOUTPUT;
    Par.OpenDr = xDISABLE;
    Config_GPIO(oU1TX,Par);
    RPOR3bits.RP38R = 1;                                                        /** - PPS assignment for binding RB6 pin (RP38) to U1TX (whose ID is 1) */
    Par.AnaDig = xDIGITAL;
    Par.InOut = xINPUT;
    Config_GPIO(oU1RX,Par);
    RPINR18bits.U1RXR = 37;                                                     /** - PPS assignment for binding U1RX to RB5 (RP37) */
    Lock_GPIOs();                                                               /** - Lock GPIOs and PPS assignments after configuring */
    U1MODEHbits.BCLKSEL = 0;                                                    /** - Set FP as baud clock source (assuming FP = 90 MHz) */
    U1MODEHbits.BCLKMOD = 1;                                                    /** - Select fractional baud rate generation */
    U1BRG = 200;                                                                /** - Set baud rate divider (Rb = FP/BRG = 450 kb/s) */
    U1BRGH = 0;
    U1MODEbits.MOD = 3;                                                         /** - Select UART mode ("0/3" = 8-bit data without/with even-parity bit) */
    U1MODEHbits.STSEL = 0;                                                      /** - Set number of stop bits ("0" = 1 bit) */
    U1MODEHbits.UTXINV = 0;                                                     /** - Set TX polarity ("0" = output data is not inverted) */
    U1MODEHbits.URXINV = 0;                                                     /** - Set RX polarity ("0" = output data is not inverted) */
    U1MODEHbits.FLO = 0;                                                        /** - Select flow control policy ("0" = no flow control) */
    U1STAHbits.UTXISEL = 0;                                                     /** - TX UART interrupt mode ("0" = interrupt when TX buffer is empty) */
    U1STAHbits.URXISEL = 0;                                                     /** - RX UART interrupt mode ("0" = interrupt when at least one byte has been received) */
    U1STAHbits.STPMD = 0;                                                       /** - Trigger RX interrupt at the middle of first stop bit */
    U1MODEHbits.RUNOVF = 1;                                                     /** - In case of RX overflow, RX shifter keeps running */
    U1STAbits.OERIE = 1;                                                        /** - Enable interrupt due to RX overflow error */
    U1STAbits.FERIE = 1;                                                        /** - Enable interrupt due to RX stop-bit inversion error */
    U1STAbits.PERIE = 1;                                                        /** - Enable interrupt due to RX parity-bit error */
    IPC12bits.U1EIP = PRT_HW_U1ER;                                              /** - Set error interrupt priority */
    IFS3bits.U1EIF = 0;                                                         /** - Clear error interrupt flag */
    IEC3bits.U1EIE = 1;                                                         /** - Enable error interrupt */
    IPC3bits.U1TXIP = PRT_HW_U1TX;                                              /** - Set TX interrupt priority */
    IFS0bits.U1TXIF = 0;                                                        /** - Clear TX interrupt flag */
    IEC0bits.U1TXIE = 1;                                                        /** - Enable TX interrupt */
    IFS0bits.U1RXIF = 0;                                                        /** - Clear RX interrupt flag */
    IEC0bits.U1RXIE = 0;                                                        /** - Keep RX interrupt disabled */
    U1MODEbits.UARTEN = 1;                                                      /** - Enable UART interface */
    U1MODEbits.UTXEN = 1;                                                       /** - Enable TX module */
    U1MODEbits.URXEN = 0;                                                       /** - Keep RX module disabled */
}

/**
 * @brief <i> Function to transmit next byte over UART1. </i>
 * @param Byte byte to be transmitted
 */
static void Trig_U1_TX( uint8_t Byte ){
    TxU1Idx++;
    U1TXREG = (uint16_t)Byte;
}

/**
 * @brief <i> ISR triggered when U1TX buffer gets empty. </i>
 */
void XISR _U1TXInterrupt( void ){
    IFS0bits.U1TXIF = 0;
    if( TxU1Idx < TxU1Len ){
        Trig_U1_TX(TxU1Buf[TxU1Idx]);
    } else {
        TxU1Len = 0;
    }
}

/**
 * @brief <i> Function to start UART transmission and flush all TxU1Buf content. </i>
 */
void Start_Printf( void ){
    TxU1Buf[TxU1Len] = '\r';
    TxU1Buf[TxU1Len+1] = '\n';
    TxU1Len += 2;
    TxU1Idx = 0;
    Trig_U1_TX(TxU1Buf[0]);
    
}

/**
 * @brief Function to add string to printf buffer.
 * @param Str array to char to be printed
 * @param Len size of array to be printed
 */
void Add_Printf_str( const char * Str, uint16_t Len ){
    uint16_t j;
    for( j=0; j<Len; j++ ){
        if( Str[j] == NULL ){
            TxU1Buf[TxU1Len+j] = ' ';
        } else {
            TxU1Buf[TxU1Len+j] = Str[j];
        }
    }
    TxU1Len += Len;
}

/**
 * @brief Function to convert to char and add 8-bit word to printf buffer.
 * @param WordIn unsigned 8-bit word to be printed
 */
void Add_Printf_udec8( uint8_t WordIn ){
    uint8_t j;
    uint8_t Len = 3;                                                            // Since the maximum number achievable with uint8 type is 256
    uint8_t Digit;
    uint16_t Div = 1;
    for( j=0; j<Len; j++ ){
        if( j == Len-1){
            Digit = WordIn;
        } else {
            Digit = WordIn%(10*Div);
        }
        TxU1Buf[TxU1Len+Len-1-j] = (uint8_t)(Digit/Div+48);
        Div *= 10;
    }
    for( j=0; j<Len-1; j++ ){
        if( TxU1Buf[TxU1Len+j] == '0' ){
            TxU1Buf[TxU1Len+j] = ' ';
        } else{
            break;
        }
    }
    TxU1Len += Len;
}

/**
 * @brief Function to convert to char and add 16-bit word to printf buffer.
 * @param WordIn unsigned 16-bit word to be printed
 */
void Add_Printf_udec16( uint16_t WordIn ){
    uint8_t j;
    uint8_t Len = 5;                                                            // Since the maximum number achievable with uint16 type is 65,536
    uint16_t Digit;
    uint16_t Div = 1;
    for( j=0; j<Len; j++ ){
        if( j == Len-1){
            Digit = WordIn;
        } else {
            Digit = WordIn%(10*Div);
        }
        TxU1Buf[TxU1Len+Len-1-j] = (uint8_t)(Digit/Div+48);
        Div *= 10;
    }
    for( j=0; j<Len-1; j++ ){
        if( TxU1Buf[TxU1Len+j] == '0' ){
            TxU1Buf[TxU1Len+j] = ' ';
        } else{
            break;
        }
    }
    TxU1Len += Len;
}

/**
 * @brief Function to convert to char and add 32-bit word to printf buffer.
 * @param WordIn unsigned 32-bit word to be printed
 */
void Add_Printf_udec32( uint32_t WordIn ){
    uint8_t j;
    uint8_t Len = 10;                                                           // Since the maximum number achievable with uint16 type is 4,294,967,296
    uint32_t Digit;
    uint16_t Div = 1;
    for( j=0; j<Len; j++ ){
        if( j == Len-1){
            Digit = WordIn;
        } else {
            Digit = WordIn%(10*Div);
        }
        TxU1Buf[TxU1Len+9-j] = (uint8_t)(Digit/Div+48);
        Div *= 10;
    }
    for( j=0; j<Len-1; j++ ){
        if( TxU1Buf[TxU1Len+j] == '0' ){
            TxU1Buf[TxU1Len+j] = ' ';
        } else{
            break;
        }
    }
    TxU1Len += Len;
}

/**
 * @brief <i> Function to configure CCT8 timer (for statistics gathering). </i>
 * NB: This timer shall run at least x10 times faster than tick rate in order to retrieve accurate data; here:
 * - Tick rate = 1 kHz,
 * - T8 rate = 90M/64 = 1.406 MHz,
 * - With timeout set to 0xFFFFFFFF, overflows occur every 4294967296/1.406M = 3055 sec = 51 min.
 * - In case of overflow, the statistics may lose reliability.
 */
void Config_CCT8( void ){
    CCP8CON1Lbits.CCPON = 0;                                                    /** - Disable module before changing configuration */
    CCP8CON1Lbits.CLKSEL = 0;                                                   /** - Use FP as clock source (assuming FP = 90 MHz) */
    CCP8CON1Lbits.TMRPS = 3;                                                    /** - Set clock pre-scaler to 1:64 */
    CCP8CON1Lbits.TMRSYNC = 0;                                                  /** - Synchronisation not required (since CLKSEL = 0) */
    CCP8CON2Lbits.SSDG = 0;                                                     /** - Disable gating feature */
    CCP8CON1Lbits.CCSEL = 0;                                                    /** - Select OC/PWM/T operation */
    CCP8CON1Lbits.T32 = 1;                                                      /** - Use 32-bit time operation */
    CCP8CON1Lbits.MOD = 0;                                                      /** - Select Timer mode */
    CCP8CON1Hbits.SYNC = 0;                                                     /** - Use only CCPxPR period match as synchronisation source */
    CCP8PRL = 0xFFFF;                                                           /** - Set timeout to maximum value (pt.1), so to postpone overflow occurrence */
    CCP8PRH = 0xFFFF;                                                           /** - Set timeout to maximum value (pt.2) */
    CCP8TMRL = 0;                                                               /** - Reset primary counter */
    CCP8TMRH = 0;                                                               /** - Reset secondary counter (not used) */
    IFS9bits.CCT8IF = 0;                                                        /** - Clear interrupt flag */
    IEC9bits.CCT8IE = 0;                                                        /** - Keep interrupt disabled */
    CCP8CON1Lbits.CCPON = 1;                                                    /** - Start module */
}

/**
 * @brief <i> Function to get current CCT8 counter value (for statistics gathering). </i>
 * @return 32-bit timer counter value
 */
uint32_t Get_CCT8( void ){
    return ((((uint32_t)CCP8TMRH)<<16)|CCP8TMRL);
}

/**
 * @brief <i> Function to configure AN3 channel of shared ADC module. </i>
 */
void Init_ADC( void ){
    Unlock_GPIOs();                                                             /** - Unlock GPIOs and PP assignments before configuring */
    gpio_t Par;
    Par.AnaDig = xANALOG;
    Par.InOut = xINPUT;
    Config_GPIO(oVI1,Par);                                                      /** - Configure ADC channel pin */
    Lock_GPIOs();                                                               /** - Lock GPIOs and PPS assignments after configuring */
    ADCON1Lbits.ADON = 0;                                                       /** - Disable module before configuring */
    ADCON1Hbits.FORM = 0;                                                       /** - Use integer data format */
    ADCON1Hbits.SHRRES = 3;                                                     /** - Set ADC core resolution to 12 bits */
    ADCON2Lbits.SHRADCS = 2;                                                    /** - Set shared ADC core clock divider to 4 */
    ADCON2Hbits.SHRSAMC = 3;                                                    /** - Set sample time to 5*TADCORE */
    ADCON3Lbits.REFSEL = 0;                                                     /** - Use AVDD and AVSS as reference voltages */
    ADCON3Hbits.CLKSEL = 0;                                                     /** - Use FP as clock source (90 MHz) */
    ADCON3Hbits.CLKDIV = 0;                                                     /** - Set clock divider to 1:1 */
    ADMOD0Lbits.SIGN3 = 0;                                                      /** - Set AN3 channel data as unsigned */
    ADIELbits.IE3 = 1;                                                          /** - Enable common and individual interrupts for AN3 channel */
    IPC23bits.ADCAN3IP = PRT_HW_ADC3;                                           /** - Set AN3 channel interrupt priority */
    IFS5bits.ADCAN3IF = 0;                                                      /** - Clear AN6 channel interrupt flag */
    IEC5bits.ADCAN3IE = 1;                                                      /** - Enable AN6 channel interrupt */
    ADCON1Lbits.ADON = 1;                                                       /** - Start shared ADC module */
    ADCON5Hbits.WARMTIME = 7;                                                   /** - Set shared ADC power-up delay to 128 source clock cycles */
    ADCON5Lbits.SHRPWR = 1;                                                     /** - Enable power for shared ADC core */
    while( ADCON5Lbits.SHRRDY != 1 );                                           /** - Wait until ADC shared core is powered and ready for operation */
    ADCON3Hbits.SHREN = 1;                                                      /** - Enable shared ADC core */
    ADTRIG0Hbits.TRGSRC3 = 1;                                                   /** - Use "common software trigger" for AN3 channel */
}

/**
 * @brief <i> Function to configure DAC module. </i>
 */
void Init_DAC( void ){
    DACCTRL1Lbits.DACON = 0;                                                    /** - Disable module before configuring */
    DACCTRL1Lbits.CLKSEL = 3;                                                   /** - Use FPLLO as clock source */
    DACCTRL1Lbits.CLKDIV = 3;                                                   /** - Set clock divider to 4 */
    DAC1DATHbits.DACDATH = 0;                                                   /** - Set 0 as default output level */
    DAC1CONLbits.DACOEN = 1;                                                    /** - Link DAC output to RB2 pin */
    DAC1CONLbits.DACEN = 1;                                                     /** - Enable module */
    DACCTRL1Lbits.DACON = 1;                                                    /** - Start module */
}

/**
 * @brief <i> Function to disable SELF_TEST line, so to connect ADC channels to connector J7 (see PXS board schematic). </i>
 */
void Disable_SELF_TEST( void ){
    Unlock_GPIOs();                                                             /** - Unlock GPIOs and PP assignments before configuring */
    gpio_t Par;
    Par.AnaDig = xDIGITAL;
    Par.InOut = xOUTPUT;
    Par.OpenDr = xDISABLE;
    Config_GPIO(oSELF_TEST,Par);                                                /** - Configure pin */
    Lock_GPIOs();                                                               /** - Lock GPIOs and PPS assignments after configuring */
    Set_GPIO(oSELF_TEST,xHIGH);                                                 /** - Set and keep SELF_TEST high (active-low) */
}

/**
 * @brief <i> Function to configure INT1 module. </i>
 */
void Init_INT1( void ){
    Unlock_GPIOs();
    gpio_t Par;
    Par.AnaDig = xDIGITAL;
    Par.InOut = xINPUT;
    Par.PullUp = xENABLE;
    Config_GPIO(oEXTR5,Par);                                                    /** - Initialize EXTI GPIO */
    RPINR0bits.INT1R = 44;                                                      /** - PPS assignment for binding INT1 to RB12 (RP44) */
    Lock_GPIOs();
    INTCON2bits.INT1EP = 1;                                                     /** - Set negative (aka falling) edge interrupt type */
    IFS0bits.INT1IF = 0;                                                        /** - Clear interrupt flag */
    IPC3bits.INT1IP = PRT_HW_INT1;                                              /** - Set interrupt priority */
    IEC0bits.INT1IE = 1;                                                        /** - Enable interrupt */
}



/***************/
/*** PRAGMAS ***/
/***************/

/* FSEC register */
#pragma config AIVTDIS = 1                                                      /* Disable alternate interrupt vector table */
#pragma config CSS = 7                                                          /* Set no configuration segment code flash protection (other than CWRP) */
#pragma config CWRP = 1                                                         /* Set configuration segment as not write-protected */
#pragma config GSS = 3                                                          /* Set no general segment code flash protection (other than GWRP) */
#pragma config GWRP = 1                                                         /* Set general segment as not write-protected */
#pragma config BSEN = 1                                                         /* Set no boot segment */
#pragma config BSS = 3                                                          /* Set no boot segment code flash protection (other than BWRP) */
#pragma config BWRP = 1                                                         /* Set boot segment as not write-protected */

/* FBSLIM register */
#pragma config BSLIM = 8191                                                     /* Set boot segment flash page address limit [NOT USED] */
/* FOSCSEL register */
#pragma config FNOSC = 0                                                        /* Select the built-in 8-MHz FRC as initial oscillator source */
#pragma config IESO = 0                                                         /* Disable two-speed start-up feature */
/* FOSC register */ 
#pragma config POSCMD = 3                                                       /* Disable primary oscillator */
#pragma config OSCIOFNC = 0                                                     /* Set OSCO as general purpose I/O pin */
#pragma config FCKSM = 0                                                        /* Enable clock switching and fail-safe clock monitor */
#pragma config PLLKEN = 0                                                       /* Disable PLL clock output if lock is lost */
#pragma config XTCFG = 3                                                        /* Set crystal oscillator gain [NOT USED] */
#pragma config XTBST = 1                                                        /* Boost crystal oscillator kick-start [NOT USED] */
/* FWDT register */
#pragma config RWDTPS = 12                                                      /* Set run-mode watchdog post-scaler to 2^12 to get experimentally a timeout of 4.096 s (see Tab.3-1 in Annex) */
#pragma config RCLKSEL = 3                                                      /* Select 32 kHz LPRC as watchdog oscillator source */
#pragma config WINDIS = 0                                                       /* Enable watchdog window-mode */
#pragma config WDTWIN = 3                                                       /* Set the window length to 25% of the watchdog period */
#pragma config SWDTPS = 16                                                      /* Set sleep-mode watchdog post-scaler to 2^16 to get experimentally a timeout of 66 s */
#pragma config FWDTEN = 0                                                       /* Keep internal watchdog disabled in hardware */
/* FICD register */
#pragma config ICS = 2                                                          /* Select #2 ICD communication channel (PGC2/PGD2) */
#pragma config JTAGEN = 1                                                       /* JTAG port is enabled */
#pragma config NOBTSWP = 1                                                      /* Disable BOOTSWP instruction [@tbc] */
/* FDMTIVTL register */
#pragma config DMTIVTL = 0x0010                                                 /* Lower 16 bits of deadman timer window interval */
/* FDMTIVTH register */
#pragma config DMTIVTH = 0x0000                                                 /* Higher 16 bits of deadman timer window interval */
/* FDMTCNTL register */
#pragma config DMTCNTL = 0xFFFF                                                 /* Lower 16 bits of deadman count timeout */
/* FDMTCNTH register */
#pragma config DMTCNTH = 0x0080                                                 /* Higher 16 bits of deadman count timeout */
/* FDMT register */
#pragma config DMTDIS = 1                                                       /* Disable deadman timer */
/** FDEVOPT register */
#pragma config ALTI2C1 = 1                                                      /* Set default location for SCL1/SDA1 pins (I2C) [NOT USED] */
#pragma config ALTI2C2 = 1                                                      /* Set default location for SCL2/SDA2 pins (I2C) [NOT USED] */
#pragma config SMBEN = 1                                                        /* Enable SMBus input threshold [NOT USED] */
#pragma config SPI2PIN = 1                                                      /* Use PPS assignment for Master SPI2 interface */
/* FALTREG register */
#pragma config CTXT1 = 7                                                        /* Keep alternate register set #1 not assigned */
#pragma config CTXT2 = 7                                                        /* Keep alternate register set #2 not assigned */
#pragma config CTXT3 = 7                                                        /* Keep alternate register set #3 not assigned */
#pragma config CTXT4 = 7                                                        /* Keep alternate register set #4 not assigned */
/* FCFGPRA0 register */
#pragma config CPRA0 = MSTR                                                     /* Assign pin RA0 to Master core [NOT USED] */
#pragma config CPRA1 = MSTR                                                     /* Assign pin RA1 to Master core : VRCD */
#pragma config CPRA2 = MSTR                                                     /* Assign pin RA2 to Master core [NOT USED] */
#pragma config CPRA3 = MSTR                                                     /* Assign pin RA3 to Master core : VI1 */
#pragma config CPRA4 = MSTR                                                     /* Assign pin RA4 to Master core : VI2 */
/* FCFGPRB0 register */
#pragma config CPRB0 = MSTR                                                     /* Assign pin RB0 to Master core : ZX1 */
#pragma config CPRB1 = MSTR                                                     /* Assign pin RB1 to Master core : ZX2 */
#pragma config CPRB2 = MSTR                                                     /* Assign pin RB2 to Master core : DAC_OUT */
#pragma config CPRB3 = MSTR                                                     /* Assign pin RB3 to Master core : PGD */
#pragma config CPRB4 = MSTR                                                     /* Assign pin RB4 to Master core : PGC */
#pragma config CPRB5 = MSTR                                                     /* Assign pin RB5 to Master core : U1RX */
#pragma config CPRB6 = MSTR                                                     /* Assign pin RB6 to Master core : U1TX */
#pragma config CPRB7 = MSTR                                                     /* Assign pin RB7 to Master core : TDT */
#pragma config CPRB8 = MSTR                                                     /* Assign pin RB8 to Master core : FEEL_G */
#pragma config CPRB9 = MSTR                                                     /* Assign pin RB9 to Master core : CAN_TRIP */
#pragma config CPRB10 = MSTR                                                    /* Assign pin RB10 to Master core [NOT USED] */
#pragma config CPRB11 = MSTR                                                    /* Assign pin RB11 to Master core : EXTR7 */
#pragma config CPRB12 = MSTR                                                    /* Assign pin RB12 to Master core : EXTR5 */
#pragma config CPRB13 = MSTR                                                    /* Assign pin RB13 to Master core : EXTR4 */
#pragma config CPRB14 = MSTR                                                    /* Assign pin RB14 to Master core : EXTR3 */
#pragma config CPRB15 = MSTR                                                    /* Assign pin RB15 to Master core : EXTR1 */
/* FCFGPRC0 register */
#pragma config CPRC0 = MSTR                                                     /* Assign pin RC0 to Master core : EM_WO */
#pragma config CPRC1 = MSTR                                                     /* Assign pin RC1 to Master core : SDI2 */
#pragma config CPRC2 = MSTR                                                     /* Assign pin RC2 to Master core : SDO2 */
#pragma config CPRC3 = MSTR                                                     /* Assign pin RC3 to Master core : ZX0 */
#pragma config CPRC4 = MSTR                                                     /* Assign pin RC4 to Master core : TRIP_REQ */
#pragma config CPRC5 = MSTR                                                     /* Assign pin RC5 to Master core : SW_STAT0 */
#pragma config CPRC6 = MSTR                                                     /* Assign pin RC6 to Master core : SCK2 */
#pragma config CPRC7 = MSTR                                                     /* Assign pin RC7 to Master core : VI4 */
#pragma config CPRC8 = MSTR                                                     /* Assign pin RC8 to Master core : IRQ1 */
#pragma config CPRC9 = MSTR                                                     /* Assign pin RC9 to Master core : PSRES */
#pragma config CPRC10 = MSTR                                                    /* Assign pin RC10 to Master core : SW_STAT1 */
#pragma config CPRC11 = MSTR                                                    /* Assign pin RC11 to Master core : REM_ON */
#pragma config CPRC12 = MSTR                                                    /* Assign pin RC12 to Master core : SDI1_SDO1 */
#pragma config CPRC13 = MSTR                                                    /* Assign pin RC13 to Master core : SCK1 */
#pragma config CPRC14 = MSTR                                                    /* Assign pin RC14 to Master core : SS1 */
#pragma config CPRC15 = MSTR                                                    /* Assign pin RC15 to Master core : PWMRC */
/** FCFGPRD0 register */
#pragma config CPRD0 = MSTR                                                     /* Assign pin RD0 to Master core [NOT USED] */
#pragma config CPRD1 = MSTR                                                     /* Assign pin RD1 to Master core : CHE_RCT */
#pragma config CPRD2 = MSTR                                                     /* Assign pin RD2 to Master core : CHE_SOAT */
#pragma config CPRD3 = MSTR                                                     /* Assign pin RD3 to Master core : REFCLKO */
#pragma config CPRD4 = MSTR                                                     /* Assign pin RD4 to Master core : SELF_TEST */
#pragma config CPRD5 = MSTR                                                     /* Assign pin RD5 to Master core : IRQ0 */
#pragma config CPRD6 = MSTR                                                     /* Assign pin RD6 to Master core : U2TX */
#pragma config CPRD7 = MSTR                                                     /* Assign pin RD7 to Master core : U2RX */
#pragma config CPRD8 = MSTR                                                     /* Assign pin RD8 to Master core [NOT USED] */
#pragma config CPRD9 = MSTR                                                     /* Assign pin RD9 to Master core : WDI */
#pragma config CPRD10 = MSTR                                                    /* Assign pin RD10 to Master core : VI3 */
#pragma config CPRD11 = MSTR                                                    /* Assign pin RD11 to Master core : SS2B */
#pragma config CPRD12 = MSTR                                                    /* Assign pin RD12 to Master core : SS2A */
#pragma config CPRD13 = MSTR                                                    /* Assign pin RD13 to Master core [NOT USED] */
#pragma config CPRD14 = MSTR                                                    /* Assign pin RD14 to Master core [NOT USED] */
#pragma config CPRD15 = MSTR                                                    /* Assign pin RD15 to Master core [NOT USED] */
/** FCFGPRE0 */
#pragma config CPRE0 = MSTR                                                     /* Assign pin RE0 to Master core : EXTR2 */
#pragma config CPRE1 = MSTR                                                     /* Assign pin RE1 to Master core [NOT USED] */
#pragma config CPRE2 = MSTR                                                     /* Assign pin RE2 to Master core [NOT USED] */
#pragma config CPRE3 = MSTR                                                     /* Assign pin RE3 to Master core : CCTRL */
#pragma config CPRE4 = MSTR                                                     /* Assign pin RE4 to Master core [NOT USED] */
#pragma config CPRE5 = MSTR                                                     /* Assign pin RE5 to Master core [NOT USED] */
#pragma config CPRE6 = MSTR                                                     /* Assign pin RE6 to Master core : PM1 */
#pragma config CPRE7 = MSTR                                                     /* Assign pin RE7 to Master core : PM0 */
#pragma config CPRE8 = MSTR                                                     /* Assign pin RE8 to Master core : EM_RST */
#pragma config CPRE9 = MSTR                                                     /* Assign pin RE9 to Master core : CHE_EXTI */
#pragma config CPRE10 = MSTR                                                    /* Assign pin RE10 to Master core : TTRG */
#pragma config CPRE11 = MSTR                                                    /* Assign pin RE11 to Master core : FEEL_B */
#pragma config CPRE12 = MSTR                                                    /* Assign pin RE12 to Master core : RC_TRIP */
#pragma config CPRE13 = MSTR                                                    /* Assign pin RE13 to Master core : SOA_TRIP */
#pragma config CPRE14 = MSTR                                                    /* Assign pin RE14 to Master core : EXTR6 */
#pragma config CPRE15 = MSTR                                                    /* Assign pin RE15 to Master core [NOT USED] */
/** FPOR register */
#pragma config BISTDIS = 1                                                      /* Disable MBIST feature on reset for Master core */
#pragma config S1BISTDIS = 1                                                    /* Disable MBIST feature on reset for Slave core */
