int val;
int tempPin = 1;
int yesil=7;
int kirmizi =6;

#include <LiquidCrystal.h>
LiquidCrystal lcd(12,11,5,4,3,2);
void setup()
{
  Serial.begin(9600);
pinMode(yesil,OUTPUT);
pinMode(kirmizi,OUTPUT);
  lcd.begin(16, 2);
  
  lcd.clear();
  

}
void loop()
{
val = analogRead(tempPin);
float mv = ( val/1024.0)*5000; 
float cel = mv/10;
float farh = (cel*9)/5 + 32;
lcd.print("Temprature:");
lcd.print(cel);
Serial.print("TEMPRATURE = ");
Serial.print(cel);
Serial.print("*C");
Serial.println();

if(cel>33)
{
digitalWrite(yesil,HIGH);
digitalWrite(kirmizi,LOW);
}
else
{

digitalWrite(kirmizi,HIGH);
digitalWrite(yesil,LOW);

}
delay(1000);
lcd.clear();



/* uncomment this to get temperature in farenhite 
Serial.print("TEMPRATURE = ");
Serial.print(farh);
Serial.print("*F");
Serial.println();


*/
}
