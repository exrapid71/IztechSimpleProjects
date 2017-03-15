#include <stdio.h>
int factorial(num);
int combination(int a, int b);
int main(void)
{
    int a,b,result;
    printf("enter two numbers: \n");
    scanf("%d""%d", &a, &b);
    result=combination(a,b);
    printf("combination is %d", result);
    return 1;
}
int factorial(int num){
    int result = 1;
    int counter;
    for(counter = 1; counter <= num; counter++ ){
        result *= counter;   // result = result * counter
    }
    return result;
}
int combination(int a, int b){
    int result = 0;
    result = factorial(a) / (factorial(b)*factorial(a-b));
    return result;
}
