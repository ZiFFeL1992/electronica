int pinPlus = 12;
int pinLed = 2;
int puls = 0;

void setup(){
  pinMode(pinLed, OUTPUT);
  pinMode(pinPlus, INPUT);
}

void loop(){
  puls = digitalRead(12);
  if (puls == HIGH){
    digitalWrite(pinLed, LOW);
  } else {
    digitalWrite(pinLed, HIGH);
  }
}