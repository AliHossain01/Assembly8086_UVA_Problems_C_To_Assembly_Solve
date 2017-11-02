#include<bits/stdc++.h>

#define CSEKU_160212 main()

using namespace std;


int CSEKU_160212
{
    int a, b, clickForward, clickBackward;
    while(cin>>a>>b)
    {
        if(a==-1 && b==-1)
            break;
        clickForward=max(a,b)-min(a,b);
        clickBackward=100-(max(a,b)-min(a,b));

        if(clickForward>=clickBackward)
            cout<<clickBackward<<endl;
        else
            cout<<clickForward<<endl;
    }
close;
}
