#include <stdio.h>
#include <ctype.h>
int main()
{
    /* printf("result is: %d", upper_b);  upper ascii deðerini verir */
    int a=8;
    int b='b';
    int c=' ';
    int isspace_c=isspace(c);
    printf("result is: %d\n", isspace_c);   // c boþluksa pozitif sayý döndürür


    return 1;
}
