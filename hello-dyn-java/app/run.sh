#!/bin/bash

# Java 动态加载四则运算器构建和运行脚本 (Maven)

set -e

cd "$(dirname "$0")"

echo "=== 构建 Java Calculator Library ==="

# 构建和安装 lib 包
cd ../lib
mvn clean install -q

echo "=== 构建和运行 Java Calculator App ==="

# 构建和运行 app
cd ../app
mvn clean compile -q
mvn exec:java -q
