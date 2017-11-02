#include<bits/stdc++.h>

using namespace std;

double initial=0;

int main()
{
    double H, U, D, F;
    int daycount;

    while(cin>>H>>U>>D>>F && H)
    {
        F=U*F/100;
        daycount=0;
        double initial=0;
        while(1)
        {
            daycount++;
            if(U>0)
                initial+=U;
                U-=F;
            if(initial>H)
            {
                cout<<"success on day "<<daycount<<endl;
                break;
            }

            initial-=D;

            if(initial<0)
            {
                cout<<"failure on day "<<daycount<<endl;
                break;
            }

        }

    }
    return 0;
}
