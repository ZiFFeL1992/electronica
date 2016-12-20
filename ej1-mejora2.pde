/* Ej1-mejora2 */
int pinRed = 4;
int pinGreen = 3;
int pinYellow = 2;
int pinPlus = 12;
int puls = 0;

void setup(){
    pinMode(pinRed, OUTPUT);
    pinMode(pinGreen, OUTPUT);
    pinMode(pinYellow, OUTPUT);
    pinMode(pinPlus, INPUT);
}

void loop(){
    red();
    if(checkPuls()) return;
    green();
    if(checkPuls()) return;
    yellow();
    if(checkPuls()) return;
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

bool checkPuls(){
    puls = digitalRead(12);
    if(puls == LOW){
        red();
        return true;
    }

    return false;
}
