int led = 7;
int pot  = A0;
int dato = 0;

void setup(){
    pinMode(led, OUTPUT);
    Serial.begin(9600);
}

void loop(){
    dato = analogRead(pot);
    Serial.println(dato);

    digitalWrite(led, HIGH);
    delay(dato);
    digitalWrite(led, LOW);
    delay(dato);
}