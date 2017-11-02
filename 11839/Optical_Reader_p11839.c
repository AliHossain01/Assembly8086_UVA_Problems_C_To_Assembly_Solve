#include<stdio.h>
int main()
{
    int N, A[6], i, k, j;
    while(scanf("%d", &N) == 1)
    {
        if(N>0){
        for(i=0; i<N; i++)
        {
            int count=0;
            for(j=1; j<=5; j++)
            {
                scanf("%d", &A[j]);
                if(A[j]<=127)
                {
                    count++;
                    k=j;
                }
            }
            if(count==1){
            if(k==1)
                printf("A\n");
            else if(k==2)
                printf("B\n");
            else if(k==3)
                printf("C\n");
            else if(k==4)
                printf("D\n");
            else if(k==5)
                printf("E\n");
            }
            else
                printf("*\n");
        }
    }
    }
    return 0;
}

