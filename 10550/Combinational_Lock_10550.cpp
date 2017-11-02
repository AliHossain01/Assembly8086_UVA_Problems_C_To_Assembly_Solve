#include<bits/stdc++.h>

using namespace std;

int main()
{
    int initial, first, second, third, g1, g2, g3;

    while(cin>>initial>>first>>second>>third)
    {
        if(initial == 0 && first == 0 && second==0 && third ==0 )
            break;
        else
        {
            if(initial > first)
                g1 = ( initial - first) * 9; // (360/40)=9
            else
               g1 = (initial-first+40) * 9;
            if(second>first)
                g2=( second-first) * 9;
            else
                g2= (second-first+40)* 9;
            if(third>second)
               g3 = (second-third+40) * 9;
            else
                g3=(second-third)*9;
            cout<<720+360+g1+g2+g3<<endl;

        }
    }

    return 0;
}
