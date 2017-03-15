#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int size;
void applyRulesOnWords(char *words[]);
int applyRule(char *word, char *rule, char *changeOfRule);
char *inputname,*outputname;

int main(int argc, char *argv[] )
{
    int i=0;
    for(i=0; i<argc; i++)
    {
        if((int)argv[i]==(int)"-i")
            inputname=argv[i+1];
        if((int)argv[i]==(int)"-o")
            outputname=argv[i+1];
    }

    FILE *fileptr;
    char *word;

    if((fileptr=fopen(inputname,"r"))==NULL)
    {
        printf("There is no input.txt");
    }
    else
    {
        while(!feof(fileptr))
        {
            fscanf(fileptr,"%s",&word);
            size++;
        }
    }
    char *words[size];
    for(i=0; i<size; i++)
    {
        if((words[i]=malloc(sizeof(char) * 20)) == NULL)
        {

        }
    }
    fclose(fileptr);
    i=0;
    fileptr=fopen(inputname,"r");
    while(!feof(fileptr))
    {
        fscanf(fileptr,"%s",words[i]);
        i++;
    }
    char **lexis=words;
    applyRulesOnWords(lexis);
    fclose(fileptr);
    printf("----THE END----");
    return 0;
}
void applyRulesOnWords(char *words[])
{
    FILE *ptrOut;
    ptrOut=fopen(outputname,"a");
    int i,j,k,result=0;
    char *oldword;
    fprintf(ptrOut,"Before\tAfter\n");
    for(i=0; i<size; i++)
    {
        fprintf(ptrOut,"%s\t",words[i]);
        result=applyRule(words[i],"sses","ss");
        if(result!=1)
            result=applyRule(words[i],"ies","i");
        if(result!=1)
            result=applyRule(words[i],"ss","ss");
        if(result!=1)
            result=applyRule(words[i],"s"," ");

        fprintf(ptrOut,"%s\n",words[i]);
    }
}
int applyRule(char *word, char *rule, char *changeOfRule)
{
    int j,k;
    k=strlen(rule);
    int length=strlen(word);
    int result=strcspn(word,rule);
    char *result2 =strstr(word,rule);

    if(result2!=NULL)
    {
        *(word+(length-k))=NULL;
        strcat(word,changeOfRule);
        return 1;
    }
    else
        return 0;
}
