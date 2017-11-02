#include<bits/stdc++.h>
using namespace std;
int main()
{
    long long t,a,b,c;
    cin>>t;
    while(t--)
    {
        cin>>a>>b>>c;
        cout<<c*(2*a-b)/(a+b)<<endl;
    }
    return 0;
}