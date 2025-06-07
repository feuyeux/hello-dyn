#!/bin/bash

# TypeScript 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")"

echo "=== 构建 TypeScript Calculator Library ==="

# 构建库
cd ../lib
npm run build

echo "=== 安装和构建 TypeScript Calculator App ==="

# 安装依赖并构建应用
cd ../app
npm install
npm run build

echo "=== 运行 TypeScript Calculator App ==="

# 运行应用
npm start
npm install

if [ $? -ne 0 ]; then
    echo "依赖安装失败!"
    exit 1
fi

# 编译 TypeScript
echo "编译 TypeScript..."
npm run build

if [ $? -eq 0 ]; then
    echo "构建成功!"
    echo ""
    echo "=== 运行动态加载计算器 ==="
    npm start
else
    echo "构建失败!"
    exit 1
fi
