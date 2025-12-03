cmake_minimum_required(VERSION 3.10)
project(calculator_project LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

include_directories(${CMAKE_SOURCE_DIR}/include)

file(GLOB SRC_FILES "${CMAKE_SOURCE_DIR}/src/*.cpp")

add_library(calc STATIC src/add.cpp)
target_include_directories(calc PUBLIC ${CMAKE_SOURCE_DIR}/include)

add_executable(calc_app src/main.cpp)
target_link_libraries(calc_app PRIVATE calc)

