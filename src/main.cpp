#include <Arduino.h>

void setup() {
  pinMode(25, OUTPUT);  // LED integrado
}

void loop() {
  digitalWrite(25, HIGH);
  delay(500);
  digitalWrite(25, LOW);
  delay(500);
}
