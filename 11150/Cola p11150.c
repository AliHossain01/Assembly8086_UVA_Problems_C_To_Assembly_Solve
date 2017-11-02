#include<stdio.h>

int main()
{
    int N;
    int temp;
    while(scanf("%d",&N)==1)
    {
        temp=N+1;
        int e=N;
        while(temp>=3)
        {
            e=e+(temp/3);
            temp=(temp%3)+(temp/3);
        }
        printf("%d\n", e);
    }
    return 0;
}
