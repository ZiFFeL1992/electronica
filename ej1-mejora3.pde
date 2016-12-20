/* Ej1-mejora3 */
int pinRed = 4;
int pinGreen = 3;
int pinYellow = 2;
int pinPlus = 12;
int puls = 0;
bool reset = false;

void setup(){
    pinMode(pinRed, OUTPUT);
    pinMode(pinGreen, OUTPUT);
    pinMode(pinYellow, OUTPUT);
    pinMode(pinPlus, INPUT);
}

void loop(){
    int t = 0;
    if (!reset) {
        t = millis() % 5000;
    } else {
        if (t > 2000) {
            reset = false;
        }
    }
    if (digitalRead(12) == LOW) {
        red();
        return;
    } else if (t < 2000){
        red();
    } else if (t < 4000) {
        green();
    } else if (t < 5000){
        t = t % 1000;
        if (t < 200) {
            yellow(true);
        } else if (t < 400) {
            yellow(false);
        } else if (t < 600) {
            yellow(true);
        } else if (t < 800) {
            yellow(false);
        } else if (t < 1000) {
            yellow(true);
        }
    }
}

void red(){
    digitalWrite(pinRed, HIGH);
    digitalWrite(pinGreen, LOW);
    digitalWrite(pinYellow, LOW);
}

void green(){
    digitalWrite(pinRed, LOW);
    digitalWrite(pinGreen, HIGH);
    digitalWrite(pinYellow, LOW);
}

void yellow(bool act){
    digitalWrite(pinRed, LOW);
    digitalWrite(pinGreen, LOW);
    if (act) {
        digitalWrite(pinYellow, HIGH);
    } else {
        digitalWrite(pinYellow, LOW);
    }
}