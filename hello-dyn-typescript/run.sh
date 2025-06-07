#!/bin/bash

# TypeScript 动态加载四则运算器构建脚本

echo "=== 构建 TypeScript 计算器 ==="

# 检查 Node.js 是否安装
if ! command -v node &>/dev/null; then
    echo "错误: Node.js 未安装"
    exit 1
fi

# 检查 npm 是否安装
if ! command -v npm &>/dev/null; then
    echo "错误: npm 未安装"
    exit 1
fi

# 安装依赖
echo "安装依赖..."
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
