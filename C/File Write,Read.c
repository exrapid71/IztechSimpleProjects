#include<stdio.h>
int main()
{
    int code;
    char name[30];
    FILE *fileptr;
    /*if((fileptr=fopen("cities.txt","a"))==NULL)   //w (write ) koyarsak yeniden yazar, a koyarsak append yenisini ekler. r (read) okuma iþlemi yapar.
    {
        printf("file not opened!");
    }
    else
    {
        printf("Name of city:");
        gets(name);
        printf("Plate code of city:");
        scanf("%d", &code);
        fprintf(fileptr, "%d %s\n", code, name);
    }
    fclose(fileptr);*/
    if((fileptr=fopen("cities.txt","r"))==NULL)   //w (write ) koyarsak yeniden yazar, a koyarsak append yenisini ekler. r (read) okuma iþlemi yapar.
    {
        printf("file not opened!");
    }
    else
    {
        while (!feof(fileptr)) {                                  //while not end of file
        fscanf(fileptr,"%d%s",&code,name);
        printf("Name - %s\n",name);
        printf("Plate code - %d\n",code);
        }
    }
    fclose(fileptr);
    return 1;
}
