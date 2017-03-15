int role=7; 
String readString; 
void setup()
{
  Serial.begin(9600);    
  pinMode(role,OUTPUT);    
}

 
void loop() {
 
while(Serial.available())     
{                                       
  delay(5);                     
  char c= Serial.read();        
  readString+=c;
}
 
if(readString.length()>0)    
{
  Serial.println(readString);  
 
  if(readString=="ampul yak")      
  {
    digitalWrite(role,LOW);      
  }
 
  if(readString=="ampul kapat")      
  {
    digitalWrite(role,HIGH);        
  }
 
  readString="";           
}
}
