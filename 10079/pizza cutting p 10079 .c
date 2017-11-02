#include<stdio.h>
int main()
{

    long long int N, piece;

    while(1)
    {
        scanf("%lld", &N);
        if(N<0)
            break;

            piece = (N*(N+1))/2 + 1;
            printf("%lld\n", piece);

    }
    return 0;
}
