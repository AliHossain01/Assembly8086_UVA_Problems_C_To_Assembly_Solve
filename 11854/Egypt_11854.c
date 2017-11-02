#include<stdio.h>
int main()
{
    int a, b, c;

    while(scanf("%d %d %d",&a,&b,&c)==3)
    {
        if(a!=0 && b!=0 && c!=0)
        {
            int x, y, z, ab, bc, ca;
            x=a*a;
            y=b*b;
            z=c*c;
            ab=(a*a)+(b*b);
            ca=(a*a)+(c*c);
            bc=(b*b)+(c*c);
            if(x==bc || y==ca || z==ab)
                printf("right\n");
            else
                printf("wrong\n");
        }
    }
    return 0;
}
