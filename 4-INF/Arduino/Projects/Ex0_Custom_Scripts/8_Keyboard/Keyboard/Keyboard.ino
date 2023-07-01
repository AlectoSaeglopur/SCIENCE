
#include <Keypad.h>

#define NROWS 4
#define NCOLS 4

/* define row and colomn pins */
byte RowPins[NROWS] = {9, 8, 7, 6};
byte ColPins[NCOLS] = {5, 4, 3, 2};

char HexKeys[NROWS][NCOLS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};

/* initialize an instance of class Keypad */
Keypad MyKeypad = Keypad( makeKeymap(HexKeys), RowPins, ColPins, NROWS, NCOLS);

#define PIN_LENGTH 4
const char PIN[] = {'1', '8', '2', '5'};
#define PRINT_LENGTH 6
const char locked_state[] = {'L', 'O', 'C', 'K', 'E', 'D'};
const char unlocked_state[] = {'U', 'N', 'L', 'O', 'C', 'K'};
const char failed_state[] = {'F','A', 'I', 'L', 'E', 'D'};

bool Lock = true;
char KeyBuffer [PIN_LENGTH];
char LatestKey;

#define LED_PIN 12


void setup(){
  pinMode(LED_PIN,OUTPUT);
  Serial.begin(9600);
}

void loop(){
   LatestKey = MyKeypad.getKey();
   if (Lock){
      if (LatestKey == '*'){
         if (check_pin()){
            Lock = false;
            print_state('U');
            digitalWrite(LED_PIN,HIGH);
         } else {  // i.e. pin check failed
            print_state('F');
         }
         reset_buffer();
      } else if (LatestKey){   // i.e. another key (different form '*') has been pressed
         Serial.print(LatestKey);
         update_buffer(LatestKey);
      }
   } else if (LatestKey == '*'){   // i.e. && Lock == false
         Lock = true;
         print_state('L');
         reset_buffer();
         digitalWrite(LED_PIN,LOW);
   }
}


void update_buffer (char latest_key){
   uint8_t j;
   for (j=0; j<PIN_LENGTH-1; j++){
      KeyBuffer[j] = KeyBuffer[j+1];
   }
   KeyBuffer[PIN_LENGTH-1] = latest_key;
}

bool check_pin (void){
   uint8_t checksum = 0;
   int j;
   for (j=0; j<PIN_LENGTH; j++){
      if (KeyBuffer[j] == PIN[j]){
         checksum++;
      }
   }
   if (checksum == PIN_LENGTH)
      return true;
   else
      return false;
}

void reset_buffer (void){
   int j;
   for (j=0; j<PIN_LENGTH; j++){
      KeyBuffer[j] = '0';
   }
}

void print_state (char X){
  
   const char *string_to_print = nullptr;
   if (X == 'L')
      string_to_print = locked_state;
   else if (X == 'U')
      string_to_print = unlocked_state;
   else if (X == 'F')
      string_to_print = failed_state;
      
   Serial.println();
   for (int j=0; j<PRINT_LENGTH; j++){
       Serial.print(string_to_print[j]);
    }
     Serial.println();
}

