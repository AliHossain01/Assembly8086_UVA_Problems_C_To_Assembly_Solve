#include <stdio.h>

long long H(int n)
{
    long long res = 0;
    int i;
    for(i = 1; i <= n; i++ )
    {
        res = (res + n/i);
    }
    return res;
}

int main()
{
    int T, x, j;
    long long result;
   scanf("%d", &T);
   while(T--)
   {
        scanf("%d", &x);
        result=H(x);
        printf("%lld\n", result);
    }
    return 0;
}
