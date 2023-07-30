#include <iostream>

using std::cout;

int main(){

	long long steps{0};
	long long temp{0};
	long long sol{0};




	for(int i = 1; i< 1000001; i++){
		temp = i;
		steps = 0;
		while(temp != 1){
			//cout << temp << " -> ";
			if((temp%2) == 0)
				temp /= 2;
			else
				temp = 3*temp + 1;
			++steps;
		}
		if(sol<steps)
			sol = temp;
		cout << i <<'\n';
	}
	cout << "Solution: " << sol << '\n';
	return 0;
}
