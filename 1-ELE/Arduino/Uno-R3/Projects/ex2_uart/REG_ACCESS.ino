
/**
 * EXAMPLE OF MCU REGISTER ACCESS (AUTOMATIC AND MANUAL) 
 **/


#define UART_RX_PIN     0
#define UART_TX_PIN     1

uint16_t Time = 0;
volatile uint8_t *pRegAddr = 0xC1;            // i.e. address of UCSR0B register
uint8_t RegVal;

void setup(){ 
  Serial.begin(9600);
}

void loop(){
  
  Serial.println(Time);

  Serial.println(UCSR0B,HEX);
  UCSR0B = 0x3F;                              // Write register (auto)
  Serial.println(UCSR0B,HEX);

  RegVal = *pRegAddr;                         // Read register (manual)
  Serial.println(RegVal,HEX);
  *pRegAddr = 0xAA;                           // Write register (manual)
  RegVal = *pRegAddr;                         // Read register (manual)
  Serial.println(RegVal,HEX);
  Serial.println("---\n");
  Time++;
  delay(1000);

}

