#!/bin/bash

echo "运行 Kotlin 动态计算器..."

# 确保 Java 和 Gradle 已安装
if ! command -v java &>/dev/null; then
    echo "错误: 未找到 Java JDK。请先安装 Java 11 或更高版本。"
    exit 1
fi

if ! command -v gradle &>/dev/null; then
    echo "错误: 未找到 Gradle。请先安装 Gradle。"
    echo "Gradle 安装: https://gradle.org/install/"
    exit 1
fi

# 进入 Kotlin 项目目录
cd "$(dirname "$0")"

echo "使用系统 Gradle 构建和运行..."
gradle run
