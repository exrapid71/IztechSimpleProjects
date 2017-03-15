#include <stdio.h>   // palindrom veya stringin tersini almayı rekursif yapabilirsin
int iterativeFibonacci(int limit);
int recursiveFibonacci(int limit);
int main()
{
    int limit;
   puts("Enter limit");
   scanf("%d",&limit);
   recursiveFibonacci(limit);
   printf("result is: %d\n", recursiveFibonacci(limit));
}
int iterativeFibonacci(int limit)
{
    int f1=0;
    int f2=1;
    int result;
    int counter;
    if(limit==0 || limit==1)
    {
        result=limit;
    }
    else{
        for (counter=2; counter<=limit; counter++)
        {
            result= f1+f2;
            f1=f2;
            f2=result;
        }
    }
    return result;
}
  int recursiveFibonacci(int limit)
  {
      int f1=0;
    int f2=1;
    int result;
    if(limit==0 || limit==1)
    {
        result=limit;
    }
    else{
           return recursiveFibonacci(limit-1)+recursiveFibonacci(limit-2);
    }
  }
