int LED = 5;
int led2=3;
int buton=2;
int i=0;
void setup()
{
  Serial.begin(9600);
  
 pinMode(LED, OUTPUT);
  pinMode(led2,OUTPUT);
  pinMode(buton,OUTPUT);
  
  cli();
  /* Ayarlamaların yapılabilmesi için öncelikle kesmeler durduruldu */

  /* Timer1 kesmesi saniyede bir çalışacak şekilde ayarlanacaktır (1 Hz)*/
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1  = 0;
  OCR1A = 15624;
  /* Bir saniye aralıklar için zaman sayıcısı ayarlandı */
  TCCR1B |= (1 << WGM12);
  /* Adımlar arasında geçen süre kristal hızının 1024'e bölümü olarak ayarlandı */
  TCCR1B |= (1 << CS12) | (1 << CS10);
  TIMSK1 |= (1 << OCIE1A);
  /* Timer1 kesmesi aktif hale getirildi */

  sei();
  /* Timer1 kesmesinin çalışabilmesi için tüm kesmeler aktif hale getirildi */

}

/* Arduino otomatik olarak her saniye aşağıdaki fonksiyonu çalıştıracaktır */
ISR(TIMER1_COMPA_vect){
i++;
Serial.println(i);
}

/*void ledikapat()
{
digitalWrite(led2,LOW);
delay(10000);
Serial.println("diriyor");
}*/

void loop()
{
 if(i>=5){
 digitalWrite(led2,HIGH);
 delay(1000);
 digitalWrite(led2,LOW);
 delay(1000);
 
 if(digitalRead(buton)==LOW)
 i=0;
}
}
