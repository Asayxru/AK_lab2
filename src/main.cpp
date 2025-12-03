#include <iostream>
#include "calc.h"

int main(int argc, char** argv) {
    int x = 2, y = 3;
    if (argc >= 3) {
        x = std::stoi(argv[1]);
        y = std::stoi(argv[2]);
    }
    std::cout << "add(" << x << ", " << y << ") = " << add(x,y) << std::endl;
    return 0;
}

