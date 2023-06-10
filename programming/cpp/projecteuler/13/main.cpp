#include <iostream>

#include <string>

using std::cout;
using std::cin;
using std::ws;
using std::string;

int main(){
	string arr[100];
	long long sol{0};
	for(int i = 0; i < 100;i++){
		getline(cin >> ws, arr[i]);
	}
	cout << "Solution: " << sol << '\n';
	return 0;
}
