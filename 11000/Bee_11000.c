#include<stdio.h>
int main()
{
    long long int female, total, male, x, N, i;
    while(scanf("%lld", &N) == 1){
            if(N>=0){
        female=1; male=0; total=1;
        for(i=0; i<N; i++)
        {
            x = male;
            male = total;
            total = male + x + 1;

        }
        printf("%lld %lld\n", male, total);
    }
    }
    return 0;
}
