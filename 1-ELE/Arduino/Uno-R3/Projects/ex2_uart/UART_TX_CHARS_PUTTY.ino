
/** DEFINES **/
#define ASCII_OFS         48
#define MAX_DIM           100

/** PARAMETERS **/
const uint32_t FreqOsc = 16000000;                // Oscillator frequency
const uint32_t Rb = 100000;                       // Baud rate [b/s]
const bool EnPB = false;                          // Enabling of (even) parity bit
const uint8_t Ndb = 7;                            // Number of data bits per frame

/** VARIABLES **/
uint16_t Time = 0;
uint32_t Len = 15;
char Msg[MAX_DIM];


/** MAIN SETUP **/
void setup(){

  Msg[0] = '*';
  Msg[1] = ' ';
  Msg[2] = 'U';
  Msg[3] = 'A';
  Msg[4] = 'R';
  Msg[5] = 'T';
  Msg[6] = '-';
  Msg[7] = 'T';
  Msg[8] = 'x';
  Msg[9] = ' ';
  Msg[13] = '\r';
  Msg[14] = '\n';

  UART_Init();
  
}


/** MAIN LOOP **/
void loop(){

  UpdateTchars();
  UART_Tx(Msg,Len);
  Time++;
  delay(1000);

}


/**
 *	Function for initializing UART, specifying baud rate and frame format.
 **/
void UART_Init( void ){

  uint8_t TmpByte;
  uint32_t TmpWord;

  TmpByte = UCSR0B;                                       // UCSR0B is already defined in BSP as *(volatile uint8_t *)(RegAddr)
  
  /* Set UART baud rate */ 
  TmpWord = FreqOsc/(16*Rb)-1;                            // Calculate baud rate scale factor
  
  UBRR0L = (uint8_t)(TmpWord&0x000000FF);                 // Write UBRR0[0:7] bits
  UBRR0H = (uint8_t)((TmpWord>>8)&0x0000000F);            // Write UBRR0[11:8] bits

  /* Set frame format */
  TmpByte = UCSR0B;                                       // Read content of UCSR0B register
  TmpByte &= 0xFB;                                        // Set UCSZ02 bit (UCSR0B[2]='0' for 7 or 8 data bits)
  UCSR0B = TmpByte;                                       // Write updated register UCSR0B
  
  TmpByte = UCSR0C;                                       // Read content of UCSR0C register [NB: UCSR0B is defined in BSP as *(volatile uint8_t *)(RegAddr)]
  TmpByte &= 0xF9;
  if ( Ndb == 7 )
    TmpByte |= 0x04;                                      // Set UCSZ01 and UCSZ00 bits (UCSR0C[2:1]='10' for 7 data bits)
  else
    TmpByte |= 0x06;                                      // Set UCSZ01 and UCSZ00 bits (UCSR0C[2:1]='11' for 8 data bits)
  TmpByte &= 0x3F;                                        // Set UMSEL bits (UCSR0C[7:6] = '00' for asynchronous mode)
  TmpByte &= 0xCF;                                        // Set UPM0 bits (UCSR0C[5:4]= '00' for disabling parity bit)
  if ( EnPB )
    TmpByte |= 0x20;                                      // Set UPM0 bits (UCSR0C[5:4]= '10' for enabling even parity bit)
  TmpByte &= 0xF7;                                        // Set USBS0 bit (UCSR0C[3] = '0' for single stop bit)
  TmpByte &= 0xFE;                                        // Set UCPOL0 bit (UCSR0C[0] = '0', not used in asynchronous mode)
  UCSR0C = TmpByte;                                       // Write updated value into UCSR0C register
  
/* Enable UART transmitter */
  TmpByte = UCSR0B;                                       // Read content of UCSR0B register
  TmpByte |= 0x08;                                        // Set TXEN0 bit (UCSR0B[3]) to '1' for enabling USART TX
  UCSR0B = TmpByte;                                       // Write updated value into UCSR0B register
  
}


/**
 *  Function for transmitting characters via UART.
 **/
bool UART_Tx( char *Data, uint32_t Len ){
  
  uint8_t MaxAtp = 20;
  uint8_t Atp;
  bool Ret = true;
  uint32_t j;
  
  /* Wait for empty transmit buffer */
  for ( j=0; j<Len; j++ ){
    Atp = 0;
    while( !(UCSR0A & 0x20) && (Atp < MaxAtp )){          // Check if UCSR0A[5]=UDRE0 is '1', i.e. ready to receive data for new transmission
      delayMicroseconds(500);
      Atp++;
    }
    /* Write data into USART Data Register if buffer ready, otherwise report error and exit */
    if ( Atp < MaxAtp ){
      UDR0 = Data[j];                                     // NB: when using frames with less than 8 bits, the MSB are ignored
    } else {
      Ret = false;
      break;
    }
  }  
  return Ret;
  
}


/**
 *  Function for getting corresponding characters from current time.
 **/
void UpdateTchars ( void ){
  
  Msg[12] = (char)(Time%10+ASCII_OFS);
  Msg[11] = (char)((Time%100-Time%10)/10+ASCII_OFS);
  Msg[10] = (char)((Time-(Time%100))/100+ASCII_OFS);

}
