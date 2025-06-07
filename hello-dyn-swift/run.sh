#!/bin/bash

# Swift 动态加载四则运算器构建脚本

echo "=== 构建 Swift 计算器 ==="

# 编译 Swift 文件
swiftc -o calculator Calculator.swift DynamicLoader.swift main.swift

if [ $? -eq 0 ]; then
    echo "构建成功!"
    echo ""
    echo "=== 运行动态加载计算器 ==="
    ./calculator
else
    echo "构建失败!"
    exit 1
fi
