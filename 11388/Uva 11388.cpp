#include<stdio.h>
int main()
{
    int i,j,g,l;
    scanf("%d",&i);
    for(j=1; j<=i; j++)
    {
        scanf("%d %d",&g,&l);
        if(l%g==0)
        {
            printf("%d %d\n",g,l);
        }
        else
        {
            printf("-1\n");
        }
    }
    return 0;
}
