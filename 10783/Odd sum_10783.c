#include<stdio.h>
int main()
{
    int i, j, sum, a, b, t;
    while(scanf("%d",  &t)==1)
    {
        for(i=1; i<=t; i++)
        {
            sum=0;
            scanf("%d%d", &a, &b);
            for(j=a; j<=b; j++)
            {
                if((j%2)!=0)
                    sum=sum+j;
            }
            printf("Case %d: %d\n", i, sum);
        }
    }
    return 0;
}


