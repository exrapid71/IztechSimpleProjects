#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//definition of functions
void applyRulesOnWords(char *words[]);
int applyRule(char *word, int rule);
void writeOutput(char *oldword, char *newword);
//definition of public variable
int i,counter=0,firstflag=0;
FILE *input,*output;
char *addressInput,*addressOutput;
int main(int argc, char *arg[] )
{
    char *temp;
    int j;
    /*Actually, I tried to get info according to parameters but i couldn't do it
    for( j = 0; i < argc; i++ ) {
        if(*arg[j]='-i')
            addressInput=arg[j+1];
        if(*arg[j]='-o')
            addressOutput=arg[j+1];
	}*/
    addressInput=arg[2];
    addressOutput=arg[4];

    input=fopen(addressInput,"r");//opening inputfile,just to read
    if(input==NULL)//controlling input file exist or can be opened
    {
        printf("InputFile was not opened.\n");
        return 0;
    }
    else
    {

        //if input file exist do this block
        while(!feof(input))//in here, I get how many words file have
        {

            fscanf(input,"%s",&temp);
            counter++;//keeping how many words in inputfile
        }
        char *s[counter];//definiton new char array to keep words
        for(i=0; i<counter; i++)//allocation of space
        {
            if ((s[i] = malloc(sizeof(char) * 50)) == NULL)
            {
                printf("unable to allocate memory \n");
                return -1;
            }
        }
        i=0;
        fclose(input);//I have to close and open file again to get words
        input=fopen(addressInput,"r");

        while(!feof(input))
        {
            fscanf(input,"%s",s[i]);//getting words
            i++;
        }
        char **newarray=s;

        applyRulesOnWords(newarray);//I call this function to stem
    }
    printf("Writing outputfile is successful.");
    system(addressOutput);//runing outputfile
    fclose(input);
    fclose(output);
}
void applyRulesOnWords(char *words[])
{
    int a=0,b=0;//I definition these variable for counter
    int found=0;//this is flag for applying stem rule,if applied, it will be 1
    while(a<counter)
    {
        for(b=1; b<5; b++)
        {
            found=applyRule(words[a],b);//calling applyRule function to apply rule one by one
            if(found==1)//if one rule applied, it skip other rules
                break;
        }
        if(found==0)//if not any rule was applied, it is written to outputfile much the same
        {
            writeOutput(words[a],words[a]);
        }
        a++;
        found=0;//when passing the new word flag must be 0
    }
}
int applyRule(char *word, int rule)
{
    //applying rules
    int wordlen=strlen(word);
    char *oldword;
    int a;
    strcpy(oldword,word);
    if(rule==1)
    {
        if((wordlen-4)<=0)
            return 0;
        int difference=wordlen-4;
        if( (*(word+difference)=='s') && (*(word+difference+1)=='s') && (*(word+difference+2)=='e') && (*(word+difference+3)=='s') )
        {
             *(word+difference+2)=' ';
            *(word+difference+3)=' ';
            writeOutput(oldword,word);
            return 1;
        }
        else
            return 0;
    }
    else if(rule==2)
    {
        if((wordlen-3)<=0)
            return 0;
        int difference=wordlen-3;
        if( (*(word+difference)=='i') && (*(word+difference+1)=='e') && (*(word+difference+2)=='s') )
        {
            *(word+difference+1)=' ';
            *(word+difference+2)=' ';
            writeOutput(oldword,word);
            return 1;
        }
        else
            return 0;
    }
    else if(rule==3)
    {
         if((wordlen-2)<=0)
            return 0;
        int difference=wordlen-2;
        if( (*(word+difference)=='s') && (*(word+difference+1)=='s') )
        {
            *(word+difference)='s';
            *(word+difference+1)='s';
            writeOutput(oldword,word);
            return 1;
        }
        else
            return 0;
    }
    else if(rule==4)
    {
         if((wordlen-1)<=0)
            return 0;
        int difference=wordlen-1;
        if( (*(word+difference)=='s') )
        {
            *(word+difference)=' ';
            writeOutput(oldword,word);
            return 1;
        }
        else
            return 0;
    }
}
void writeOutput(char *oldword, char *newword)
{
    output=fopen(addressOutput,"a");//opening outputfile,if doesnt exist,create new one.If exists,continues with old infos
    if(input==NULL)//if couldn't create or open, it shows error message
    {
        printf("OutputFile was not opened.\n");
    }
    else
    {//if it is opened, it continues with old infos
        if(firstflag==0)
        {
            fprintf(output,"Old Words \t New Words\n");
            fprintf(output,"--------------------------\n");
            firstflag=1;
        }
        fprintf(output,"%s -> \t %s \n",oldword,newword);
    }
    fclose(output);
}
