
#include "pitches.h"

#define PULSE_PIN 8
#define DURATION 1000   // tone duration in ms

int melody_length = 10;
int melody_notes[] = {NOTE_C4, NOTE_C5, NOTE_C5, NOTE_DS5, NOTE_C5,
  NOTE_GS4, NOTE_C5, NOTE_G4, NOTE_AS4, NOTE_C5};
  
int melody_delays[] = {400, 200, 200, 400, 400,
 400, 400, 400, 400, 400};

void setup() {
}
 
void loop() {  
  for (int i=0; i < melody_length; i++) {
    tone(PULSE_PIN, melody_notes[i], DURATION);
    delay(melody_delays[i]);
  }
}
