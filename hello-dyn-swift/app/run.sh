#!/bin/bash

# Swift 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")/.."

echo "=== 构建和运行 Swift Calculator ==="

# 使用 Swift Package Manager 构建和运行
swift run calculator
