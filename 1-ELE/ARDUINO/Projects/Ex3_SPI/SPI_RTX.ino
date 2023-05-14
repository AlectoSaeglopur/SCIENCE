
/**
 * Title: SPI RECEPTION/TRANSMISSION BASE ON ATMEGA328P MICROCONTROLLER (ARDUINO UNO BOARD)
 * Author: Filippo Valmori
 * Date: 26/05/2021
**/
 

/****************************/
/*** PRAGMA AND LIBRARIES ***/
/****************************/

#pragma GCC optimize ("-O0")                                // disable compiler optimization


/*****************/
/*** CONSTANTS ***/
/*****************/

const uint32_t FreqOsc = 16000000;                          // Oscillator frequency [Hz]
#define BUF_DIM          20                                 // Tx/Rx buffer size [B]
#define RB_125K          1                                  // SPI RATE = 125 kb/s (i.e. SCK = 250 kHz)
#define RB_500K          3                                  // SPI RATE = 500 kb/s (i.e. SCK = 1 MHz)
#define RB_1M            4                                  // SPI RATE = 1 Mb/s (i.e. SCK = 2 MHz)
#define EIDLE           12                                  // EEPROM idle mode (not reading nor writing)
#define ERDTx           13                                  // EEPROM read data mode
#define EWCS1           14                                  // EEPROM write data mode (pt.1 - check status register's WIP flag)
#define EWLE2           15                                  // EEPROM write data mode (pt.2 - enable writing latch)
#define EWCS3           16                                  // EEPROM write data mode (pt.3 - check status register's WEL flag)
#define EWDT4           17                                  // EEPROM write data mode (pt.4 - write data)
#define ERSSx           18                                  // EEPROM read status register mode (standalone)
#define EWSSx           19                                  // EEPROM write status register mode (standalone)
#define EWLSx           20                                  // EEPROM write latch enable mode (standalone)


/******************/
/*** PARAMETERS ***/
/******************/

uint32_t Rate = RB_500K;                                    // UART Tx/Rx baud rate
#define eAddr  0x20                                         // EEPROM address to be read/written
uint8_t eLen = 9;                                           // Number of bytes be read/written from/to EPPROM (NB: max. 16)
uint8_t eVal = 0x10;                                        // Value to written into external EPPROM


/*****************/
/*** VARIABLES ***/
/*****************/

uint8_t TxBuf[BUF_DIM];                                     // TX SPI buffer
uint8_t RxBuf[BUF_DIM];                                     // RX SPI buffer (defined in 16-bit so it can work for both SPI's 8- and 16-bit widths)
uint8_t TxLen = 0;                                          // Overall SPI stream length to be transmitted [B]
uint8_t TxIdx = 0;                                          // Current index over SPI stream transmission
uint8_t RxIdx = 0;                                          // Current index over SPI stream reception
uint8_t MemMode = EIDLE;                                    // EEPROM SPI mode
uint8_t MemWrAddr;                                          // EEPROM writing address (NB: MSb is not used, and the 4 LSb shall be "0" since memory is page-wise written)
uint8_t MemWrLen;                                           // EEPROM writing length [B] (NB: at most 16 bytes at a time)
uint8_t eStReg = 0xAA;                                      // EEPROM status register
bool StBTNR = false;                                        // state of reading button ("1" means pressed, "0" released)
bool StBTNW = false;                                        // state of writing button
bool StLEDR = false;                                        // State of red LED ("1" means on, "0" off)
bool StLEDG = false;                                        // State of green LED
bool StLEDB = false;                                        // State of blue LED


/************/
/*** MAIN ***/
/************/

int main(){

  /* Setup */
  Init_GPIOs();                                             // initialize GPIOs
  Init_SPI();                                               // initialize SPI module
  Init_Timer();                                             // initialize internal timer
  memset(RxBuf,0xCC,BUF_DIM);                               // reset RxBuf content
  Serial.begin(38400);                                      // setup UART line (only for debug purpose)
  uint8_t i;
  uint8_t cnt = 0;
  /* Loop */
  while( 1 ){
    delay_ms(100);
    Toggle_LEDR();    
    if( IsPushed_BTNR() && (!StBTNR) && (MemMode == EIDLE) ){        // trigger reading procedure (READ >> GREEN)
      StBTNR = true;
      Toggle_LEDG();
      delay_ms(200);
      Toggle_LEDG();
      Read_EEPROM(eAddr,eLen);
    } else if( StBTNR && (!IsPushed_BTNR()) ) {
      StBTNR = false;
    }
    if( IsPushed_BTNW() && (!StBTNW) && (MemMode == EIDLE) ){        // trigger writing procedure (WRITE >> BLUE)
      StBTNW = true;
      Toggle_LEDB();
      delay_ms(200);
      Toggle_LEDB();
      Write_EEPROM_pt1(eAddr,eLen);
    } else if( StBTNW && (!IsPushed_BTNW()) ) {
      StBTNW = false;
    }
    if( MemMode == EIDLE ){
      cnt++;
      if( cnt >= 10 ){                                      // just to slow down the printing rate
        cnt = 0;
        for( i=0; i<10; i++ ){                              // number of RxBuf bytes to be printed via UART
          Serial.print(RxBuf[i],HEX);
          Serial.print(" ");
        }
        Serial.print("| ");
        Serial.println(eStReg,HEX);
      }
    }
  }

}


/***********************/
/*** EXTRA FUNCTIONS ***/
/***********************/

/**
 *  Function to initialize GPIOs.
 **/
void Init_GPIOs( void ){
  DDRD &= 0xF7;                                             // set PD3 (BTNR) as input ("0")
  DDRD &= 0xFB;                                             // set PD2 (BTNW) as input ("0")
  DDRB |= 0x01;                                             // set PB0 (LEDG) as output ("1")
  DDRD |= 0x40;                                             // set PD6 (LEDB) as output ("1")
  DDRD |= 0x80;                                             // set PD7 (LEDR) as output ("1")
  Set_LEDG(StLEDG);                                         // initialize LEDG as off
  Set_LEDR(StLEDR);                                         // initialize LEDR as off
}

/**
 *  Function to read the value of reading button.
 **/
bool IsPushed_BTNR( void ){
  if( PIND & 0x08 ){
    return false;
  } else {
    return true;
  }
}

/**
 *  Function to read the value of writing button.
 **/
bool IsPushed_BTNW( void ){
  if( PIND & 0x04 ){
    return false;
  } else {
    return true;
  }
}

/**
 *  Function to turn on/off LEDG.
 **/
void Set_LEDG( bool State ){
  if( State ){
    PORTB |= 0x01;                                          // switch on green LED
  } else {
    PORTB &= 0xFE;                                          // switch off green LED
  }
}

/**
 *  Function to turn on/off LEDR.
 **/
void Set_LEDR( bool State ){
  if( State ){
    PORTD |= 0x80;                                          // switch on red LED
  } else {
    PORTD &= 0x7F;                                          // switch off red LED
  }
}

/**
 *  Function to turn on/off LEDB.
 **/
void Set_LEDB( bool State ){
  if( State ){
    PORTD |= 0x40;                                          // switch on blue LED
  } else {
    PORTD &= 0xBF;                                          // switch off blue LED
  }
}

/**
 *  Function to toggle LEDG.
 **/
void Toggle_LEDG( void ){
  if( StLEDG ){
    StLEDG = false;
  } else {
    StLEDG = true;
  }
  Set_LEDG(StLEDG);
}

/**
 *  Function to toggle LEDR.
 **/
void Toggle_LEDR( void ){
  if( StLEDR ){
    StLEDR = false;
  } else {
    StLEDR = true;
  }
  Set_LEDR(StLEDR);
}

/**
 *  Function to toggle LEDB.
 **/
void Toggle_LEDB( void ){
  if( StLEDB ){
    StLEDB = false;
  } else {
    StLEDB = true;
  }
  Set_LEDB(StLEDB);
}

/**
 *  Function to delay execution for a specified number of milliseconds.
 **/
void delay_ms( uint32_t val_ms ){
  uint32_t j;
  uint32_t Thr = 500*val_ms;                                // "500" is an approximated value (since experimentally Thr = 4M causes a delay of about 8 sec)
  for( j=0; j<Thr; j++ );
}

/**
 *  Function for initializing TC1 timer.
 **/
void Init_Timer( void ){
  /* Set Waveform Generation Mode */
  TCCR1A &= 0xFC;                                           // Set WGM11 and WGM10 bits (TCCR1A[1:0] = '00' for choosing CTC mode)
  TCCR1B &= 0xE7;                                           // Set WGM13 bit (TCCR1B[4] = '0' for choosing CTC mode)
  TCCR1B |= 0x08;                                           // Set WGM12 bit (TCCR1B[3] = '1' for choosing CTC mode)
  /* Set Output Compare register */
  OCR1A = 0x0014;                                           // Set OCR1A[15:0] to 20 (just a small time, to avoid nested SPI interrupts generation)
  TCCR1B &= 0xF8;                                           // Set CS12, CS11 and CS10 bits (TCCR1B[2:0] = '000' for no clock source, i.e. timer stopped)
  /* Reset counter value */
  TCNT1 = 0x0000;                                           // Set TCNT1[15:0] to 0
}

/**
 * Function for starting timer (TC1) counting.
 **/
void Start_Timer( void ){
  TCCR1B |= 0x01;                                           // Set CS12 and CS10 bits for choosing 1 as prescaler and start timer
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
 *	Function for initializing SPI interface.
 **/
void Init_SPI( void ){
  DDRB |= 0x20;                                             // set PB5 (SCK) as output ("1")
  DDRB |= 0x10;                                             // set PB4 (MISO/SDI) as input ("0")
  DDRB |= 0x08;                                             // set PB3 (MOSI/SDO) as output ("1")
  DDRB |= 0x04;                                             // set PB2 (SS/CS) as output ("1")
  PRR &= 0xFB;                                              // set PRSPI to "0" (disable SPI power reduction)
  switch( Rate ){                                           // set SCK rate
    case RB_1M:
      SPSR |= 0x01;                                         // set SPI2X0 = "1" (enable double-speed option)
      SPCR &= 0xFD;                                         // set SPR01 = "0"
      SPCR |= 0x01;                                         // set SPR00 = "1"
      break;
    case RB_500K:
      SPSR &= 0xFE;                                         // set SPI2X0 = "0" (disable double-speed option)
      SPCR &= 0xFD;                                         // set SPR01 = "0"
      SPCR |= 0x01;                                         // set SPR00 = "1"
      break;
    default:                                                // i.e. 125 kb/s
      SPSR &= 0xFE;                                         // set SPI2X0 = "0" (disable double-speed option)
      SPCR |= 0x02;                                         // set SPR01 = "1"
      SPCR &= 0xFE;                                         // set SPR00 = "0"
      break;
  }
  SPCR &= 0xDF;                                             // set DORD0 = "0" (MSB-first transfer mode)
  SPCR |= 0x10;                                             // set MSTR0 = "1" (MCU as Master)
  SPCR &= 0xF7;                                             // set CPOL = "0" (SCK stays low when idle)
  SPCR &= 0xF7;                                             // set CPOL = "0" (SCK stays low when idle)
  SPCR |= 0x40;                                             // set SPE0 = "1" (enable SPI module)
  SPCR |= 0x80;                                             // enable SPI interrupt
  SREG |= 0x80;                                             // enable global interrupt
  PullUp_SS();                                              // set CS line high by default
}

/* Function to pull up SPI SS/CS line */
void PullUp_SS( void ){
  PORTB |= 0x04;
}

/* Function to pull down SPI SS/CS line */
void PullDown_SS( void ){
  PORTB &= 0xFB;
}

/* Function for transmitting data over SPI */
void Send_SPI_TX( uint8_t Byte ){
  SPDR = Byte;
}

/* Function to read data from external EEPROM */
void Read_EEPROM( uint8_t Addr, uint8_t Len ){
    MemMode = ERDTx;                                        // set ID for state machine related to EEPROM
    TxLen = Len+2;                                          // set the length of the stream to be transmitted (adding 2 bytes for READ instruction and memory starting address)
    TxBuf[0] = 0x03;                                        // set READ instruction
    TxBuf[1] = Addr;                                        // set address to be read (NB: max value is 0x7F)
    memset(&TxBuf[2],0,Len);                                // set the rest of the Tx buffer to "0" by default
    PullDown_SS();                                          // a delay of 100 ns shall be be guaranteed between the falling edge of CS/SS and the first SCK edge
    Send_SPI_TX(TxBuf[0]);                                  // start SPI transmission
}

/* Function to write data into external EEPROM (pt.1 - check WIP) */
void Write_EEPROM_pt1( uint8_t Addr, uint8_t Len ){
    MemMode = EWCS1;                                        // state to check WIP flag
    MemWrAddr = Addr;                                       // store EEPROM starting address where to write
    MemWrLen = Len;                                         // store stream byte length to be written into EEPROM
    Check_EEPROM();                                         // read EEPROM status register
}

/* Function to write data into external EEPROM (pt.2 - write enable) */
void Write_EEPROM_pt2( void ){
    MemMode = EWLE2;                                        // state to enable writing latch
    WrLatchEn_EEPROM();
}

/* Function to write data into external EEPROM (pt.3 - check WEL) */
void Write_EEPROM_pt3( void ){
    MemMode = EWCS3;                                        // state to check WEL flag
    Check_EEPROM();                                         // read EEPROM status register
}

/* Function to write data into external EEPROM (pt.4 - write data) */
void Write_EEPROM_pt4( void ){
    uint8_t j;
    MemMode = EWDT4;                                        // state to transmit actual data
    TxLen = MemWrLen+2;                                     // set the length of the stream to be transmitted (adding 2 bytes for READ instruction and memory starting address)
    TxBuf[0] = 0x02;                                        // set WRITE instruction
    TxBuf[1] = MemWrAddr;
    for( j=2; j<TxLen; j++ ){
      TxBuf[j] = eVal++;                                    // write dummy data to be written (incremental)
    }
    PullDown_SS();
    Send_SPI_TX(TxBuf[0]);
}

/* Function to read external EEPROM's status register */
void Check_EEPROM( void ){
    TxLen = 2;                                              // set length of the stream to be transmitted
    TxBuf[0] = 0x05;                                        // set RDSR instruction
    TxBuf[1] = 0x00;                                        // set dummy byte value to "0"
    PullDown_SS();                                          // a delay of 100 ns shall be be guaranteed between the falling edge of CS/SS and the first SCK edge
    Send_SPI_TX(TxBuf[0]);                                  // start SPI transmission
}

/* Function to set EEPROM write enable latch */
void WrLatchEn_EEPROM( void ){
    TxLen = 1;                                              // single byte communication towards EEPROM
    TxBuf[0] = 0x06;                                        // set WREN instruction
    PullDown_SS();
    Send_SPI_TX(TxBuf[0]);
}

/* Function to protect/release EEPROM addresses */
void Protect_EEPROM( bool PrFlag ){
    MemMode = EWSSx;                                        // state to update the protection mode
    TxLen = 2;                                              // set length of the stream to be transmitted
    TxBuf[0] = 0x01;                                        // set WRSR instruction
    if( PrFlag ){                                           // set protection
        TxBuf[1] = 0xFF;                                    // set protection over all addresses
    } else {
        TxBuf[1] = 0x00;                                    // release protection over all addresses
    }
    PullDown_SS();                                          // a delay of 100 ns shall be be guaranteed between the falling edge of CS/SS and the first SCK edge
    Send_SPI_TX(TxBuf[0]);                                  // start SPI transmission
}


/**********************************/
/*** INTERRUPT SERVICE RUOTINES ***/
/**********************************/

/**
 * Interrupt Service Routine related to single SPI transfer completion.
 **/
ISR( SPI_STC_vect ){
  if( (MemMode == ERDTx) && (TxIdx > 1) ){                  // if in READ mode (and skipping the first 2 dummy bytes received)
        RxBuf[RxIdx] = SPDR;                                // read the received value on SDI
        RxIdx++;
  }
  TxIdx++;
  if( TxIdx < TxLen ){                                      // if Tx not completed yet, send remaining data of the stream
      Send_SPI_TX(TxBuf[TxIdx]);
  } else {                                                  // if Tx completed, reset the indeces, pull up SS and exit
      RxIdx = 0;
      TxIdx = 0;
      PullUp_SS();
      if( (MemMode == EWCS1) || (MemMode == EWLE2) || (MemMode == EWCS3) ){
        Start_Timer();
      } else {
        MemMode = EIDLE;
      }
  }
  // NB: SPI interrupt flag (SPIF) is cleared automatically by hardware once this ISR is executed (just like any other interrupt).
}

/**
 * Interrupt Service Routine triggered upon timer (TC1) expiration.
 **/
ISR( TIMER1_COMPA_vect ){
  Stop_Timer();
  switch( MemMode ){                                        // statee machine while writing into EEPROM
    case EWCS1:                                             // EEPROM writing (pt.1-2)
      eStReg = SPDR;                                        // read the received value on SDI
      if( (eStReg&0x01) == 0 ){                             // check that WIP = 0 before going on
        Write_EEPROM_pt2();
      } else {
        PullUp_SS();
        MemMode = EIDLE;
      }
      break;
    case EWLE2:                                             // EEPROM writing (pt.2-3)
      Write_EEPROM_pt3();
      break;
    case EWCS3:                                             // EEPROM writing (pt.3-4)      
      eStReg = SPDR;                                        // read the received value on SDI
      if( eStReg&0x02 ){                                    // check that WEL = 1 before going on
        Write_EEPROM_pt4();
      } else {
        PullUp_SS();
        MemMode = EIDLE;
      }
      break;
    default:
      // do nothing
      break;
  }
}



/*** NOTES ***/

// [0] As hardware setup, use 1k-Ohm resistors for the LEDs and a 10k-Ohm resistor for the BTNs pull-up networks.
//     Moreover, keep EEPROM's HOLD and WP pins shorted to +5V.
