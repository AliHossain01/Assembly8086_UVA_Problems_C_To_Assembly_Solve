#include <stdio.h>
#include <stdlib.h>

int main()
{
    int Term1, Term2, Final, Attendance, Class_Test1, Class_Test2, Class_Test3, T, m1, m2;
    double AvgClassTest, totalMarks;

    while(scanf("%d", &T)==1)
    {
        int i;
        for(i=1; i<=T; i++)
        {
            m1=0;
            m2=0;
            AvgClassTest=0;
            totalMarks=0;
            scanf("%d%d%d%d%d%d%d", &Term1, &Term2, &Final, &Attendance, &Class_Test1, &Class_Test2, &Class_Test3);
            m1 = (Class_Test1<=Class_Test2)? Class_Test1:Class_Test2;
            m2 = (m1<=Class_Test3)? m1:Class_Test3;

            AvgClassTest = ((Class_Test1+Class_Test2+Class_Test3) - m2)/2;

            totalMarks = Term1+Term2+Attendance+Final+AvgClassTest;

            if(totalMarks>=90 && totalMarks<=100)
            {
                printf("Case %d: A\n", i);
            }
            else if(totalMarks<90 && totalMarks>=80)
            {
                printf("Case %d: B\n", i);
            }
            else if(totalMarks<80 && totalMarks>=70)
            {
                printf("Case %d: C\n", i);
            }
            else if(totalMarks<70 && totalMarks>=60)
            {
                printf("Case %d: D\n", i);
            }
            else if(totalMarks<60)
            {
                printf("Case %d: F\n", i);
            }

        }
    }
    return 0;
}
