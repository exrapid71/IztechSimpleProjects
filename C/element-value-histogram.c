#include<stdio.h>
#define SIZE 6
int numofstars=0;
void histogram(int);
int main ( void )
{
    int n[SIZE];
    int i,j,minelement;
    int *ptr;

    for(i=0;i<SIZE;i++)
    {
        printf("n[%d] :",i);
        scanf("%d",&n[i]);
    }
    printf("element\tValue\tHistogram\n");
    for(i=0;i<SIZE;i++){
        printf("%d\t%d\t",i,n[i]);
        histogram(n[i]);
        printf("\n");

    }

    ptr=&n[0];
    printf("%p",ptr);
    minelement=*ptr;
     for(i=1;i<SIZE;i++)
    {
        ptr++;
        if(*ptr<minelement)
        {
            minelement=*ptr;
        }
    }
    printf("min element of array : %d",minelement);

}
void histogram(int n)
{
            int j;
            for(j=0;j<n;j++){
            printf("*");
            numofstars++;

            }
}
