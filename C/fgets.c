#include <stdio.h>
#define SIZE 5
void fgetsExample(){
    char sentence[SIZE];
    puts("enter text:");
    fgets(sentence, SIZE, stdin);   //gets characters, size'dan fazla alamaz son karakteri \0, from terminal
    puts("the text entered:");         //like printf
    puts(sentence);
}
int main()
{
    fgetsExample();
    return 1;
}
