#!/bin/bash

echo "运行 Dart 动态计算器..."

# 确保 Dart SDK 已安装
if ! command -v dart &>/dev/null; then
    echo "错误: 未找到 Dart SDK。请先安装 Dart。"
    echo "访问 https://dart.dev/get-dart 了解安装说明"
    exit 1
fi

# 进入 Dart 项目目录
cd "$(dirname "$0")"

# 获取依赖
echo "获取依赖..."
dart pub get

# 运行程序
echo "启动程序..."
dart run bin/main.dart
