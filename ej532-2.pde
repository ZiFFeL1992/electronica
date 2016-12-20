#define TRIGGER_PIN 12
#define ECHO_PIN 11

float distMax = 200;
long tm, distancia, distancia2, contador;
float aux;

void setup(){
    Serial.begin(9600);
    pinMode(TRIGGER_PIN, OUTPUT);
    pinMode(ECHO_PIN, INPUT);
}

void loop(){
    digitalWrite(TRIGGER_PIN, LOW);
    delayMicroseconds(2);
    digitalWrite(TRIGGER_PIN, HIGH);
    delayMicroseconds(10);
    digitalWrite(TRIGGER_PIN, LOW);

    tm = pulseIn(ECHO_PIN, HIGH);

    distancia = tm*171.5/10000;
    Serial.print("Distancia: ");
    if(distancia > distMax){
        Serial.println("Fuera de rango");
    } else {
        Serial.println(distancia);
    }

    delay(50);
}