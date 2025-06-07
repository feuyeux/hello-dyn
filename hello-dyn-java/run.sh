#!/bin/bash

# Java 动态加载四则运算器构建脚本

echo "=== 编译 Java 计算器 ==="

# 编译所有 Java 文件
javac *.java

if [ $? -eq 0 ]; then
    echo "编译成功!"
    echo ""
    echo "=== 运行动态加载计算器 ==="
    java DynamicCalculatorLoader
else
    echo "编译失败!"
    exit 1
fi
