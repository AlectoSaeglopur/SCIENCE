
/*
 * Script showing an example of bit-fields structure and its inclusion inside a union
 * in order to choose between the single error flags or the entire error page.
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>


/* TYPEDEFS */

typedef struct {
    uint16_t flagA: 4;                                                  // x4 bits are allocated for FlagA (least-significative)
    uint16_t flagB: 3;
    uint16_t flagC: 1;
    uint16_t flagD: 2;
    uint16_t flagE: 6;                                                  // x6 bits are allocated for FlagE (most-significative)
} err_flags_t;                                                          // bit-fields structure containing all error flags (its size is 2 bytes)

typedef union {
    uint16_t page;                                                 
    err_flags_t flags;
} err_page_t;                                                           // uint16_t union storing the entire error page and/or all each sub-flags


/* MAIN */

int main( void ){
    err_page_t Var;
    Var.flags.flagA = 1;
    Var.flags.flagB = 5;
    Var.flags.flagE = 62;
    printf("FlagE = x%X\n",Var.flags.flagE);                            // returns 0x 3E = 62
    printf("Page = x%X\n",Var.page);                                    // returns 0x F851 = b 1111 | 1000 | 0101 | 0001 = 62(6) | 0(1) | 0(1) | 5(3) | 1(4)
    printf("Size of 'Var' = %d B\n",sizeof(Var));                       // returns 2 (bytes)
    return 1;
}


/* NOTES */

// 1. Running "sizeof(Var.Flags.FlagE)" would cause an error, since "sizeof" cannot be applied to bit-fields.

// 2. The only way to retrieve the overall value of a bit-fields struct is to include this inside a union (like here).
//    In fact, printing just "Var.Flags" would return a wrong value.