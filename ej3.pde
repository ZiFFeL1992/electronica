#include <TM1637Display.h>

#define CLK 7
#define DIO 4

TM1637Display tm1637(CLK, DIO);

int datos[12][2] = {
    {0,0},
    {1,0},
    {2,0},
    {3,0},
    {3,1},
    {3,2},
    {3,3},
    {2,3},
    {1,3},
    {0,3},
    {0,4},
    {0,5}
};
byte pin[] = {
    0b00000001,
    0b00000010,
    0b00000100,
    0b00001000,
    0b00010000,
    0b00100000,
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
    pos = pos % 12;
    subset[0] = 0b00000000;
    subset[1] = 0b00000000;
    subset[2] = 0b00000000;
    subset[3] = 0b00000000;

    subset[datos[pos][0]] = pin[datos[pos][1]];
    pos++;
    tm1637.setSegments(subset);
    delay(100);
}