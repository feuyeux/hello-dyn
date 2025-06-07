#!/bin/bash

# TypeScript 开发模式运行脚本 (使用 ts-node)

echo "=== 开发模式运行 TypeScript 计算器 ==="

# 检查依赖是否已安装
if [ ! -d "node_modules" ]; then
    echo "安装依赖..."
    npm install
fi

# 使用 ts-node 直接运行 TypeScript
npm run dev
