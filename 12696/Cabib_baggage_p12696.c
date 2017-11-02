#include<stdio.h>
int main()
{
    int t, i, count;
    double length, width, depth, weight;
    while(scanf("%d", &t)==1){
    count=0;
    for(i=0; i<t; i++)
    {
        scanf("%lf%lf%lf%lf", &length, &width, &depth, &weight);

        if(((length<=56 && width<=45 && depth<=25) || (length+width+depth)<=125) && weight<=7.00)
        {
            printf("1\n");
            count++;
        }
        else
            printf("0\n");
    }
    printf("%d\n", count);
    }
    return 0;
}
