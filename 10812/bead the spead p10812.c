#include<stdio.h>

int main()
{
    int T, s, d, x, y, i;
    while(scanf("%d", &T)==1)
    {
        for(i=1; i<=T; i++)
        {
            scanf("%d%d", &s, &d);
            if(s<d || (s-d)%2!=0)
            {
                printf("impossible\n");
            }
            else {
                y = (s-d)/2;
                x = (s+d)/2;
                printf("%d %d\n", x, y);
            }

        }
    }
    return 0;
}
