
/*
 * Script showing an example of how to handle struct arrays.
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

/* DEFINES */

#define LEN             (uint8_t) 5
#define W1ID            (uint8_t) 1
#define W2ID            (uint8_t) 2


/* TYPEDEFS */

typedef struct {
    float re;
    float im;
} complex_t;


/* FUNCTIONS */

void ModifyWave( complex_t *arg[], uint8_t id, uint8_t pos ){
    //arg[id-1][pos].re = 4.4;
    //(*(arg[id-1]+pos)).re = 4.4;
    (arg[id-1]+pos)->re = 4.4;                                              // all these x3 instructions are identical
}

void PrintWave( complex_t *arg[], uint8_t id ){
    uint8_t j;
    for( j=0; j<LEN; j++ ){
        printf(" [%d] : %1.1f | %1.1fj\n",j,arg[id-1][j].re,arg[id-1][j].im);
    }
    printf(" -----\n");
}


/* MAIN */

int main( void ){
    complex_t Wave1[LEN] = {[0 ... LEN-1] = {3.3, 5.6}};                    // to initialize all elements to the specified constant (the members here are implicit, could have been also "{.re=3.3, .im=5.6}")
    complex_t Wave2[LEN] = {{7.7, -7.8}};                                   // NB: this initializes only the 1st element (all others are set to 0)
    complex_t *pWaves[2] = {Wave1,&Wave2[0]};
    PrintWave(pWaves,W1ID);
    ModifyWave(pWaves,W1ID,3);
    PrintWave(pWaves,W1ID);
    printf(" Size = %d B\n",sizeof(Wave1));                                 // results 40 bytes since sizeof(float) = 4
    return 1;
}
