#include<stdio.h>
int main()
{
    int a, b, c, i, N;
    while(scanf("%d", &N)==1)
    {
        for(i=1; i<=N; i++)
        {
            scanf("%d%d%d", &a, &b, &c);
            if((a+b)>c)
                printf("OK\n");
            else
                printf("Wrong!!\n");
        }
    }
    return 0;
}
