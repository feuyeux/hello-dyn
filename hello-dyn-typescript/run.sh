#!/bin/bash

# TypeScript 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")"

echo "=== 构建和安装 TypeScript 计算器库和应用 ==="

# 首先构建 lib
echo "构建库..."
cd lib
npm install
npm run build

# 然后构建 app
echo "构建应用..."
cd ../app
npm install
npm run build

echo "库和应用构建成功!"
echo ""
echo "=== 运行动态加载计算器 ==="
npm start
