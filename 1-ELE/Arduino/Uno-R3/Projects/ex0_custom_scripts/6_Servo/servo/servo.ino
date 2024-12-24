
#include <Servo.h>

#define SERVO_PIN 9
#define SERVO_DELAY 30  // delay for servo rotation in ms (must be at least 15 ms)
#define MIN_ANGLE 30  // servo starting angle
#define MAX_ANGLE 150  // servo final angle

bool clockwise = true;
uint16_t pos = MIN_ANGLE;    // variable to store servo position
Servo myservo;  // create a servo object

void setup() {
  myservo.attach(SERVO_PIN);  // associate input control signal on SERVO_PIN
}

void loop() {
   
   myservo.write(pos);  // move servo to target position
   delay(SERVO_DELAY);
   
   if (clockwise){  // move servo clockwise from MIN_ANGLE to MAX_ANGLE degrees
      pos++;
      if (pos == MAX_ANGLE){
         clockwise = false;
      }
   } else {  // move servo counterclockwise from MAX_ANGLE to MIN_ANGLE degrees
      pos--;
      if (pos == MIN_ANGLE){
         clockwise = true;
      }
   }
}

