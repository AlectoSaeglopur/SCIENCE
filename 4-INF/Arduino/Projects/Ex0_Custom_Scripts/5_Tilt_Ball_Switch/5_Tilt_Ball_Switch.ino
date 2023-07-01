
#define LED_PIN 12
#define SENSOR_PIN 2

void setup()
{ 
  pinMode(LED_PIN,OUTPUT);
  pinMode(SENSOR_PIN,INPUT_PULLUP);
  digitalWrite(SENSOR_PIN,HIGH);
} 

void loop(){  
  int digitalVal = digitalRead(SENSOR_PIN);
  if (digitalVal == HIGH){ // HIGH if sensor angle is from 180° to 360°
     digitalWrite(LED_PIN,LOW);
  } else { // LOW if sensor angle is from 0° to 180°
     digitalWrite(LED_PIN,HIGH); 
  }
}

