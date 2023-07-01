//www.elegoo.com
//2016.12.8

// define pins and vars
#define BLUE_PWM_PIN 3
#define GREEN_PWM_PIN 5
#define RED_PWM_PIN 6
#define delayTime 50 // fading time between colors
uint16_t redValue = 0;
uint16_t greenValue = 0;
uint16_t blueValue = 0;


void setup(){
  pinMode(RED_PWM_PIN, OUTPUT);
  pinMode(GREEN_PWM_PIN, OUTPUT);
  pinMode(BLUE_PWM_PIN, OUTPUT);
}


void loop(){
  redValue = 0;
  greenValue = 0;
  blueValue = 0;
  
  for(int i=0; i<500; i++){
    redValue+=2;
    greenValue++;
    blueValue+=3;
    analogWrite(RED_PWM_PIN, redValue);
    analogWrite(GREEN_PWM_PIN, greenValue);
    analogWrite(BLUE_PWM_PIN, blueValue);
    delay(delayTime);
  }
}

