#define TRIGGER_PIN 12
#define ECHO_PIN 11

int pinFive = 5;
int pinFour = 4;
int pinThree = 3;
int pinTwo = 2;

float distMax = 200;
long tm, distancia, distancia2, contador;
float aux;

void setup(){
    Serial.begin(9600);
    pinMode(TRIGGER_PIN, OUTPUT);
    pinMode(ECHO_PIN, INPUT);

    pinMode(pinFive, OUTPUT);
    pinMode(pinFour, OUTPUT);
    pinMode(pinThree, OUTPUT);
    pinMode(pinTwo, OUTPUT);
}

void loop(){
    digitalWrite(TRIGGER_PIN, LOW);
    delayMicroseconds(2);
    digitalWrite(TRIGGER_PIN, HIGH);
    delayMicroseconds(10);
    digitalWrite(TRIGGER_PIN, LOW);
    tm = pulseIn(ECHO_PIN, HIGH);

    distancia = tm*171.5/10000;
    digitalWrite(pinFive, LOW);
    digitalWrite(pinFour, LOW);
    digitalWrite(pinThree, LOW);
    digitalWrite(pinTwo, LOW);

    if(distancia>40){
        Serial.print("distancia>40: ");
        Serial.println(distancia);
        digitalWrite(pinTwo, HIGH);
    } else if (30<distancia && distancia<40){
        Serial.print("30<distancia<40: ");
        Serial.println(distancia);
        digitalWrite(pinThree, HIGH);
    } else if (20<distancia && distancia<30){
        Serial.print("20<distancia<30: ");
        Serial.println(distancia);
        digitalWrite(pinFour, HIGH);
    } else if (distancia<20){
        Serial.print("distancia<20: ");
        Serial.println(distancia);
        digitalWrite(pinFive, HIGH);
    }

    delay(50);
}