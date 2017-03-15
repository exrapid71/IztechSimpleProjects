#define Enable1 10  // sol motor            l293 1. bacagı
#define Enable2 11  // sag                  l293 9. bacagı
#define Voltage 8     //                    l293 16. bacagı
#define motor11 2 //sol motor  + uc         l293 2. bacagı
#define motor12 3 //sol motor               l293 7. bacagı
#define motor21 6  //sag motor  + uc        l293 10. bacagı
#define motor22 7 //sag motor               l293 15vvvvvvvv. bacagı
int sen[6];
float proportional,last_proportional=0,integral=0,derivative,power_difference,pozisyon,Mpos;
float son_sol,son_sag;
float Tpos=0;
void doksan(int type){
  int i=0;
  if(type==1){
    while(!sen[2]==1 && !sen[3]==1){
      setMotor(255,-255);
    }
  }
  else{
    while(!sen[2]==1 && !sen[3]==1){
      setMotor(-255,255);
    }
  }
  setMotor(100,100);
}
void setMotor(int sol,int sag){
  if(sol<0){
    digitalWrite(motor11,LOW);
    digitalWrite(motor12,HIGH);
    //solmotorgeri
  }
  else{
    digitalWrite(motor11,HIGH);
    digitalWrite(motor12,LOW);
    //solmotorileri
  }
  if(sag<0){
    digitalWrite(motor21,LOW);
    digitalWrite(motor22,HIGH);
    //sagmotorgeri
  }
  else{
    digitalWrite(motor21,HIGH);
    digitalWrite(motor22,LOW);
    //sagmotorileri
  }
  analogWrite(Enable1,sol);
  analogWrite(Enable2,sag);
 /* Serial.print(sol);
  Serial.print(" ");
  Serial.print(sag);
  Serial.println();*/
}
int adc_oku(){
  int n0=0,n1=0,n2=0,n3=0,n4=0,n5=0,n6=0,n7=0;
  int oran=512;
  sen[0]=analogRead(A0);
  sen[1]=analogRead(A1);
  sen[2]=analogRead(A2);
  sen[3]=analogRead(A3);
  sen[4]=analogRead(A4);
  sen[5]=analogRead(A5);
  /*Serial.print(sen[0]);
  Serial.print(" ");
  Serial.print(sen[1]);
  Serial.print(" ");
  Serial.print(sen[2]);
  Serial.print(" ");
  Serial.print(sen[3]);
  Serial.print(" ");
  Serial.print(sen[4]);
  Serial.print(" ");
  Serial.print(sen[5]);
  Serial.print(" ");
  Serial.println();
  delay(100);*/
  int i=0;
  for(i=0;i<6;i++){}
  if(sen[5]<oran)
    n5=1;
  else
    n5=0;
  if(sen[4]<oran)
    n4=1;
  else
    n4=0;
  if(sen[3]<oran)
    n3=1;
  else
    n3=0;
  if(sen[2]<oran)
    n2=1;
  else
    n2=0;
  if(sen[1]<oran)
    n1=1;
  else
    n1=0;
  if(sen[0]<oran)
    n0=1;
  else
    n0=0;
    if(n0==1 && n1==0 && n2==0 && n3==0 && n4==0 && n5==0)  //siyah üzerine beyaz
      Mpos=5;
    if(n0==1 && n1==1 && n2==0 && n3==0 && n4==0 && n5==0)
      Mpos=4;//4
    if(n0==1 && n1==1 && n2==1 && n3==0 && n4==0 && n5==0)
      Mpos=3;//3
    if(n0==1 && n1==1 && n2==1 && n3==1 && n4==0 && n5==0)
      Mpos=2;//2
    if(n0==0 && n1==1 && n2==1 && n3==1 && n4==0 && n5==0)
    //  Mpos=1;
       doksan(1);
    if(n0==0 && n1==0 && n2==1 && n3==1 && n4==0 && n5==0)
      Mpos=0;
    if(n0==0 && n1==0 && n2==1 && n3==0 && n4==0 && n5==0)
      Mpos=0;
    if(n0==0 && n1==0 && n2==0 && n3==1 && n4==0 && n5==0)
      Mpos=0;
    if(n5==0 && n4==1 && n3==1 && n2==1 && n1==0 && n0==0)
      //Mpos=-1;
      doksan(2);
    if(n5==1 && n4==1 && n3==1 && n2==1 && n1==0 && n0==0)
      Mpos=-3;//-2
    if(n5==1 && n4==1 && n3==1 && n2==0 && n1==0 && n0==0)
      Mpos=-4;//-3
    if(n5==1 && n4==1 && n3==0 && n2==0 && n1==0 && n0==0)
      Mpos=-5;//-4
    if(n5==1 && n4==0 && n3==0 && n2==0 && n1==0 && n0==0)
      Mpos=-5;
  return Mpos;
}
void pid(){
  /*
    Zemin sensöründen gelen degerleri okuyarak mantıklı analizlerler motorların pwm degerini olusturur
    Kp,Kd,Ki degerlerini değiştir test yaparak
  */
  //enb 80 kp 12 kd 10 ki 1
  //enb 120 kp 50 kd 10 ki 1
  //enb 255 kp 50 kd 5 ki 10
  float enb=100,Kp=12,Kd=7,Ki=0.1;
  pozisyon=adc_oku();
  proportional=Tpos-pozisyon;
  derivative=proportional-last_proportional;
  integral+=proportional;
  last_proportional=proportional;
  power_difference=proportional*Kp+derivative*Kd;
  if(power_difference>enb)
    power_difference=enb;
  if(power_difference<-enb)
    power_difference=-enb;
  son_sol=enb+power_difference;
  son_sag=enb-power_difference;
  setMotor(son_sol,son_sag);
}
void setup(){
  
  pinMode(Enable1,OUTPUT);
  pinMode(Enable2,OUTPUT);
  pinMode(motor11,OUTPUT);
  pinMode(motor12,OUTPUT);
  pinMode(motor21,OUTPUT);
  pinMode(motor22,OUTPUT);
  pinMode(Voltage,OUTPUT);
  digitalWrite(Voltage,HIGH);
  Serial.begin(9600);
  
}
void loop(){
  pid();
  
}
