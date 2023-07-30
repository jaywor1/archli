#include <iostream>

using std::cout;
using std::cin;

int main(){

	int x{};

	std::cin >> x;

	int sol{1};
	for(int i = x; i != 1;x--){
		sol = sol * i;
	}
	
	std::cout << x << '\n';
	return 0;
}
