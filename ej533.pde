int pinDetector = A0;
int valor;

void setup(){
    Serial.begin(9600);
}

void loop(){
    valor = analogRead(pinDetector);
    Serial.println(valor);
    delay(500);
}