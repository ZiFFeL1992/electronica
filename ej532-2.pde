#include <TM1637.h>
#define TRIGGER_PIN 12
#define ECHO_PIN 11
#define CLK 7
#define DIO 4

TM1637 tm1637(CLK, DIO);

int8_t datos[] = {0,0,0,0};

float distMax = 200;
long tm, distancia, distancia2, contador;
float aux;

void setup(){
    Serial.begin(9600);
    pinMode(TRIGGER_PIN, OUTPUT);
    pinMode(ECHO_PIN, INPUT);
    tm1637.set();
    tm1637.init();
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
    Serial.println(distancia);


    datos[0] = 0;
    datos[1] = 0;
    datos[2] = distancia / 10;
    datos[3] = distancia % 10;
    tm1637.display(datos);

    delay(50);
}