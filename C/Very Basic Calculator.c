#include<stdio.h>
int main()
{
    int toplam,fark,carpim,bolme,sonuc,sayi1,sayi2,islem;
    while(1)
    {
        printf("Yapacaginiz islemi seciniz:\n");
        printf("1.Toplama\n2.Cikarma\n3.Carpma\n4.Bolme\n");
        scanf("%d",&islem);
        if(islem == 1)
        {
            printf("Sectiginiz islem Toplama ve  ilk sayi giriniz:\n ");
            scanf("%d", &sayi1);
            printf("Ikinci sayiyi giriniz:\n ");
            scanf("%d", &sayi2);
            sonuc = sayi2 + sayi1;
            printf("Sonuc = %d\n",sonuc);
        }
        if(islem == 2)
        {
            printf("Sectiginiz islem Cikartma 2 sayi giriniz:\n ");
            scanf("%d", &sayi1);
            printf("Ikinci sayiyi giriniz:\n ");
            scanf("%d", &sayi2);
            sonuc=sayi1 - sayi2;
            printf("Sonuc = %d\n",sonuc);
        }
        if(islem == 3)
        {
            printf("Sectiginiz islem Carpma 2 sayi giriniz:\n ");
            scanf("%d", &sayi1);
            printf("Ikinci sayiyi giriniz:\n ");
            scanf("%d", &sayi2);
            sonuc=sayi1 * sayi2;
            printf("Sonuc = %d\n",sonuc);
        }
        if(islem == 4)
        {

            printf("Sectiginiz islem Bolme 2 sayi giriniz:\n");
            scanf("%d", &sayi1);
            printf("Ikinci sayiyi giriniz:\n");
            scanf("%d", &sayi2);
            sonuc=sayi1 / sayi2;
            printf("Sonuc = %d\n",sonuc);
        }
    }

    return 0;

}
