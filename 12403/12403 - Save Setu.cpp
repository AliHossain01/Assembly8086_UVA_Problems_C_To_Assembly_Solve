#include<bits/stdc++.h>

using namespace std;

int main()
{
    int t;
    cin >> t;
    int ans = 0;
    while(t--)
    {
        string s;
        cin >> s;
        int num;
        if(s[0] == 'd')
        {
            cin >> num;
            ans += num;
        }
        else
            cout << ans << endl;
    }
    return 0;
}
