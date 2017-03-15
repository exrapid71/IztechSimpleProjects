#include<stdio.h>

void addNum(int value);
void findMin();
void findMax();
void sort();
void avg();
int numbers[10];
int numbersira=0;
void main(void)
{
    int choice,num;
    do
    {
        printf("0. Enter the array of grades\n1. Find the minimum grade\n");
        printf("2. Find the maximum grade\n3. Print the values from min to max\n");
        printf("4. Print the average\n5.Exit\n");
        printf("Enter your choice:\n");
        scanf("%d",&choice);
        if(choice==0)
        {
            printf("enter the number: ");
            scanf("%d",&num);
            addNum(num);
        }
        else if(choice==1)
        {
            findMin();
        }
        else if(choice==2)
        {
            findMax();
        }
        else if(choice==3)
        {
            sort();
        }
        else if(choice==4)
        {
            avg();
        }
        else
        {
            printf("Wrong number idiot\n");
        }

    }
    while(choice!=5);

}
void addNum(int value)
{
    numbers[numbersira]=value;
    numbersira++;
}
void findMin()
{
    int min,i;
    min=numbers[0];
    for(i=1; i<numbersira; i++)
    {
        if(min<numbers[i])
            min=min;
        else
            min=numbers[i];
    }
    printf("Minimum grade is : %d\n",min);


}
void findMax()
{
    int max,i;
    max=numbers[0];
    for(i=1; i<numbersira; i++)
    {
        if(max<numbers[i])
            max=numbers[i];
        else
            max=max;
    }
    printf("Maximum grade is : %d\n",max);
}
void sort()
{
    int i,j,k,l,min,temp;
    int a=0;
    for(i=0; i<numbersira; i++)
    {
        printf("%d.is %d\t\n",i,numbers[i]);
    }
    for (j = 0; j < (numbersira - 1); ++j)
     {
          for (k = 0; k < numbersira - 1 - j; ++k )
          {
               if (numbers[k] > numbers[k+1])
               {
                    temp = numbers[k+1];
                    numbers[k+1] = numbers[k];
                    numbers[k] = temp;
               }
          }
     }
     for(l=0;l<numbersira;l++)
        printf("%d\t",numbers[l]);
    printf("\n");

}



void avg()
{
    int sum,i,avg;
    sum=0;
    for(i=0; i<numbersira; i++)
    {
        sum=sum+numbers[i];
    }
    avg=sum/numbersira;
    printf("The average is : %d\n",avg);
}
