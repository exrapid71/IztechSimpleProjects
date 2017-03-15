int buton=12;
int led=8;
boolean deger=LOW;
boolean sondeger=LOW;
void setup() {
  // put your setup code here, to run once:
pinMode(buton,INPUT);
pinMode(led,OUTPUT);
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
 deger=digitalRead(buton);
 if(deger==HIGH && sondeger==LOW){
 Serial.println("HIGH");
 digitalWrite(led,HIGH);}
 else if(deger==LOW && sondeger==HIGH){
 Serial.println("LOW");
 digitalWrite(led,LOW);}
 sondeger=deger;
delay(500);
}
