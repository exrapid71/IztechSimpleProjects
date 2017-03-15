/* Slave (köle) görevindeki Arduino'nun kodu */
#include <Wire.h>
/* 
 * I2C fonksiyonlarını kullanabilmek için 
 * Wire.h kütüphanesini projemize ekledik
 */
 
 const int LED = 13;
 /* LED 13. pinde bulunmaktadır */
 
void setup()
{
  Serial.begin(9600);
  Wire.begin(1);
  /* I2C haberleşmesi, haberleşme adresi 1 olan bir slave cihaz olarak başlatıldı */
  Wire.onRequest(istekGeldiginde);
  /* 
  Master olan cihaz bu Arduino'dan veri istediğinde gerçekleşecek işlem seçildi
  */
  Wire.onReceive(veriGeldiginde);
  /*
  Master olan cihazdan bu Arduino'ya veri geldiğinde yapılacak işlem seçildi
  */
  
  pinMode(LED,OUTPUT);
  /* LED pini çıkış olarak ayarlandı */
}
 
void loop()
{
  /*
  * Tüm işlemler veri isteği geldiğinde veya yeni veri geldiğinde 
  * yapılacağı için loop fonksiyonunun içi boş bırakılmıştır
  */
  delay(1);
}
 
void veriGeldiginde(int veri)
{
  /* I2C hattında bu cihaz için yeni veri olduğunda bu fonksiyon çalışır */
  char gelenKarakter;
  /* Hattaki veri okunarak gelenKarakter değişkenine kaydedilir */
  while(Wire.available()){
    gelenKarakter = Wire.read();
  }
  /* Eğer gelen veri 'a' ise LED yakılır, 'b' ise LED söndürülür */
  if(gelenKarakter == 'a'){
    digitalWrite(LED,HIGH);
  Serial.println("Led yandi");  
  }
    
  else if(gelenKarakter == 'b')
   {
    digitalWrite(LED,LOW);
  Serial.println("Led sondu");  
  }
}
 
void istekGeldiginde()
{ 
  Serial.println("Istek geldi");  

  /* 
  * Eğer master bu cihazdan veri istiyor ise master cihaza "Merhaba" verisi yollanılır 
  * Eğer bu bir sensör olsaydı "merhaba" yerine sıcaklık veya ivme verisi yollanıyor olacaktı
  */
  Wire.write("20"); 
}
