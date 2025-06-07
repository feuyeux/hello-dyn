#!/bin/bash

# Dart 动态加载四则运算器运行脚本

set -e

cd "$(dirname "$0")"

echo "=== 运行 Dart Calculator App ==="

# 回到项目根目录运行
cd ..
dart run bin/main.dart
