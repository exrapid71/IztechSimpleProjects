#define Enable1 9
#define motor1 7
#define motor2 8
#define voltagesupply 2

void setup() {
   pinMode(Enable1,OUTPUT);
   pinMode(motor1,OUTPUT);
   pinMode(motor2,OUTPUT);
   pinMode(voltagesupply,OUTPUT);
   digitalWrite(voltagesupply,HIGH);
  // put your setup code here, to run once:


}

void loop() {
 
  int deger = map(Enable1,0,1023,0,255);   // burda enable1 in aralığını 0 ile 1023 den 0 ile 255 aralığına çektim kaya anlamzsan anlatırım bi ara yani pwm denerken 0 ile 255 arasında değerler giricem
  
     digitalWrite(motor1,HIGH);
     digitalWrite(motor2,LOW);
   
    analogWrite(deger,200);                                                                                                 
    
    

  
  
  
  
  
  // put your main code here, to run repeatedly:

}
