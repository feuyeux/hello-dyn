#!/bin/bash

# Rust 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")"

echo "=== 构建 Rust 计算器库和应用 ==="

# 构建整个工作空间
echo "构建工作空间..."
cargo build

echo "库和应用构建成功!"
echo ""
echo "=== 运行动态加载计算器 ==="
cd app
cargo run
