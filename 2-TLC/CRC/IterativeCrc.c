
/* LIBRARIES */

#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>



/* PROTOTYPES */

uint16_t Crc16Tot( uint8_t *Msg, uint32_t Len, uint16_t InitSt );
uint16_t Crc16Iter( uint8_t *Msg, uint32_t Len, uint16_t InitSt, bool IsLastBlk );
void PrintFileInfo( uint8_t *Vect, uint32_t Len );
uint32_t AddElem( uint8_t *Vect, uint32_t Len, uint8_t Val, uint32_t Prd );



/* DEFINES AND CONSTANTS */

#define CRC_ORDER   16 
#define MAXDIM      600000
const uint16_t GenPoly = 0x1021;                                            // i.e. g(x) = x^16 + x^12 + x^5 + 1
const uint16_t CrcInit = 0x0000;                                            // Initial condition of the shift register



/* MAIN */

int main(){

#ifndef SIMPLE_SIMULATION

    uint32_t Len = 0;                                                       // File size (in bytes)
    uint32_t BlkSize = 200;
    uint16_t CrcIter = CrcInit;
    uint16_t CrcTot;
    uint32_t j;

    uint8_t Msg[MAXDIM] = {[0 ... MAXDIM-1] = 3};
    FILE *fptrRd = NULL;                                                    // File pointer for reading binary input file
    FILE *fptrWr = NULL;                                                    // File pointer for writing text output file

    /* Open input binary file */
    fptrRd = fopen("ObdhFlightFw.bin","rb");
    // fptrRd = fopen("ObdhBlinkFw.bin","rb");
    
    if ( fptrRd == NULL ){
        printf("ERROR : unable to open file!\n");
        exit(EXIT_FAILURE);
    }

    fseek(fptrRd, 0L, SEEK_END);                                            // Move the file pointer to its end
    Len = ftell(fptrRd);                                                    // Estimate current pointer position (i.e. its size)
    fseek(fptrRd, 0L, SEEK_SET);                                            // Move the file pointer back to its beginning
    fread(Msg,1,Len,fptrRd);                                                // Read and copy the file bytes into Msg array
    fclose(fptrRd);                                                         // Close file
    PrintFileInfo(Msg,Len);

#ifdef DBG_ADDELEM_FUNCT
    uint16_t Len = MAXDIM/2;
    uint8_t Msg[MAXDIM] = {[0 ... MAXDIM/2-1] = 1};
    PrintFileInfo(Msg,Len);
    Len = AddElem(Msg,Len,0xFF,255);
    PrintFileInfo(Msg,Len);
#endif
    /* Add 0xFF every 255 bytes */
    Len = AddElem(Msg,Len,0xFF,255);
    PrintFileInfo(Msg,Len);

#ifdef CHECK_CRC_AFTER_ERASURE
    memset(Msg,0xFF,Len);                                                   // Uncomment to check the correct erasure of flash memory         
#endif

#ifdef CHECK_LOADED_FILE_FW
    /* Open output text file */
    fptrWr = fopen("LogCheckFw.txt","w");
    if ( fptrWr == NULL ){
        printf("ERROR : unable to open file!\n");
        exit(EXIT_FAILURE);
    }
    for ( j=0; j<MAXDIM; j++ ){
        if ( j%256 == 0 )
            fprintf(fptrWr,"\n\n%8X  |  ",j);
        if ( j<Len )
            fprintf(fptrWr,"%2X",Msg[j]);
        else
            fprintf(fptrWr,"FF");
    }    
    fclose(fptrWr);
#endif

    /* Overall CRC estimate */
    CrcTot = Crc16Tot(Msg,Len,CrcInit);
    printf("\n * CRC-TOT = 0x%4X\n",CrcTot);

    /* Open output text file */
    fptrWr = fopen("LogCheckCrc.txt","w");
    if ( fptrWr == NULL ){
        printf("ERROR : unable to open file!\n");
        exit(EXIT_FAILURE);
    }

    /* Iterative CRC estimate (1 byte of Msg per cycle) */
    for ( j=0; j<Len; j+=BlkSize ){
        if ( (j+BlkSize) < Len ){
            CrcIter = Crc16Iter(&Msg[j],BlkSize,CrcIter,false);    
        } else {
            CrcIter = Crc16Iter(&Msg[j],Len-j,CrcIter,true);
        }
        fprintf(fptrWr,"BLK %d | Size = %d | FwIdx = %d | CRC = %X\r\n",j/BlkSize,BlkSize,j+BlkSize,CrcIter);
    }
    fclose(fptrWr);
    printf("\n * CRC-ITR = 0x%4X\n\n",CrcIter);

#else

    uint8_t Msg[] = {0x30,0x29,0xF1,0x4C};                                  // Info message
    uint8_t BlkSize = 3;

    uint16_t Len = sizeof(Msg);
    uint16_t CrcIter = CrcInit;
    uint16_t CrcTot;
    uint8_t j;
    
    /* Parameters recap */
    printf("\n - GenPoly = 0x%X\n",GenPoly);
    printf(" - Msg = { 0x%X, 0x%X, 0x%X, 0x%X }\n",Msg[0],Msg[1],Msg[2],Msg[3]);
    printf(" - Len = %d\n",Len);
    
    /* Overall CRC estimate */
    CrcTot = Crc16Tot(Msg,Len,CrcInit);
    printf("\n * CRC-tot = 0x%4X\n",CrcTot);

    /* Iterative CRC estimate (1 byte of Msg per cycle) */
    for ( j=0; j<Len; j+=BlkSize ){
        if ( (j+BlkSize) < Len ){
            CrcIter = Crc16Iter(&Msg[j],BlkSize,CrcIter,false);    
        } else {
            CrcIter = Crc16Iter(&Msg[j],Len-j,CrcIter,true); 
        }     
//        printf(" * CRC-pt%d = 0x%4X\n",j/BlkSize,CrcIter);
    }
    printf(" * CRC-itr = 0x%4X\n",CrcIter);

#endif

}



/* FUNCTIONS */

/**
 * 	@brief Cyclic Redundancy Check calculation
 *
 *	@param Msg   Pointer to the byte-array to be evaluated
 *	@param Len   Byte-lenght of the array to be evaluated
 *  @param InitSt   Initial state of the shift register
 *  @param IsLastBlk   Flag identifying if the current message block is the last one
 *	@return CrcVal   16-bit CRC estimated
 *
 * Function for iteratively estimating the 16-bit CRC following the
 * CCITT standard (most significant bit of byte 0 is the first to
 * enter the shift register in its lowest grade position).
 */
uint16_t Crc16Iter( uint8_t *Msg, uint32_t Len, uint16_t InitSt, bool IsLastBlk ){

    uint32_t BitLen = 8*Len;                    // Bit-length of the input message
    uint16_t CrcVal = InitSt;                   // I/O CRC value
    uint8_t MaskIn = 0x80;                      // Current input bit mask
    uint16_t MaskOut = 0x8000;                  // Shift register output bit mask
    uint16_t MaskBitIdx = 0x00000007;
    uint8_t InBit, BitIdx;
    uint16_t OutBit;
    uint32_t i, ByteIdx;

    for ( i=0; i<BitLen; i++ ){
        ByteIdx = (i>>3);
        BitIdx = i&MaskBitIdx;
        InBit = ((Msg[ByteIdx]&(MaskIn>>BitIdx))>0);
        OutBit = (CrcVal&MaskOut);
        CrcVal = (CrcVal<<1);
        CrcVal += InBit;
        if ( OutBit != 0 ){
            CrcVal ^= GenPoly;
        }
    }

    if ( IsLastBlk == true ){
        for ( i=0; i<CRC_ORDER; i++ ){
            OutBit = (CrcVal&MaskOut);
            CrcVal = (CrcVal<<1);
            if ( OutBit != 0 ){
                CrcVal ^= GenPoly;
            }
        }
    }

    return CrcVal;

}


/**
 * 	@brief Cyclic Redundancy Check calculation
 *
 *	@param *Msg   Pointer to the byte-array to be evaluated
 *	@param Len   Byte-lenght of the array to be evaluated
 *  @param InitSt   Initial state of the shift register
 *	@return CrcVal   16-bit CRC estimated
 *
 * Function for estimating in a single step the 16-bit CRC following
 * the CCITT standard (most significant bit of byte 0 is the first
 * to enter the shift register in its lowest grade position).
 */
uint16_t Crc16Tot( uint8_t *Msg, uint32_t Len, uint16_t InitSt ){

    uint32_t BitLen = 8*Len;                    // Bit-length of the input message
    uint16_t CrcVal = InitSt;                   // I/O CRC value
    uint8_t MaskIn = 0x80;                      // Current input bit mask
    uint16_t MaskOut = 0x8000;                  // Shift register output bit mask
    uint16_t MaskBitIdx = 0x00000007;
    uint8_t InBit, BitIdx;
    uint16_t OutBit;
    uint32_t i, ByteIdx;

    for ( i=0; i<BitLen; i++ ){
        ByteIdx = (i>>3);
        BitIdx = i&MaskBitIdx;
        InBit = ((Msg[ByteIdx]&(MaskIn>>BitIdx))>0);
        OutBit = (CrcVal&MaskOut);
        
        CrcVal = (CrcVal<<1);
        CrcVal += InBit;
        if ( OutBit != 0 ){
            CrcVal ^= GenPoly;
        }
    }

    for ( i=0; i<CRC_ORDER; i++ ){
        OutBit = (CrcVal&MaskOut);
        CrcVal = (CrcVal<<1);
        if ( OutBit != 0 ){
            CrcVal ^= GenPoly;
        }
    }

    return CrcVal;

}


void PrintFileInfo( uint8_t *Vect, uint32_t Len ){

    printf("\n * File size = %d bytes\n",Len);

#if 0
    uint16_t j;
    printf(" - File content =\n");

    for ( j=0; j<Len; j++ ){
        if ( (j % 20) == 0 ){
            printf("\n    [%4d] ",j);
        }
        printf("%2X ",Vect[j]);
    }
    printf("\n");
#endif

}


uint32_t AddElem( uint8_t *Vect, uint32_t Len, uint8_t Val, uint32_t Prd ){

    uint32_t WrIdx = 0;                     // Writing index and in the end the new array length (in bytes)
    uint8_t TmpBuf[MAXDIM] = {0};
    uint32_t i;

    memcpy(TmpBuf,Vect,Len);
    for ( i=0; i<Len; i++ ){
        Vect[WrIdx] = TmpBuf[i];
        WrIdx++;
        if ( (((i+1)%Prd) == 0) && (i != 0) ){
            Vect[WrIdx] = Val;
            WrIdx++;
        }
    }
    return WrIdx;
     
}
