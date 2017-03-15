#include<stdio.h>
#include<string.h>

int main(void)
{
    char name[5];

    int i=0;
    printf("Enter a name bi :");
    scanf("%s",&name);
    
    while(name[i]!='\0')
    {
        i++;
    }
    
    char eman[i+1];
    int karakter=i;
    int j;
    
    for(j=0; j<i; j++)
    {
        karakter--;
        eman[j]=name[karakter];

    }
    eman[i]='\0';
    printf("%s",eman);
    int cvp=strcmp(name,eman);

    if(cvp==0)
        printf("true");
    else
        printf("false");
}
