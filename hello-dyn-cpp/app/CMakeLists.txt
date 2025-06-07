cmake_minimum_required(VERSION 3.15)
project(calculator-app VERSION 1.0.0)

# C++ 标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 查找计算器库
find_package(calculator REQUIRED HINTS ../lib/build)

# 创建可执行文件
add_executable(calculator_loader main.cpp)

# 链接库
target_link_libraries(calculator_loader calculator::calculator)

# 如果不能找到库，则尝试从本地路径链接
if(NOT calculator_FOUND)
    target_include_directories(calculator_loader PRIVATE ../lib)
    target_link_libraries(calculator_loader ${CMAKE_SOURCE_DIR}/../lib/build/libcalculator.dylib)
endif()
