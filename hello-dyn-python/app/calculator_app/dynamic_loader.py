import importlib
import sys
import os
from calculator_lib import Calculator, BasicCalculator, AdvancedCalculator


class DynamicCalculatorLoader:
    """动态计算器加载器"""

    def __init__(self):
        self.calculator = None

    def load_calculator(self, calculator_type):
        """动态加载计算器实现"""
        try:
            if calculator_type == "basic":
                self.calculator = BasicCalculator()
            elif calculator_type == "advanced":
                self.calculator = AdvancedCalculator()
            else:
                print(f"未知的计算器类型: {calculator_type}")
                return False

            print(f"成功加载计算器: {calculator_type}")
            return True

        except Exception as e:
            print(f"加载计算器失败: {e}")
            return False

    def get_calculator(self):
        """获取当前加载的计算器"""
        return self.calculator


def main():
    a, b = 8, 2
    calculators = [
        ("BasicCalculator", BasicCalculator()),
        ("AdvancedCalculator", AdvancedCalculator())
    ]
    for name, calculator in calculators:
        print(f"[LOG] Using {name}")
        print(f"[LOG] add: {a} + {b} = {calculator.addFn(a, b)}")
        print(f"[LOG] subtract: {a} - {b} = {calculator.subFn(a, b)}")
        print(f"[LOG] multiply: {a} * {b} = {calculator.mulFn(a, b)}")
        print(f"[LOG] divide: {a} / {b} = {calculator.divFn(a, b)}")
        # 幂运算只在高级计算器
        if hasattr(calculator, 'powFn'):
            print(f"[LOG] power: {a} ^ {b} = {calculator.powFn(a, b)}")


if __name__ == "__main__":
    main()
