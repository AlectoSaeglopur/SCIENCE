
/* LIBRARIES */

#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>



/* PROTOTYPES */

uint16_t Crc16(uint8_t* msg, uint16_t Len);
void FlipEndianess( uint8_t* msg, uint16_t Len );



/* DEFINES AND CONSTANTS */

const uint16_t GenPoly = 0x1021;                                            // Generator polynomial (e.g. 0x1021 means g(x) = x^16 +x^12 +x^5 +1)
const uint16_t Init = 0x0000;                                               // Initial condition of the shift register
const bool RevIn = false;                                                   // Reverse input message bytes endianess
const bool RevOut = false;                                                  // Reverse output CRC bytes endianess
const uint16_t XorOut = 0x0000;                                             // Value for the final CRC xor operation


/* MAIN */

int main(){

    uint16_t Len = 3;                                                       // Message length (in bytes)
    uint8_t msg[] = {0x31,0x27,0x9D};                                       // Message bytes

    uint16_t Crc;

    Crc = Crc16(msg,Len);
    printf("\n * CRC = 0x%4X\n",Crc);


}



/* FUNCTIONS */

uint16_t Crc16( uint8_t* msg, uint16_t Len ){

    uint8_t i;
    uint16_t Crc = Init;

    if ( RevIn )
        FlipEndianess(msg,Len);

    while (Len--) {
        Crc ^= (*msg++ << 8);
        for ( i=0; i<8; i++ )
            Crc = (Crc&0x8000) ? (Crc<<1)^GenPoly : Crc<<1;
    }

    if ( RevOut ){
        uint8_t InvCrc[2];
        InvCrc[0] = (uint8_t)((Crc>>8)&0x00FF);
        InvCrc[1] = (uint8_t)(Crc&0x00FF);
        FlipEndianess(InvCrc,2);
        Crc = (InvCrc[1]<<8)+InvCrc[0];
    }

    Crc ^= XorOut;

    return Crc;

}



void FlipEndianess( uint8_t* msg, uint16_t Len ){

    uint8_t *tmp = (uint8_t *)calloc(Len,sizeof(uint8_t));
    uint16_t BitLen = Len<<3;
    uint16_t j, ByteIdx;
    uint8_t BitIdx, BitRd;

    for ( j=0; j<BitLen; j++ ){
        ByteIdx = (j>>3);
        BitIdx = (j&0x0007);
        BitRd = (msg[ByteIdx]>>(7-BitIdx))&0x01;
        tmp[ByteIdx] |= (BitRd<<BitIdx);
    }
    memcpy(msg,tmp,Len);
    free(tmp);

}
