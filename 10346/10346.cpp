#include<stdio.h>
int main()
{
    int i,n,k;
    while(scanf("%d %d",&n,&k)==2 && k>1)
    {
        i=n;
        while(n>=k)
        {
            i= i+n/k;
            n=(n/k)+(n%k);
        }
        printf("%d\n",i);
    }
    return 0;
}
