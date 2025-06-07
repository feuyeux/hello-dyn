#!/bin/bash

# Go 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")"

echo "=== 构建和运行 Go 计算器应用 ==="

# 下载和整理依赖
echo "整理依赖..."
go work sync

# 在 app 目录中构建应用
echo "构建应用..."
cd app
go mod tidy
go build -o calculator .

echo "应用构建成功!"
echo ""
echo "=== 运行动态加载计算器 ==="
./calculator
