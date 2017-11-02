#include <bits/stdc++.h>
using namespace std;
int main()
{
    int t,c,i,n;
    while(cin>>t)
    {
        n=0;
    for(i=1;i<=5;i++)
    {
        cin>>c;
        if(c==t)
        {
            n++;
        }
    }
    cout<<n<<endl;
    }
    return 0;

}
