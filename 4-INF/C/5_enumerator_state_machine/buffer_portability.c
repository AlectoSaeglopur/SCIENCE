/*
 * Script showing an example of struct of functions to handle data-buffers and increase code portability.
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>


/* DEFINES */

#define LEN         (uint8_t) 5


/* TYPEDEFS */

typedef struct {
    uint8_t (*read) ( uint8_t );
    void (*write) ( uint8_t, uint8_t );
    void (*reset) ( void );
} buf_functs_t;                                                     // structure containg all function prototypes for handling buffers of data

typedef enum {
    BUF1_ID = 0,
    BUF2_ID
} buf_id_t;


/* PROTOTYPES */

uint8_t read_buf_1( uint8_t );
void write_buf_1( uint8_t, uint8_t );
void reset_buf_1( void );
uint8_t read_buf_2( uint8_t );
void write_buf_2( uint8_t, uint8_t );
void reset_buf_2( void );


/* VARIABLES */

uint8_t Buf1[LEN] = {0};
uint8_t Buf2[LEN] = {0};
const buf_functs_t access_buf[] = {                                 // array of struct for function pointers stored into program-memory since declared as "const"
    {read_buf_1,write_buf_1, reset_buf_1},
    {read_buf_2,write_buf_2, reset_buf_2}
};


/* FUNCTIONS */

uint8_t read_buf_1( uint8_t idx ){
    uint8_t Val = 0xFF;
    if( (Buf1 != NULL) && (idx < LEN) ){
        Val = Buf1[idx];
    }
    return Val;
}

void write_buf_1( uint8_t idx, uint8_t val ){
    if( (Buf1 != NULL) && (idx < LEN) ){
        Buf1[idx] = val;
    }
}

void reset_buf_1( void ){
    if( Buf1 != NULL ){
        memset(Buf1,0xFF,LEN);
    }
}

uint8_t read_buf_2( uint8_t idx ){
    uint8_t Val = 0xFF;
    if( (Buf2 != NULL) && (idx < LEN) ){
        Val = Buf2[idx];
    }
    return Val;
}

void reset_buf_2( void ){
    if( Buf2 != NULL ){
        memset(Buf2,0x00,LEN);
    }
}

void write_buf_2( uint8_t idx, uint8_t val ){
    if( (Buf2 != NULL) && (idx < LEN) ){
        Buf2[idx] = val;
    }
}

void print_buffer( uint8_t BufId ){
    uint8_t j;
    printf(" BUF #%d >>",BufId+1);
    for( j=0; j<LEN; j++ ){
        printf(" %2X",access_buf[BufId].read(j));
    }
    printf("\n");
}


/* MAIN */

int main( void ){

    print_buffer(BUF1_ID);                                          // results  0  0  0  0  0 (before changes)
    access_buf[BUF1_ID].write(1,0xA2);
    access_buf[BUF1_ID].write(2,0x63);
    access_buf[BUF1_ID].write(4,0x58);
    print_buffer(BUF1_ID);                                          // results  0 A2 63  0 58 (after writes)
    access_buf[BUF1_ID].reset();
    print_buffer(BUF1_ID);                                          // results FF FF FF FF FF (after reset)
    print_buffer(BUF2_ID);                                          // results  0  0  0  0  0 (never modified)
    
    return 1;
}