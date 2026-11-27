#include<iostream>
#include<cstdlib>
#include<ctime>
#include<cmath>
#include<cstring>
#include<unistd.h>
using namespace std;

const int oneSec = 1000000;

int main () {
    srand(time(0));
    int nmax = 100, n = 1 + rand()%nmax, guessedNum = 0, tries = 0;
    cout<<"Indovina il numero!"<<endl;
    while(guessedNum != n) {
        cout<<"n:\t"; cin>>guessedNum;
        tries++;
        if(guessedNum > n) {
            cout<<"n < "<<guessedNum<<endl;
        } else if(guessedNum < n) {
            cout<<"n > "<<guessedNum<<endl;
        } else {
            cout<<"YOU GUESSED IT!"<<endl;
            cout<<"number = "<<n<<endl;
            cout<<"tries = "<<tries<<endl;
            return 0;
        }
    }
    return 0;
}
