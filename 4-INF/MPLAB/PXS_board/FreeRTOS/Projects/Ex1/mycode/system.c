/**
 * @file system.c
 * @author Filippo Valmori
 * @date 28/03/2023
 * @ingroup BSP_C
 * @brief SYSTEM LIBRARY
 *
 * Script containing internal MCU system setting functions.
 * 
 * @addtogroup BSP_C
 * Group with all BPS library files.
 */

/****************/
/*** INCLUDES ***/
/****************/

#include "system.h"



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
    asm("RESET");                                                               /** - Execute RESET assembly instruction */
}


/***************/
/*** PRAGMAS ***/
/***************/

/* FSEC register */
#pragma config BWRP = 1                                                         /* Set boot segment as not write-protected */
#pragma config BSS = 2                                                          /* Set no boot segment code flash protection (other than BWRP) */
#pragma config BSEN = 1                                                         /* Set no boot segment */
#pragma config GWRP = 1                                                         /* Set general segment as not write-protected */
#pragma config GSS = 3                                                          /* Set no general segment code flash protection (other than GWRP) */
#pragma config CWRP = 1                                                         /* Set configuration segment as not write-protected */
#pragma config CSS = 7                                                          /* Set no configuration segment code flash protection (other than CWRP) */
#pragma config AIVTDIS = 1                                                      /* Disable alternate interrupt vector table */
/* FBSLIM register */
#pragma config BSLIM = 8191                                                     /* Set boot segment flash page address limit [NOT USED] */
/* FOSCSEL register */
#pragma config FNOSC = 0                                                        /* Select the built-in 8-MHz FRC as initial oscillator source */
#pragma config IESO = 0                                                         /* Disable two-speed start-up feature */
/* FOSC register */ 
#pragma config POSCMD = 3                                                       /* Disable primary oscillator */
#pragma config OSCIOFNC = 0                                                     /* Set OSCO as general purpose I/O pin */
#pragma config FCKSM = 0                                                        /* Enable clock switching and fail-safe clock monitor */
#pragma config PLLKEN = 1                                                       /* Disable PLL clock output if lock is lost [@tbc] */
#pragma config XTCFG = 3                                                        /* Set crystal oscillator gain [NOT USED] */
#pragma config XTBST = 1                                                        /* Boost crystal oscillator kick-start [NOT USED] */
/* FWDT register */
#pragma config RWDTPS = 0                                                       /* Set run-mode watchdog post-scaler to 2^0 to get experimentally a timeout of 1 ms [@tbc] */
#pragma config RCLKSEL = 3                                                      /* Select 32 kHz LPRC as watchdog oscillator source */
#pragma config WINDIS = 1                                                       /* Keep watchdog window-mode disabled in hardware */
#pragma config WDTWIN = 3                                                       /* Set the window length to 50% of the watchdog period */
#pragma config SWDTPS = 10                                                      /* Set sleep-mode watchdog post-scaler to 2^10 to get experimentally a timeout of 1 s [@tbc] */
#pragma config FWDTEN = 0                                                       /* Keep internal watchdog disabled in hardware */
/* FICD register */
#pragma config ICS = 2                                                          /* Select #2 ICD communication channel (PGC2/PGD2) */
#pragma config JTAGEN = 0                                                       /* JTAG port is disabled */
#pragma config NOBTSWP = 0                                                      /* Disable BOOTSWP instruction [@tbc] */
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
#pragma config CPRD10 = SLV1                                                    /* Assign pin RD10 to Master core : VI3 */
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
