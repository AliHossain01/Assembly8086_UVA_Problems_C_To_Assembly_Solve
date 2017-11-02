#include<stdio.h>

int main()
{
    char ch[10000];
    int length, i;
    while(gets(ch))
    {
        length=strlen(ch);
        for(i=0; i<length; i++)
        {
            ch[i]=ch[i]-7;
        }
        puts(ch);
    }
    return 0;
}
