#include<stdio.h>
struct citytype
{
    int code;
    char name[30];
};
int main()
{
    struct citytype city;   //  35, "izmir " vardý onunla ilk baþta dosyaya yazdýk
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
    if((fileptr=fopen("cities.dat","rb"))==NULL)   //wb (write binary mode) binary modunda yazdýk.
    {
        printf("file not opened!");
    }
    else
    {
        fread(&city, sizeof(struct citytype), 1, fileptr);   //fwrite dosyaya yaz, fread dosyadan oku
    }
    printf("%d - %s \n", city.code, city.name);              //binary kodu normal haliyle okuyabilldik.
    fclose(fileptr);
    return 1;
}
