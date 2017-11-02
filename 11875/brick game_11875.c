#include<stdio.h>
int main(){
 int T,i, m, k;
 int A[100];
    while(scanf("%d", &T)==1)
    {
        for(m=1; m<=T; m++)
        {
            scanf("%d", &i);

            for(k=0; k<i; k++)
            {
                scanf("%d", &A[k]);
            }
            printf("Case %d: %d\n", m, A[k/2]);
        }
    }
    return 0;
}
