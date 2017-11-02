#include<bits/stdc++.h>

using namespace std;
int main()
{
    int testCase, noOfStores;
     int x;

    cin>>testCase;
    while(testCase--)
    {
       int max=0, min=99;
        cin>>noOfStores;
        while(noOfStores--)
        {
            cin>>x;

            if(max<x)
                max=x;
            if(min>x)
                min=x;
        }
        cout<<(max-min)*2<<endl;
    }

    return 0;
}
