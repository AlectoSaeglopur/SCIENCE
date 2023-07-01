
#define VDD_PIN 12
#define FREQ 1      // buzzer on-off frequency in Hz (i.e. inverse of buzzer period)
#define DUTY .2     // buzzer duty cycle (MUST be set from 0 to 1)

void setup(){
   pinMode(VDD_PIN,OUTPUT);
}

void loop(){
    digitalWrite(VDD_PIN,HIGH);
    delay(DUTY*1000/FREQ);
    digitalWrite(VDD_PIN,LOW);
    delay((1-DUTY)*1000/FREQ);
}

/* NB: with an active buzzer it's impossible to vary the pitch of the tone,
   since that's fixed by the frequency of its internal oscillator.
   If there's need to vary this pitch, a passive buzzer must be used! */
