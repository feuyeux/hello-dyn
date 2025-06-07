#!/bin/bash

# C++ 动态加载四则运算器构建脚本

echo "=== 构建 C++ 计算器 ==="

# 使用 make 构建
make clean
make

if [ $? -eq 0 ]; then
    echo "构建成功!"
    echo ""
    echo "=== 运行动态加载计算器 ==="
    make run
else
    echo "构建失败!"
    exit 1
fi
