#include <iostream>
#include <math.h>
#include <string>

#include <chrono>
#include <thread>


using std::cout;
using std::string;



// 5

int main(){

	int n{4};
	float x{0};
	float pi{0};
	float conv{3.14159/180};

	while(true){
		cout << "N: " << n << '\n';


		x = (sin((360/n)*conv))/(sin(((180-360/n)/2)*conv));
	
		cout << "X: " << x << '\n';
		pi = (n*x)/2;
		cout << pi << '\n';

		std::this_thread::sleep_for(std::chrono::milliseconds(100));
		n++;
	}

	return 0;
}
