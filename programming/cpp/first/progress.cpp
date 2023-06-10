#include <iostream>
#include <ctime>
#include <thread>
#include <string>
#include <chrono>

void progress_bar(double hodina, char symbol){
	// Ints
	double i{0};
	double seconds{};

	// Strings
        std::string progress_bar="[--------------------------------------------------]";

	while(1){
        if(i/hodina==1){
                break;
        }

        i++;
        // Clear
        system("clear");
        std::cout << "i:" << i << '\n';
        std::cout << "hodina:" << hodina << '\n';
        std::cout << i/hodina << '\n';
        // Get time
        time_t t = time(0);
        struct tm* now = localtime(&t);

        seconds = (((now->tm_hour+2)*3600) + ((now->tm_min)*60) + now->tm_sec);

        if(seconds == 38781){
                std::cout << "Zvoni!!!\n";
        }
        if(i%((hodina/100)*2)==0){
                progress_bar[i/((hodina/100)*2)]=symbol;
        }

        // Write
        std::cout << progress_bar << ": " << (((i*100)/hodina)) << "%\n";

        // Sleep
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        }
}
