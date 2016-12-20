/* Ej1-mejora1 */
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
    for(int i=0; i<6; i++){
        if(i%2) {
            digitalWrite(pinYellow, HIGH);
        } else {
            digitalWrite(pinYellow, LOW);
        }
        delay(200);
    }
}
