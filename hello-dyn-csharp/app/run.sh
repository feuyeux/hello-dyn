#!/bin/bash

# C# 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")"

echo "=== C# 动态加载四则运算器 ==="

echo "=== 构建 C# Calculator Library ==="

# 构建库
cd ../lib
dotnet clean
dotnet build

echo "=== 构建和运行 C# Calculator App ==="

# 构建和运行应用
cd ../app
dotnet clean
dotnet build

echo "=== 运行动态加载计算器 ==="
# 尝试使用dll文件运行
dotnet bin/Debug/net9.0/HelloDyn.Calculator.App.dll
