#include<stdio.h>
struct citytype
{
    int code;
    char name[30];
};
int main()
{
    struct citytype city={0,""};
    int order=0, choice=0;
    FILE *fileptr;


    fileptr=fopen("citynew.dat", "wb");


    do
    {
        printf("City name:");
        scanf("%s",city.name);
        printf("Plate code:");
        scanf("%d", &city.code);
        fwrite(&city, sizeof(struct citytype),1,fileptr);
        printf("Enter 1 if you want to add new record:\n");
        scanf("%d",&choice);
    }while(choice==1);
    fclose(fileptr);


    fileptr=fopen("citynew.dat", "rb");
    fseek(fileptr,0,SEEK_END);
    order=ftell(fileptr)/sizeof(struct citytype);
    printf("There are %d records in the file.\n", order);


    do
    {
        printf("Enter record order you want to see(0 to exit):");
        scanf("%d",&choice);
        if(choice>0 && choice<=order)
        {
            fseek(fileptr, (choice-1)*sizeof(struct citytype), SEEK_SET);
            fread(&city, sizeof(struct citytype),1,fileptr);
            printf("%d  -  %s  \n",city.code,city.name);
        }
    }while(choice!=0);


    fclose(fileptr);
    return 1;
}
