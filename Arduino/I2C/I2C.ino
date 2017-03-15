#include <Wire.h>
/* 
 * I2C fonksiyonlarını kullanabilmek için 
 * Wire.h kütüphanesini projemize ekledik
 */
 
void setup()
{
  Wire.begin();
  /* I2C haberleşmesi master olarak başlatıldı */
  
  Serial.begin(9600);
  /* Bilgisayara veri yazdırabilmek için seri haberleşme başlatıldı */
}

void loop()
{
  Wire.beginTransmission(1);
  /* 1 adresine sahip Slave (köle) cihazına veri yollanacağı bildiriliyor */
  Wire.write("a");
  /* a karakteri slave cihaza yollanıyor */
  Wire.endTransmission();
  /* Yollanacak verilerin bittiği bildiriliyor */
  /* a karakteri slave cihazda LED'i yak anlamına gelecektir */
  
  delay(1000);
  
  Wire.beginTransmission(1);
  /* 1 adresine sahip Slave (köle) cihazına veri yollanacağı bildiriliyor */
  Wire.write("b");
  /* b karakteri slave cihaza yollanıyor */
  Wire.endTransmission();
  /* Yollanacak verilerin bittiği bildiriliyor */
  /* b karakteri slave cihazda LED'i sondur anlamına gelecektir */
  
  delay(1000);
  
  Wire.requestFrom(1, 2);
  /*  1 adresine sahip slave (köle) cihazından 7 BYTE'lık veri bekleniyor */
  char gelenKarakter;
  /* I2C hattından gelen veriler gelenKarakter değişkenine yazdırılacak */
  while(Wire.available()){
    /* I2C hattında yeni veri olduğu sürece döngü devam edecek */
    gelenKarakter = Wire.read();
    /* I2C hattından gelen veriler okunuyor */
    Serial.print(gelenKarakter);
    /* Gelen veriler ekrana yazdırılıyor */
  }
  Serial.println();
 
  delay(1000);
}
