#!/bin/bash

# Kotlin 动态加载四则运算器构建和运行脚本 (Gradle)

set -e

cd "$(dirname "$0")/.."

echo "=== 构建和运行 Kotlin Calculator ==="

# 使用 Gradle 构建和运行
gradle :app:run
