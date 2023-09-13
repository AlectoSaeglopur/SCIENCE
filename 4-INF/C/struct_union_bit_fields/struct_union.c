
/*
 * Script showing an example of structs and unions for grouping several (fictional) MCU registers.
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


/* TYPEDEFS */

typedef union {
    uint16_t reg;                                                 
    struct {
        uint8_t adcL;
        uint8_t adcH;
    } member;
} adc_t;

typedef union {
    uint16_t reg;                                                 
    struct {
        bool active;
        uint8_t timeout;
    } member;
} timer_t;

typedef union {
    uint32_t reg;                                                 
    struct {
        uint16_t baud;
        uint8_t data[2];
    } member;
} uart_t;

typedef struct {
    volatile adc_t adc;
    volatile uart_t uart;
    volatile timer_t timer;
} mcu_t;


/* MAIN */

int main( void ){
    mcu_t Var = {.timer.member.timeout = 0xBC};                         // declare struct and initialize only x1 of its members 
    mcu_t *pVar = &Var;
    Var.adc.reg = 0x123A;
    Var.timer.member.active = true;
    Var.uart.member.baud = 0x2500;
    Var.uart.member.data[0] = 0x33;
    Var.uart.member.data[1] = 0x66;


    printf(" Size = %d B\n",sizeof(Var));                               // results 12 B (see NOTE#1)
    printf(" -----\n");
    printf(" AdcLow = 0x %2X\n",Var.adc.member.adcL);                   // returns 0x3A
    printf(" AdcHig = 0x %2X\n",Var.adc.member.adcH);                   // returns 0x12
    printf(" AdcReg = 0x %4X\n",Var.adc.reg);                           // returns 0x123A
    printf(" -----\n");
    printf(" TimerAct = 0x %2X\n",Var.timer.member.active);             // returns 0x01
    printf(" TimerTmo = 0x %2X\n",Var.timer.member.timeout);            // returns 0xBC
    printf(" TimerReg = 0x %4X\n",Var.timer.reg);                       // returns 0xBC01
    printf(" -----\n");
    printf(" UartBau = 0x %2X\n",Var.uart.member.baud);                 // returns 0x2500
    printf(" UartDt0 = 0x %2X\n",*Var.uart.member.data);                // returns 0x33
    printf(" UartDt1 = 0x %2X\n",*(Var.uart.member.data+1));            // returns 0x66
    printf(" UartReg = 0x %4X\n",pVar->uart.reg);                       // returns 0x66332500
    printf(" -----\n");
    
    return 1;
}


/* NOTES */

// 1. The size of 'Var' is x12 bytes (and not x8) since padding is applied in the mcu_t structure.
//    In fact, since uart_t has a size of x4 bytes, also all other members of mcu_t are forced to
//    fit this dimension (and this is done through padding). 