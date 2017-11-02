#include<bits/stdc++.h>

using namespace std;
int main()
{
    int T;
    string s;
    cin>>T;
    while(T--)
    {
        cin>>s;
        int count=0;
        if(s.length() == 5)
            cout<<3<<endl;
        else
        {
            if(s[0]== 't')
                count++;
            if(s[1]=='w')
                count++;
            if(s[2]=='o')
                count++;
            if(count>=2)
                cout<<2<<endl;
            else
                cout<<1<<endl;
        }
    }
    return 0;
}
