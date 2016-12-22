#include <AccelStepper.h>
#define HALFSTEP 8
#define IN1 11
#define IN2 10
#define IN3 9
#define IN4 8

int pinBoton1 = 2;
int pinBoton2 = 3;

int boton1 = 0;
int boton2 = 0;

AccelStepper stepper1(HALFSTEP, IN1, IN3, IN2, IN4);

void setup(){
    pinMode(pinBoton1, INPUT);
    pinMode(pinBoton2, INPUT);

    stepper1.setMaxSpeed(1000.0);
    stepper1.setAcceleration(100.0);
    stepper1.setSpeed(200);
}

void loop(){
    boton1 = digitalRead(pinBoton1);
    boton2 = digitalRead(pinBoton2);

    if((boton1 == 1) && (boton2 == 0)){
        stepper1.moveTo(400);
    } else if ((boton1 == 0) && (boton2 == 1)){
        stepper1.moveTo(800);
    } else if ((boton1 == 1) && (boton2 == 1)){
        stepper1.moveTo(1600);
    } else if((boton1 == 0) && (boton2 == 0)){
        stepper1.moveTo(0);
    }
    stepper1.run();
}

