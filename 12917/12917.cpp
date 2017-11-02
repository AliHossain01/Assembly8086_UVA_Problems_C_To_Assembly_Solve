#include<bits/stdc++.h>
using namespace std;

int main()
{
    int x,y,z;
    while(scanf("%d%d%d",&x,&y,&z)==3)
    {

        if(x<=(z-y))
            cout<<"Props win!"<<endl;
        else
            cout<<"Hunters win!"<<endl;
    }
    return 0;
}
