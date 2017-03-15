#include <stdio.h>
#include <ctype.h>
int main()
{
    int a=8;
    int b='b';
    int c=' ';
    printf("%d\t%d\n",a,b);
    int isdigit_a= isalpha(a);        //harf ise pozitif deðer döndürür
    int islower_b= islower(b);       //lower case ise pozitif deðer döndürür
   if(islower_b){
    printf("This is a lower case letter \n");
   }
   else{
    printf("This is not lower case letter\n");
   }


    return 1;
}
