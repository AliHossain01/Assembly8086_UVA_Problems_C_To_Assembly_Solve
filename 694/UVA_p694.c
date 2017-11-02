#include<stdio.h>
int main()
{
     long long int A, L, count, temp;
     int T=0;
    while(scanf("%lld%lld", &A, &L)==2)
    {
        if(A<0 && L<0)
            break;

        temp=A;
        count=0;
        while(A<=L)
        {
            if(A==1)
            {
                count++;
                break;
            }
            else if(A%2==0)
            {
                count++;
                A=A/2;
            }
            else if(A%2==1)
            {
                count++;
                A=3*A+1;
            }
        }
        printf("Case %d: A = %lld, limit = %lld, number of terms = %lld\n", ++T, temp, L, count);
    }
    return 0;
}

