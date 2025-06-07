#!/bin/bash

# Go 动态加载四则运算器构建脚本

cd "$(dirname "$0")"

echo "=== 构建 Go 计算器 ==="

# 构建项目，假设 main.go 和 loader.go 在 app/，calculator.go 在 ../lib/
go build -o calculator main.go loader.go

if [ $? -eq 0 ]; then
    echo "构建成功!"
    echo ""
    echo "=== 运行动态加载计算器 ==="
    ./calculator
else
    echo "构建失败!"
    exit 1
fi
