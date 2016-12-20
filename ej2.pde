#include <TM1637Display.h>

#define CLK 7
#define DIO 4

TM1637Display tm1637(CLK, DIO);

int8_t datos[] = {10,10,10,0,9,1,6,3,7,4,2,1,10,10,10,10};
byte numeros[] = {
    0b00111111,
    0b00000110,
    0b01011011,
    0b01001111,
    0b01100110,
    0b01101101,
    0b01111101,
    0b00000111,
    0b01111111,
    0b01101111,
    0b00000000
};
int pos = 0;
byte subset[] = {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000
};

void setup(){
    tm1637.setBrightness(0x0F);
}

void loop(){
    pos = pos % 13;
    subset[0] = numeros[datos[pos]];
    subset[1] = numeros[datos[pos+1]];
    subset[2] = numeros[datos[pos+2]];
    subset[3] = numeros[datos[pos+3]];
    pos++;
    tm1637.setSegments(subset);
    delay(1000);
}