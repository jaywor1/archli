#include <iostream>

#include "io.h"

int readNumber(){
        int x{};
        std::cout << "Write an integer: ";
        std::cin >> x;
        return x;
}

void writeAnswer(int x){
        std::cout << "Answer: "<<x<<'\n';
}

