#include<bits/stdc++.h>

#define LL long long

using namespace std;

int main()
{
    string s;
    int i = 1;
    while(cin >> s && s != "*")
    {
        cout << "Case "<< i<<": ";
        if(s[0] == 'H')
        {
            cout << "Hajj-e-Akbar\n";
        }
        else
        {
            cout << "Hajj-e-Asghar\n";
        }
        i++;
    }
    return 0;
}
