#include <dht11.h>
#include <TM1637.h>
#define DHT11PIN 2
#define CLK 7
#define DIO 4

dht11 DHT11;

TM1637 tm1637(CLK, DIO);

int8_t datos[] = {0,0,0,0};

void setup(){
    DHT11.attach(DHT11PIN);
    Serial.begin(9600);
    tm1637.set();
    tm1637.init();
}

void loop(){
    int chk = DHT11.read(DHT11PIN);
    Serial.print("\nEstado del sensor: ");
    switch(chk){
        case 0:
        Serial.println("OK");
        break;
        case -1:
        Serial.println("Checksum error");
        break;
        case -2:
        Serial.println("Timeout error");
        break;
        default:
        Serial.println("Unknown error");
        break;
    }



    datos[0] = DHT11.humidity / 10;
    datos[1] = DHT11.humidity % 10;
    datos[2] = DHT11.temperature / 10;
    datos[3] = DHT11.temperature % 10;
    tm1637.display(datos);

    Serial.print("Humedad (%): ");
    Serial.println(DHT11.humidity);
    Serial.print("Temperatura (ºC): ");
    Serial.println(DHT11.temperature);
    delay(2000);
}