#!/bin/bash

# 多语言动态加载四则运算器总运行脚本

echo "=== 多语言动态加载四则运算器 ==="
echo ""
echo "选择要运行的语言实现:"
echo "1. Java"
echo "2. Python"
echo "3. Rust"
echo "4. C++"
echo "5. C#"
echo "6. Go"
echo "7. Swift"
echo "8. TypeScript"
echo "9. Dart"
echo "10. Kotlin"
echo "0. 退出"
echo ""

while true; do
    read -p "请输入选择 (0-10): " choice

    case $choice in
    1)
        echo ""
        echo "=== 运行 Java 实现 ==="
        cd hello-dyn-java && ./run.sh
        break
        ;;
    2)
        echo ""
        echo "=== 运行 Python 实现 ==="
        cd hello-dyn-python && ./run.sh
        break
        ;;
    3)
        echo ""
        echo "=== 运行 Rust 实现 ==="
        cd hello-dyn-rust && ./run.sh
        break
        ;;
    4)
        echo ""
        echo "=== 运行 C++ 实现 ==="
        cd hello-dyn-cpp && ./run.sh
        break
        ;;
    5)
        echo ""
        echo "=== 运行 C# 实现 ==="
        cd hello-dyn-csharp && ./run.sh
        break
        ;;
    6)
        echo ""
        echo "=== 运行 Go 实现 ==="
        cd hello-dyn-go && ./run.sh
        break
        ;;
    7)
        echo ""
        echo "=== 运行 Swift 实现 ==="
        cd hello-dyn-swift && ./run.sh
        break
        ;;
    8)
        echo ""
        echo "=== 运行 TypeScript 实现 ==="
        cd hello-dyn-typescript && ./run.sh
        break
        ;;
    9)
        echo ""
        echo "=== 运行 Dart 实现 ==="
        cd hello-dyn-dart && ./run.sh
        break
        ;;
    10)
        echo ""
        echo "=== 运行 Kotlin 实现 ==="
        cd hello-dyn-kotlin && ./run.sh
        break
        ;;
    0)
        echo "退出"
        exit 0
        ;;
    *)
        echo "无效的选择，请重新输入"
        ;;
    esac
done
