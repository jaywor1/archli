#include <iostream>

#include <string.h>
#include <cmath>

using std::cout;
using std::string;

int main(){
	double num = 2;
	double sol{0};
	string temp{"xd"};
	for(int i = 1; i < 1001; i++){
		num *= 2;
	}
	while(num/10 != 0){
		sol += std::fmod(num,10);
		temp = std::to_string(num);
		temp = std::pop_back(temp);
		num = std::stod(temp);
	}
	cout << sol << '\n';

	return 0;
}
