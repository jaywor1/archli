#include <iostream>
#include <vector>

int main(){
	std::vector<int> primes;
	int length{0};
	int num{2};
	bool con = false;
	for(int y = 0; length < 1000002;y++){
		con = false;
		length = primes.size();
		for(int i = 0; i < length;i++){
			if(num%primes[i] == 0){
				con = true;
				num++;
				break;
			}
		}
		if(con)
			continue;
		//std::cout << length + 1 << ": " << num << '\n';
		primes.push_back(num);
		if(num == 40){
			break;
		}
	}

	std::cout << primes[primes.size()-1] << "|||" << primes[primes.size()-2] << '\n';
	//for(int i = 0; i < primes.size();i++){
	//	std::cout << primes[i] << '\n';
	//}
}
