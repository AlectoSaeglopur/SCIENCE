

#define SW_PIN   2 // Digital pin ID connected to switch output
#define X_PIN    0 // Analog pin ID connected to X output
#define Y_PIN    1 // Analog pin ID connected to Y output

#define SERIAL_SPEED  9600 // [b/s] Serial communication speed

void setup() {
  pinMode(SW_PIN, INPUT);
  digitalWrite(SW_PIN, HIGH);
  Serial.begin(9600);
}

void loop() {

  Serial.println(digitalRead(SW_PIN));
  Serial.println(analogRead(X_PIN));
  Serial.println(analogRead(Y_PIN));
  delay(150);
}
