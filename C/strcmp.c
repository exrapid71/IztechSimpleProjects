/*
Turkiye Buyuk Millet Meclisi
TBMM

*/
#include <stdio.h>
#include<string.h>
#define SIZE 5
void compareNames(char name1[], char name2[]){
    int resultComp= strcmp(name1, name2);
    if (resultComp<0){                              //if name1<name2   name1 alfabede daha �nde
        printf("%s\n%s\n", name1,name2);
    }
    else if(resultComp>0){                          // if name1>name2 name2 alfabede daha �nde
       printf("%s\n%s\n", name2,name1);
    }
    else{                                           //alfabede esitler
        printf("%s\t%s", name1,name2);
    }
}
int main()
{
    char name1[10]= "ahmet";
    char name2[10]= "mehtap";
    char name3[10]= "mehmet";
    char name4[10]= "ahmet";
    compareNames(name3,name2);         //de�i�tirip g�r
    return 1;
}
