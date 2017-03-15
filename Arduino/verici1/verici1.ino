#include <nRF24L01p.h>
#include <regMapCmds.h>

#include <SPI.h>


#include <String.h>

nRF24L01p verici(7,8);
/* CSN - > 7, CE -> 8 olarak belirlendi */

float sicaklik;
static char veri[10];
char a;

void setup() {
  Serial.begin(9600);
  SPI.begin();
  SPI.setBitOrder(MSBFIRST);
  /* SPI başlatıldı */
  verici.channel(90);
  verici.TXaddress("Hasbi");
  verici.init();
  /* Verici ayarları yapıldı */
}
void loop() {
  //sicaklik = analogRead(A0); 
  /* A0daki gerilim ölçüldü */
  //sicaklik = sicaklik * 0.48828125;
  sicaklik=10;
  /* Ölçülen gerilim sıcaklığa çevrildi */
  Serial.print("SICAKLIK = ");
  Serial.print(sicaklik);
  Serial.println(" C");
  /* Sıcaklık bilgileri ekrana yazdırıldı */
  
  dtostrf(sicaklik,5, 2, veri);
  /* float değerindeki sıcaklık stringe çevrildi */
 
  verici.txPL(a);
  boolean gonderimDurumu = verici.send(FAST);
  /* Sıcaklık bilgisi nRF24L01'e aktarıldı */
  /* Eğer gönderim başarısız olursa gonderimDurumu'nun değeri false olacaktır */
  if(gonderimDurumu==true){
        Serial.println("a");
  }else{
        Serial.println("mesaji gonderilemedi");
  }
  
  delay(1000); 
}
