#!/usr/bin/env python3
"""
Python 动态加载四则运算器主程序
"""

import sys
from calculator_lib import Calculator, BasicCalculator, AdvancedCalculator
from .dynamic_loader import DynamicCalculatorLoader


def main():
    """主函数 - 直接运行计算器演示"""
    print("=== Python 动态加载四则运算器 ===")
    
    a, b = 8.0, 2.0
    
    # 直接实例化计算器实现
    calculators = [
        ("BasicCalculator", BasicCalculator()),
        ("AdvancedCalculator", AdvancedCalculator())
    ]
    
    for name, calculator in calculators:
        print(f"[LOG] Using {name}")
        print(f"[LOG] add: {a} + {b} = {calculator.addFn(a, b)}")
        print(f"[LOG] subtract: {a} - {b} = {calculator.subFn(a, b)}")
        print(f"[LOG] multiply: {a} * {b} = {calculator.mulFn(a, b)}")
        
        try:
            print(f"[LOG] divide: {a} / {b} = {calculator.divFn(a, b)}")
        except ZeroDivisionError as e:
            print(f"[LOG] divide: {a} / {b} = error: {e}")
        
        if isinstance(calculator, AdvancedCalculator):
            print(f"[LOG] power: {a} ^ {b} = {calculator.powFn(a, b)}")
        
        print()


if __name__ == "__main__":
    main()
