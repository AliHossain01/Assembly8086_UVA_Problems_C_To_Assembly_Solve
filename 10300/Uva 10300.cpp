#include<stdio.h>
int main()
{
    int i,j,a,b,c,k,l,s;
    while(scanf("%d",&i)==1)
    {
        for(j=0; j<i; j++)
        {
            s=0;
            scanf("%d",&k);
            for(l=0; l<k; l++)
            {
                scanf("%d %d %d",&a,&b,&c);
                s+=a*c;
            }
            printf("%d\n",s);
        }
    }
    return 0;

}
