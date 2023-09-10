
/**
 * Title: UART RECEPTION/TRANSMISSION BASE ON ATMEGA328P MICROCONTROLLER (ARDUINO UNO BOARD)
 * Author: Filippo Valmori
 * Date: 11/04/2020
 **/



/*** DEFINES AND CONSTANTS ***/

#define RX_DIM            4                                 // Rx buffer size [B]
#define TX_DIM            3                                 // Tx buffer size [B]
#define RST               3                                 // Reset button pin ID
#define LED0              12                                // LED0 Arduino pin ID
#define LED1              11                                // LED1 Arduino pin ID
#define LED2              9                                 // LED2 Arduino pin ID
#define LED3              8                                 // LED3 Arduino pin ID
const uint32_t FreqOsc = 16000000;                          // Oscillator frequency [Hz]
const uint8_t TrgRxMsg[] = {0xD3,0x91,0xA0,0xC4};           // Expected triggering message from FPGA



/*** PARAMETERS ***/

uint32_t RateRx = 100000;                                   // UART Rx baud rate [b/s]
uint32_t RateTx = 100000;                                   // UART Tx baud rate [b/s]



/*** VARIABLES ***/

uint8_t pRxBuf[RX_DIM] = {0};                               // Rx buffer
uint8_t pTxBuf[TX_DIM] = {0};                               // Tx buffer
uint8_t RxIdx = 0;                                          // Index within Rx buffer
bool EnableTx = false;                                      // Flag for enabling transmission to FPGA
bool EnableRst = false;                                     // Flag for resetting Rx variables
bool Ack = false;                                           // Flag identifying correct message reception
uint16_t Cycle = 0;                                         // Counter for the current number of cycles
uint8_t LedsVal;                                            // Pseudo-random value to be transmitted to FPGA



/*** MAIN ***/

int main(){

  /* Setup */
  Init_Pins();                                              // Initialize I/O pins
  Init_UART();                                              // Initialize UART interface for reception
  Init_Timer();                                             // Initialize internal timer
  Init_Interrupt();                                         // Initialize interrupts
  Reset_LEDs();                                             // Reset LEDs state

  /* Loop */
  while (1) {
  
    /* Reset */
    if ( EnableRst ){                                         // Execute reset upon button pushing
      Reset_LEDs();
      Flush_RxBuffer();
      EnableRst = false;
    }
    
    /* End of reception */
    if ( RxIdx == RX_DIM ){
      Ack = Check_RxMsg();                                    // Check received message content
      Start_Timer();                                          // Start timer for transmission
      Reset_LEDs();
      Flush_RxBuffer();
    }

    /* Transmission */
    if ( EnableTx ){
        Stop_Timer();                                         // Disable and reset timer counting
        if ( RateRx != RateTx )
          Set_UART_Rate(RateTx);                              // Set Tx baud rate before transmission
        if ( Ack ){
          LedsVal = (uint8_t)(Cycle%15);                      // Estimate new configuration value
          Update_LEDs(LedsVal);                               // Update LEDs configuration
          memset(pTxBuf,LedsVal,TX_DIM);                      // Copy new configuration value in Tx buffer
        } else {
          pTxBuf[0] = 0x00;
          pTxBuf[0] = 0xCC;
          pTxBuf[0] = 0xFF;
        }
        UART_Tx(pTxBuf,TX_DIM);                               // Start UART transmission towards FPGA
        if ( RateRx != RateTx )
          _delay_ms(5);                                       // Wait for above UART transmission to be over
          Set_UART_Rate(RateRx);                              // Reset Rx baud rate after transmission
        EnableTx = false;                                     // Clear transmission flag
    }
    
    Cycle++;                                                  // Increment cycle counter
    _delay_ms(100);                                           // Wait 100ms
  
  }
}



/*** EXTRA FUNCTIONS ***/

/**
 *  Function for initializing GPIOs.
 **/
void Init_Pins( void ){
  
  uint8_t TmpByte;

  TmpByte = (1<<RST);                                       // Set RST pin (MCU's PD3) as input (0) [same as pinMode(RST,INPUT)]
  DDRD &= ~TmpByte;                                         // Write updated value into DDRD register

  TmpByte = (1<<(LED0-8));                                  // Set LED0 pin (MCU's PB4) as output (1) [same as pinMode(LED0,OUTPUT)]
  TmpByte |= (1<<(LED1-8));                                 // Set LED1 pin (MCU's PB3) as output (1) [same as pinMode(LED1,OUTPUT)]
  TmpByte |= (1<<(LED2-8));                                 // Set LED2 pin (MCU's PB1) as output (1) [same as pinMode(LED2,OUTPUT)]
  TmpByte |= (1<<(LED3-8));                                 // Set LED3 pin (MCU's PB0) as output (1) [same as pinMode(LED3,OUTPUT)]
  DDRB |= TmpByte;                                          // Write updated value into DDRB register

}


/**
 *	Function for initializing UART interface.
 **/
void Init_UART( void ){

  uint8_t TmpByte;

  /* Set UART baud rate */
  Set_UART_Rate(RateRx);                                    // Set UART Rx rate
  
  /* Set frame format */
  UCSR0B &= 0xFB;                                           // Set UCSZ02 bit (UCSR0B[2]='0' for 8 data bits)
  TmpByte = UCSR0C;                                         // Read content of UCSR0C register [NB: UCSR0B is defined in BSP as *(volatile uint8_t *)(RegAddr)]
  TmpByte |= 0x06;                                          // Set UCSZ01 and UCSZ00 bits (UCSR0C[2:1]='11' for 8 data bits)
  TmpByte &= 0x3F;                                          // Set UMSEL bits (UCSR0C[7:6] = '00' for asynchronous mode)
  TmpByte &= 0xCF;
  TmpByte |= 0x20;                                          // Set UPM0 bits (UCSR0C[5:4] = '10' for enabling even parity bit)
  TmpByte &= 0xF7;                                          // Set USBS0 bit (UCSR0C[3] = '0' for single stop bit)
  TmpByte &= 0xFE;                                          // Set UCPOL0 bit (UCSR0C[0] = '0', not used in asynchronous mode)
  UCSR0C = TmpByte;                                         // Write updated value into UCSR0C register

  /* Enable UART transmitter and receiver */
  UCSR0B |= 0x18;                                           // Set RXEN0 and TXEN0 bits (UCSR0B[4:3] = '11' for enabling UART RX and TX)

}


/**
 *  Function for setting UART baud rate [1].
 **/
void Set_UART_Rate( uint32_t Rate ){

  uint32_t TmpWord;

  TmpWord = FreqOsc/(16*Rate)-1;                            // Calculate baud rate scale factor
  UBRR0L = (uint8_t)(TmpWord&0x000000FF);                   // Write UBRR0[0:7] bits
  UBRR0H = (uint8_t)((TmpWord>>8)&0x0000000F);              // Write UBRR0[11:8] bits
}


/**
 *  Function for initializing TC1 timer.
 **/
void Init_Timer( void ){

  uint8_t TmpByte;

  /* Set Waveform Generation Mode */
  TCCR1A &= 0xFC;                                           // Set WGM11 and WGM10 bits (TCCR1A[1:0] = '00' for choosing CTC mode)
  TmpByte = TCCR1B;                                         // Read content of TCCR1B register
  TmpByte &= 0xE7;                                          // Set WGM13 bit (TCCR1B[4] = '0' for choosing CTC mode)
  TmpByte |= 0x08;                                          // Set WGM12 bit (TCCR1B[3] = '1' for choosing CTC mode)
  TCCR1B = TmpByte;                                         // Write updated value into TCCR1B register

  /* Set Output Compare register */
  OCR1A = 0x7A11;                                           // Set OCR1A[15:0] to 31249
  TCCR1B &= 0xF8;                                           // Set CS12, CS11 and CS10 bits (TCCR1B[2:0] = '000' for no clock source, i.e. timer stopped)

  /* Reset counter value */
  TCNT1 = 0x0000;                                           // Set TCNT1[15:0] to 0

}


/**
 *  Function for initializing interrupts.
 **/
void Init_Interrupt( void ){

  uint8_t TmpByte;

  /* Enable UART Receive Complete interrupt */
  UCSR0B |= 0x80;                                           // Set RXCIE0 bit (UCSR0B[7] = '1' for enabling interrupt)

  /* Configure external interrupt 1 */
  TmpByte = EICRA;                                          // Read content of EICRA register
  TmpByte &= 0xF3;                                          // Set ISC11 and ISC10 bits (EICRA[3:2] = '10' for generating interrupt upon a falling edge of INT1)
  TmpByte |= 0x08;
  EICRA = TmpByte;                                          // Write updated value into EICRA register
  
  /* Enable external interrupt 1 */
  EIMSK |= 0x02;                                            // Set INT1 bit (EIMSK[1] = '1' for enabling INT1 interrupt)  

  /* Enable Global Interrupts */
  SREG |= 0x80;                                             // Set I bit (SREG[7] = '1' for enabling Global Interrupt)

}


/**
 *  Function for resetting all LEDs on.
 **/
void Reset_LEDs( void ){

  uint8_t TmpByte;

  TmpByte = (1<<(LED0-8));                                  // Set LED0 pin (MCU's PB4) high (1) [same as digitalWrite(LED0,HIGH)]
  TmpByte |= (1<<(LED1-8));                                 // Set LED1 pin (MCU's PB3) high (1) [same as digitalWrite(LED1,HIGH)]
  TmpByte |= (1<<(LED2-8));                                 // Set LED2 pin (MCU's PB1) high (1) [same as digitalWrite(LED2,HIGH)]
  TmpByte |= (1<<(LED3-8));                                 // Set LED3 pin (MCU's PB0) high (1) [same as digitalWrite(LED3,HIGH)]
  PORTB |= TmpByte;                                         // Write updated value into PORTB register  

}


/**
 * Function for flushing the Rx buffer.
 **/
void Flush_RxBuffer( void ){
  
  memset(pRxBuf,0,RX_DIM);                                  // Reset Rx buffer content
  RxIdx = 0;                                                // Reset Rx buffer index

}


/**
 * Function for checking the content of the Rx buffer.
 **/
bool Check_RxMsg( void ){

  uint8_t j;
  bool Ret = true;
  
  for ( j=0; j<RX_DIM; j++ ){
    if ( pRxBuf[j] != TrgRxMsg[j] ){
      Ret = false;
      break;
    }
  }
  return Ret;
  
}


/**
 * Function for starting timer (TC1) counting.
 **/
void Start_Timer( void ){

  TCCR1B |= 0x05;                                           // Set CS12 and CS10 bits (TCCR1B[2] = TCCR1B[0] = '1' for choosing 1024 as prescaler and start timer)
  TIMSK1 |= 0x02;                                           // Set OCIEA bit (TIMSK1[1] = '1' for enabling Timer A Compare Match interrupt)

}


/**
 * Function for stopping and resetting timer (TC1) counting.
 **/
void Stop_Timer( void ){

  TIMSK1 &= 0xFD;                                           // Set OCIEA bit (TIMSK1[1] = '0' for disabling Timer A Compare Match interrupt)
  TCCR1B &= 0xF8;                                           // Set CS12, CS11 and CS10 bits (TCCR1B[2:0] = '000' for no clock source, i.e. timer stopped)    
  TCNT1 = 0x0000;                                           // Set TCNT1[15:0] to 0 for resetting counter value

}


/**
 *  Function for updating LEDs state as a function of LedsVal variable.
 **/
void Update_LEDs( uint8_t LedsVal ){

  if ( LedsVal%2 )                                          // Set the 0x01-LED (LSB)
    PORTB |= (1<<(LED0-8));                                 // Set LED0 pin (MCU's PB4) high (1) [same as digitalWrite(LED0,HIGH)]
  else
    PORTB &= ~(1<<(LED0-8));                                // Set LED0 pin (MCU's PB4) low (0) [same as digitalWrite(LED0,LOW)]

  if ( (LedsVal%4 == 2) ||  (LedsVal%4 == 3) )              // Set the 0x02-LED
    PORTB |= (1<<(LED1-8));                                 // Set LED1 pin (MCU's PB3) high (1) [same as digitalWrite(LED1,HIGH)]
  else
    PORTB &= ~(1<<(LED1-8));                                // Set LED1 pin (MCU's PB3) low (0) [same as digitalWrite(LED1,LOw)]

  if ( (LedsVal%8 >= 4 ) &&  (LedsVal%8 <= 7) )             // Set the 0x04-LED
    PORTB |= (1<<(LED2-8));                                 // Set LED2 pin (MCU's PB1) high (1) [same as digitalWrite(LED2,HIGH)]
  else
    PORTB &= ~(1<<(LED2-8));                                // Set LED2 pin (MCU's PB1) low (0) [same as digitalWrite(LED2,LOW)]                           

  if ( LedsVal >= 8 )                                       // Set the 0x08-LED (MSB)
    PORTB |= (1<<(LED3-8));                                 // Set LED3 pin (MCU's PB0) high (1) [same as digitalWrite(LED3,HIGH)]
  else
    PORTB &= ~(1<<(LED3-8));                                // Set LED3 pin (MCU's PB0) low (0) [same as digitalWrite(LED3,LOW)]    

}


/**
 *  Function for transmitting multiple frames via UART.
 **/
void UART_Tx( uint8_t *Data, uint32_t Len ){
  
  uint8_t MaxAtp = 20;                                      // Maximum number of attempts for transmitting a byte
  uint8_t Atp;                                              // Number of attempts
  uint32_t j;
  
  for ( j=0; j<Len; j++ ){
    Atp = 0;
    while( !(UCSR0A & 0x20) && (Atp < MaxAtp )){            // Check if UCSR0A[5]=UDRE0 is '1' (i.e. ready to receive data for new transmission)
      _delay_us(500);                                       // Wait 500us between consecutive attempts of frame transmission 
      Atp++;
    }
    /* If butter ready, write data into USART Data Register. Otherwise, exit */
    if ( Atp < MaxAtp )
      UDR0 = Data[j];
    else
      break;                                                
  }
  
}


/**
 * Interrupt Service Routine triggered upon external interrupt (i.e. button pushing).
 **/
ISR( INT1_vect ){

  EnableRst = true;                                         // Enable reset flag
  
}


/**
 * Interrupt Service Routine triggered upon UART reception.
 **/
ISR( USART_RX_vect ){

  if ( RxIdx < RX_DIM ){
    pRxBuf[RxIdx] = UDR0;                                   // Read the received frame stored in UDR0 register
    RxIdx++;                                                // Increment Rx buffer index
  }

}


/**
 * Interrupt Service Routine triggered upon timer (TC1) expiration.
 **/
ISR( TIMER1_COMPA_vect ){

  EnableTx = true;                                          // Enable transmission flag
  
}



/*** NOTES ***/

// [0] Upon the UART reception of 4 consecutive data bytes (handled by a dedicated interrupt service routine), the MCU starts an internal
//     timer which after 2s generates an interrupt for acquiring the new LEDs configuration and enabling the transmission towards FPGA of
//     3 bytes specifying that configuration. In particular, if the last received message from FPGA is equal to 0xD391A0C4, the MCU
//     pseudo-randomly estimates the new configuration value as the modulo 15 of an internal counter incremented every 100 ms, and then
//     transmitted repeated x3. Otherwise, if message is corrupted or not matching the aforementioned triggering value, tha new LEDs state
//     is reset as all on. Moreover, a button connected to a GPIO is able to generate an external interrupt for flushing all Rx paramenters
//     and LEDs state (again as all on).
    
// [1] Concerning TC1, if Output Compare Register (OCR1A) = 0x7A11 = 31249 and Prescaler (N) = 1024, then Freq_OC1A = 16M/(2*N*(1+OCR1A))
//     = 0.25 Hz (i.e. a period of 4s). However, as shown in Fig.20-6, this period represents half the actual timer interrupt period
//     (i.e. the expected 2s).

// [2] The only parameters settable by user in this project/code are the TX and Rx baud rates. By default they are both set to 100 kb/s,
//     however they can have different values each other ranging from 1kb/s to 1Mb/s.
