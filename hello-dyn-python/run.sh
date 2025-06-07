#!/bin/bash

# Python 动态加载四则运算器构建和运行脚本

set -e

cd "$(dirname "$0")"

echo "=== Python 动态加载四则运算器 ==="

# 创建虚拟环境（如果不存在）
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# 激活虚拟环境
echo "Activating virtual environment..."
source venv/bin/activate

echo "=== 构建和安装 Python 计算器库和应用 ==="

# 首先安装 lib
echo "安装库..."
cd lib
pip install -e .

# 然后安装 app
echo "安装应用..."
cd ../app
pip install -e .

echo "库和应用安装成功!"
echo ""
echo "=== 运行动态加载计算器 ==="
python -m calculator_app.main

echo ""
echo "To deactivate virtual environment, run: deactivate"
