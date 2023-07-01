 
 /* I/O pin definition */
 #define VDD_PIN      3   // PIN for LED supply
 #define SWITCH_PIN   5   // PIN for evaluating button pressure

 /* Debouncer variables */
 bool LED_on = false;     // save of latest LED state (ON or OFF)
 int Prev_Button_State = HIGH;     // save of latest button state (LOW --> pushed)


 void setup(){
    pinMode(VDD_PIN, OUTPUT);
    pinMode(SWITCH_PIN, INPUT_PULLUP);
 }


 void loop(){
      if (Prev_Button_State == HIGH && digitalRead(SWITCH_PIN)==LOW){
         Prev_Button_State = LOW;
         if (LED_on==false){
            LED_on = true;
            digitalWrite(VDD_PIN, HIGH);
         } else {
            LED_on = false;
            digitalWrite(VDD_PIN, LOW);
         }
      } else if (Prev_Button_State == LOW && digitalRead(SWITCH_PIN)==HIGH){
         Prev_Button_State = HIGH;
      }
 }
 
