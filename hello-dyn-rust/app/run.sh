#!/bin/bash

# Rust 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")"

echo "=== 构建和运行 Rust Calculator App ==="

# 直接在app目录下构建和运行
cargo run
