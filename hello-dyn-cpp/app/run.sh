#!/bin/bash

# C++ 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")"

echo "=== 构建 C++ Calculator Library ==="

# 构建 lib
cd ../lib

# 检查是否有CMake
if command -v cmake &> /dev/null; then
    echo "使用 CMake 构建..."
    mkdir -p build
    cd build
    cmake ..
    make -j$(nproc 2>/dev/null || echo 4)
    cd ..
else
    echo "使用 Makefile 构建..."
    make clean || true
    make
fi

echo "=== 构建和运行 C++ Calculator App ==="

# 构建 app  
cd ../app

# 检查是否有CMake
if command -v cmake &> /dev/null; then
    echo "使用 CMake 构建应用..."
    mkdir -p build
    cd build
    cmake ..
    make -j$(nproc 2>/dev/null || echo 4)
    
    echo ""
    echo "=== 运行动态加载计算器 ==="
    DYLD_LIBRARY_PATH=../../lib/build:../../lib ./calculator_loader
else
    echo "使用 g++ 直接编译应用..."
    g++ -std=c++11 -I../lib -L../lib -lcalculator -o calculator_loader main.cpp
    
    echo ""
    echo "=== 运行动态加载计算器 ==="
    DYLD_LIBRARY_PATH=../lib ./calculator_loader
fi
