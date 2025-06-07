#!/bin/bash

# Rust 动态加载四则运算器构建脚本

echo "=== 构建 Rust 计算器库 ==="

# 构建动态库
cargo build

if [ $? -eq 0 ]; then
    echo "库构建成功!"

    echo ""
    echo "=== 运行动态加载计算器 ==="
    cargo run
else
    echo "构建失败!"
    exit 1
fi
