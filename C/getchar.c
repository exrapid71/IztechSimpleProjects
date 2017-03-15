#include <stdio.h> //getchar getting characters
#define SIZE 5
void getcharExample(){
    int c;
    int i=0;
    char sentence[SIZE];
    puts("enter text:");
    while(i<(SIZE-1) && (c=getchar()) != '\n') {        //if user didnt go to new line (didnt press enter)//
        sentence[i]=c;
        i++;
    }
    sentence[i] = '\0';
    puts("text you entered:");
    puts(sentence);
    puts("first character of your text is:");
    putchar(sentence[0]);
}
int main()
{
    getcharExample();
    return 1;
}
