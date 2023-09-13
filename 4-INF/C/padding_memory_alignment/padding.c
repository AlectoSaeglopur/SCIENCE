
/*
 * Script showing an example of byte padding inside a structure.
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>


/* TYPEDEFS */

typedef struct {
    uint16_t MemA;
    uint32_t MemB;
} padding_t;


/* MAIN */

int main( void ){
    padding_t VarS;
    uint16_t VarA;
    uint32_t VarB;
    printf("Size (standa) = %d B\n",sizeof(VarA)+sizeof(VarB));     // returns 6 (bytes), thus no byte-padding has been applied to the standalone variables
    printf("Size (struct) = %d B\n",sizeof(VarS));                  // returns 8 (bytes), thus 1-byte-padding has been applied to the structure
    return 1;
} 
