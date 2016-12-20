/* Ej1-basico */
int pinRed = 4;
int pinGreen = 3;
int pinYellow = 2;

void setup(){
    pinMode(pinRed, OUTPUT);
    pinMode(pinGreen, OUTPUT);
    pinMode(pinYellow, OUTPUT);
}

void loop(){
    red();
    green();
    yellow();
}

void red(){
    digitalWrite(pinRed, HIGH);
    digitalWrite(pinGreen, LOW);
    digitalWrite(pinYellow, LOW);
    delay(2000);
}

void green(){
    digitalWrite(pinRed, LOW);
    digitalWrite(pinGreen, HIGH);
    digitalWrite(pinYellow, LOW);
    delay(2000);
}

void yellow(){
    digitalWrite(pinRed, LOW);
    digitalWrite(pinGreen, LOW);
    digitalWrite(pinYellow, HIGH);
    delay(1000);
}
