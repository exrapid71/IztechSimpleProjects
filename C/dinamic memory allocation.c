#include<stdio.h>
#include<stdlib.h>
#include<string.h>
struct animal{
    char name[25];
    char breed[25];
    int age;
} *animal1, *animal2, *animal3;


void firstExample();


int main()
{
    firstExample();
    return 1;
}


firstExample()
{
    animal1= (struct animal *)malloc(sizeof(struct animal));
    strcpy(animal1->name, "General");
    strcpy(animal1->breed, "mongre1");
    animal1->age=1;


    animal2=animal1;


    animal1= (struct animal *)malloc(sizeof(struct animal));   //malloc allocate dynamic memory for our variables. int de�er al�r ve ay�rmak istedi�imiz.
    strcpy(animal1->name, "Bobi");
    strcpy(animal1->breed, "labrador");
    animal1->age=3;


    animal3= (struct animal *)malloc(sizeof(struct animal));
    strcpy(animal3->name, "Kristal");
    strcpy(animal3->breed, "sheepdog");
    animal3->age=3;


    printf("%s is a %s and %d years old\n", animal1->name, animal1->breed, animal1->age);
    printf("%s is a %s and %d years old\n", animal2->name, animal2->breed, animal2->age);
    printf("%s is a %s and %d years old\n", animal3->name, animal3->breed, animal3->age);
    animal1= animal3;


    free(animal3);   //bellekte ay�rd���m�z yerin referans�n� kald�r�yor, bo�u bo�una memoriyi kullanmam�� oluyoruz. i�indeki veriler silinmez, ama eri�emeyiz de.
    free(animal2);
    //free(animal1);  // bunu kullanam�yoruz.1i 3e atad���m�z i�in 1i serbest b�rakmaya gerek yok ikisi de ayn� adresi g�steriyor.
}
