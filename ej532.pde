#include <NewPing.h>

#define TRIGGER_PIN 12
#define ECHO_PIN 11

NewPing sonar(TRIGGER_PIN, ECHO_PIN);

void setup(){
    Serial.begin(9600);
}

void loop(){
    unsigned int tm = sonar.ping();

    Serial.print("Distancia: ");
    Serial.print(tm / US_ROUNDTRIP_CM);
    Serial.println("cm");

    delay(50);
}