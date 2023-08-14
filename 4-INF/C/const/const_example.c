
/** LIBRARIES **/

#include <stdio.h>
#include <stdint.h>

/** TYPE-DEFS **/

typedef struct {
    uint8_t     A;
    int16_t     B;
    uint32_t    C;
} vkn_t;

/** VARIABLES **/

vkn_t Var1 = { .A=11, .B=22, .C=33};
const vkn_t * Var2;
vkn_t * const Var3 = &Var1;
const vkn_t * const Var4;

/** FUNCTIONS **/

void foo1( vkn_t Par ){
    Par.A = 55;                                     // only Par is changed (i.e. local copy), but Var1 is not modified!
}

void foo2( vkn_t *Par ){
    Par->A = 66;
}

void foo3( const vkn_t *Par ){
    // Par->A = 88;                                 // compiler error! since defined as const
    Par = Var2;                                     // Par (i.e. a local pointer initially pointing to Var1) now points to Var2, but this does not affect Var1!
}


int main( void ){

    printf(" ------ (1)\n");
    printf("A = %d\n",Var1.A);
    printf("B = %d\n",Var1.B);
    printf("C = %d\n",Var1.C);
    

    foo1(Var1);
    printf(" ------ (2)\n");
    printf("A = %d\n",Var1.A);
    printf("B = %d\n",Var1.B);
    printf("C = %d\n",Var1.C);

    foo2(&Var1);
    printf(" ------ (3)\n");
    printf("A = %d\n",Var1.A);
    printf("B = %d\n",Var1.B);
    printf("C = %d\n",Var1.C);

    foo3((const vkn_t *)(&Var1));
    printf(" ------ (4)\n");
    printf("A = %d\n",Var1.A);
    printf("B = %d\n",Var1.B);
    printf("C = %d\n",Var1.C);

    Var2 = &Var1;                           // allowed!
    // Var2->A = 44;                        // error since pointed value is const!
    printf(" ------ (5)\n");
    printf("A = %d\n",Var2->A);
    printf("B = %d\n",Var2->B);
    printf("C = %d\n",Var2->C);

    // Var3 = &Var1;                           // error since pointer is const! (cannot be reassigned)
    Var3->A = 44;                           // allowed!
    printf(" ------ (6)\n");
    printf("A = %d\n",Var3->A);
    printf("B = %d\n",Var3->B);
    printf("C = %d\n",Var3->C);

    // Var4 = &Var1;                           // error due to 2nd const!
    // Var4->A = 44;                        // error due to 1st const!

    return 1;
} 

/** NOTES **/

// 1. for more info see : https://www.geeksforgeeks.org/const-qualifier-in-c/

