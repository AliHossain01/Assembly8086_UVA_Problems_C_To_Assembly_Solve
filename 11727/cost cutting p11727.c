#include<stdio.h>
int main()
{
    int T, i, firstEmployee, secEmployee, thirdEmployee, Survives, m1,large, small, m2;

    while(scanf("%d", &T)==1)
    {
        for(i=1; i<=T; i++)
        {
            scanf("%d%d%d", &firstEmployee, &secEmployee, &thirdEmployee);
            m1 = (firstEmployee>secEmployee)? firstEmployee:secEmployee;
            large = (m1>thirdEmployee)? m1:thirdEmployee;
            m1 = (firstEmployee<secEmployee)? firstEmployee:secEmployee;
            small = (m1<thirdEmployee)? m1:thirdEmployee;
            Survives = (firstEmployee+secEmployee+thirdEmployee)-(large+small);
            printf("Case %d: %d\n", i, Survives);

        }
    }
    return 0;
}
