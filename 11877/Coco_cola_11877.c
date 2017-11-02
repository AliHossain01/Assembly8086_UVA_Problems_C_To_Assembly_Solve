#include<stdio.h>
int main(){
int N;
while(scanf("%d", &N)==1)
{
    int temp=N+1;
    int flag=1;
    int e=0;
        if(N==0){
            flag=1;
        }
        else{
           while(temp>=3)
        {
            e=e+(temp/3);
            temp=(temp%3)+(temp/3);
            flag=0;
        }
    if(flag==0){
        printf("%d\n", e);
    }
}

}
return 0;
}
