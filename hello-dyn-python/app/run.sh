#!/bin/bash

# Python 动态加载四则运算器运行脚本

set -e

cd "$(dirname "$0")"

echo "=== 安装 Python Calculator Library ==="

# 安装本地库包
pip install -e ../lib

echo "=== 运行 Python Calculator App ==="

# 运行Python应用
python3 -m calculator_app.main
