
#include "SR04.h"

#define TRIG_PIN 12
#define ECHO_PIN 11

#define MEAN_AVER 30  // number of cycles to be evaluated to estimate average distance

SR04 Ultrasonic_Object = SR04(ECHO_PIN,TRIG_PIN);
long latest_dist;
long average_dist;

void setup() {
   Serial.begin(9600);
   delay(1000);
}

void loop() {

   latest_dist = Ultrasonic_Object.Distance();
   Serial.print("LATEST DISTANCE = ");
   Serial.print(latest_dist);
   Serial.println("cm");
   delay(1000);

/*
   average_dist = Ultrasonic_Object.DistanceAvg(MEAN_AVER);
   Serial.print("AVERAGE DISTANCE = ");
   Serial.print(average_dist);
   Serial.println(" cm");
*/

}
