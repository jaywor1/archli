#include <iostream>

using std::cout;
long long devisors_count(long long num){
	long long sol{1};
	for(int i = 1; i < num; i++){
		if(num%i==0)
			++sol;
	}
	return sol;
}


int main(){
	long long num{0};
	long long devisors{0};

	for(int i = 0; devisors < 500;i++){
		num+=i;
		devisors = devisors_count(num);
	}
	cout << num << '\n';
	return 0;
}
