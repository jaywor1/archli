#include <iostream>
#include <ctime>
#include <thread>
#include <chrono>
#include <string>

void progress_bar(double hodina, char symbol);

int main(){
	double hodina{10};
	progress_bar(hodina,'#');
	return 0;

}

