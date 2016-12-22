int pinDetector = A0;
int valor;
int pinRed = 2;

void setup(){
    Serial.begin(9600);
    pinMode(pinRed, OUTPUT);
}

void loop(){
    valor = analogRead(pinDetector);
    Serial.println(valor);

    if(valor<500){
        digitalWrite(pinRed, HIGH);
    } else {
        digitalWrite(pinRed, LOW);
    }
    delay(500);
}