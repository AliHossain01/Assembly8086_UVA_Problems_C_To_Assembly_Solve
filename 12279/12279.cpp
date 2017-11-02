#include<bits/stdc++.h>
using namespace std;

int main()
{
    int N, p;
    int j=0;
    while(cin>>N){
            if(N==0)
            break;
    int gt=0, st=0;
    for(int i=0; i<N; i++)
    {
        cin>>p;
        if(p==0)
            gt++;
        else
            st++;
    }
    cout<<"Case "<<++j<<": "<<st-gt<<endl;
    }
    return 0;
}
