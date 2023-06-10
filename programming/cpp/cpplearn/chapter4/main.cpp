#include <iostream>

void varsSize(){
	std::cout << "bool:\t\t" << sizeof(bool) << " bytes\n";
    	std::cout << "char:\t\t" << sizeof(char) << " bytes\n";
    	std::cout << "wchar_t:\t" << sizeof(wchar_t) << " bytes\n";
    	std::cout << "char16_t:\t" << sizeof(char16_t) << " bytes\n";
    	std::cout << "char32_t:\t" << sizeof(char32_t) << " bytes\n";
    	std::cout << "short:\t\t" << sizeof(short) << " bytes\n";
    	std::cout << "int:\t\t" << sizeof(int) << " bytes\n";
    	std::cout << "long:\t\t" << sizeof(long) << " bytes\n";
    	std::cout << "long long:\t" << sizeof(long long) << " bytes\n";
    	std::cout << "float:\t\t" << sizeof(float) << " bytes\n";
    	std::cout << "double:\t\t" << sizeof(double) << " bytes\n";
    	std::cout << "long double:\t" << sizeof(long double) << " bytes\n";
}




int main(){

	unsigned long long num {0};

	while(num < 18446744073709551615){
		num=num+9999999999999;
		std::cout << "num: \t"<<num << '\n';
	}

	varsSize();
	return 0;
}
