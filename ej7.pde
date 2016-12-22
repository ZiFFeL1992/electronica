#include <AccelStepper.h>
#define HALFSTEP 8
#define IN1 11
#define IN2 10
#define IN3 9
#define IN4 8

int pinPot1 = A2;
int pinPot2 = A3;

int pot1 = 0;
int pot2 = 0;
int speed = 0;
int position = 0;

AccelStepper stepper1(HALFSTEP, IN1, IN3, IN2, IN4);

void setup(){
    pinMode(pinPot1, INPUT);
    pinMode(pinPot2, INPUT);

    stepper1.setMaxSpeed(1000.0);
    stepper1.setAcceleration(500.0);
}

void loop(){
    pot1 = analogRead(pinPot1);
    pot2 = analogRead(pinPot2);

    speed = pot2*5;
    if (speed>990) {
        speed = 990;
    }

    position = pot1*8;
    if (position>1600) {
        position = 1600;
    }

    stepper1.moveTo(position);
    stepper1.setSpeed(speed);

    stepper1.runSpeedToPosition();
}

