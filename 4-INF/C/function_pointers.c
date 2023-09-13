
/*
 * Script showing an example of pointers to functions.
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


/* DEFINES */

#define DOUBLE_IDX          (uint8_t) 0
#define SQUARE_IDX          (uint8_t) 1
#define HALVE_IDX           (uint8_t) 2


/* FUNCTIONS */

uint16_t xDouble( uint16_t x ){
    return (x<<1);
}

uint16_t xSquare( uint16_t x ){
    return (x*x);
}

uint16_t xHalve( uint16_t x ){
    return (x>>1);
}

// function to execute another function by specifying as input its pointer and input argument
uint16_t xExeFunction( uint16_t (*fp) (uint16_t), uint16_t x){
    return fp(x);                                                               // call function pased by pointer
}


/* MAIN */

int main( void ){

    uint16_t Par = 4;

    uint16_t (*func_ptr) (uint16_t arg) = NULL;                                 // create a pointer to function -> NB: all fuctions pointed later shall have the same prototype!
    func_ptr = &xDouble;                                                        // assign pointer to double-function
    uint16_t Res1 = func_ptr(Par);                                              // execute pointer double-function
    uint16_t Res2 = xExeFunction(&xSquare,Par);                                 // more elegant way to do the same as the x2 lines above (but pointing to square-function now)
    func_ptr = &xHalve;                                                         // assign pointer to halve-function
    uint16_t Res3 = func_ptr(Par);                                              // execute pointer halve-function

    uint16_t (*func_ptr_array[3]) (uint16_t) = {&xDouble, &xSquare, &xHalve};   // create array of function pointers (see NOTE#1)
    uint16_t Res4 = func_ptr_array[DOUBLE_IDX](Res2);

    printf(" Size = %d B\n",sizeof(func_ptr));                                  // results 4 bytes since since PC's memory is 32-bit wide
    printf(" -----\n");
    printf(" Res1 = %d\n",Res1);                                                // results 8 (i.e. Par*2)
    printf(" Res2 = %d\n",Res2);                                                // results 16 (i.e. Par^2)
    printf(" Res3 = %d\n",Res3);                                                // results 2 (i.e. Par/2)
    printf(" -----\n");
    printf(" Res4 = %d\n",Res4);                                                // results 32 (i.e. 2*Res4)

    return 1;

}


/* NOTES */

// 1. In MCU implementation, adding the keyword "const" during the declaration assures the array of function pointers
//    is allocated in the program-memory (besides making the pointed functions no more modifiable):
//    a. "uint16_t (*func_ptr_array[3]) (uint16_t)" -> allocated into data-memory (RAM);
//    b. "uint16_t (* const func_ptr_array[3]) (uint16_t)" -> allocated into program-memory (flash);