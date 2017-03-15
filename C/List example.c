#include<stdio.h>
struct node
{
    int number;
    struct node *next;
};

void main (void)
{
    struct node *rootnode,*currentnode,*endnode,*previousnode;
    int number,flag=0;

    rootnode=malloc(sizeof(struct node));
    printf("Enter a number:");
    scanf("%d",&number);
    rootnode->number=number;
    rootnode->next=NULL;
    currentnode=rootnode;
    endnode=rootnode;

    do
    {
        printf("Enter a positive number(else end)");
        scanf("%d",&number);
        endnode=malloc(sizeof(struct node));
        endnode->number=number;
        currentnode->next=endnode;
        endnode->next=NULL;
        currentnode=endnode;


    }
    while(number>0);
    printf("The items in the list\n");
    currentnode=rootnode;
    while(currentnode->next!=NULL)
    {
        printf("%d\n",currentnode->number);
        currentnode=currentnode->next;
    }

    printf("Enter number you want to delete:");
    scanf("%d",&number);

    if(rootnode->number==number)
    {
        rootnode=rootnode->next;
        flag=1;
    }
    else
    {
        previousnode=rootnode;
        currentnode=rootnode->next;
        while(currentnode->next!=NULL)
        {
            if(currentnode->next==number)
            {
                previousnode->next=currentnode->next;
                flag=1;
                break;
            }
            else
            {
                previousnode=previousnode->next;
                currentnode=currentnode->next;
            }
        }
    }

    if(!flag)
    {
        printf("number not found");
    }

    while(number>0);
    printf("The items in the list\n");
    currentnode=rootnode;
    while(currentnode->next!=NULL)
    {
        printf("%d\n",currentnode->number);
        currentnode=currentnode->next;
    }


}
