#include<stdio.h>
int main()
{
    char ch[10000];
    int i, count, word;
    while(gets(ch))
    {
        count=0;
        word=1;

        for(i=0; ch[i]!='\0'; i++)
        {
            if((ch[i]>='A' && ch[i]<='Z') || (ch[i]>='a' && ch[i]<='z'))
            {
                if(word){
                count++;
                }
                word=0;
            }

            else
            {
                word=1;
            }
        }
        printf("%d\n", count);
    }
    return 0;
}
