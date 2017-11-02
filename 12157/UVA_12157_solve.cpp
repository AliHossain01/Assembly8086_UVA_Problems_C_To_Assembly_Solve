#include<bits/stdc++.h>

#define CSEKU_160212 main()

using namespace std;

int CSEKU_160212
{
    int T, N, second;
    int amountMile, amountJuice;
    cin>>T;
    for(int i=1; i<=T; i++)
    {
        cin>>N;
        amountMile=0;
        amountJuice=0;
        for(int j=1; j<=N; j++)
        {
            cin>>second;
            int temp=second;

            amountMile+=(second/30)*10+10;
            amountJuice+=(second/60)*15+15;

        }

        if(amountJuice==amountMile)
            cout<<"Case "<<i<<": Mile Juice "<<amountJuice<<endl;
        else if(amountJuice>amountMile)
            cout<<"Case "<<i<<": Mile "<<amountMile<<endl;
        else
            cout<<"Case "<<i<<": Juice "<<amountJuice<<endl;
    }
    close;
}
