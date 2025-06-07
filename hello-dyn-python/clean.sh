#!/bin/bash

# Python 清理脚本

cd "$(dirname "$0")"

echo "=== 清理Python虚拟环境 ==="

# 删除虚拟环境
if [ -d "venv" ]; then
    echo "Removing virtual environment..."
    rm -rf venv
    echo "Virtual environment removed."
else
    echo "No virtual environment found."
fi

echo "Cleanup complete!"
