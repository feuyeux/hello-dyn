#!/bin/bash

# Go 动态加载四则运算器构建脚本

echo "=== 构建 Go 计算器 ==="

# 初始化模块（如果需要）
go mod tidy

# 构建项目
go build -o calculator .

if [ $? -eq 0 ]; then
    echo "构建成功!"
    echo ""
    echo "=== 运行动态加载计算器 ==="
    ./calculator
else
    echo "构建失败!"
    exit 1
fi
