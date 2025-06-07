import importlib
import sys
import os


class DynamicCalculatorLoader:
    """动态计算器加载器"""

    def __init__(self):
        self.calculator = None

    def load_calculator(self, calculator_type):
        """动态加载计算器实现"""
        try:
            module_name = f"{calculator_type}_calculator"
            class_name = f"{''.join(word.capitalize() for word in calculator_type.split('_'))}Calculator"

            # 动态导入模块
            module = importlib.import_module(module_name)

            # 获取类
            calculator_class = getattr(module, class_name)

            # 创建实例
            self.calculator = calculator_class()

            print(f"成功加载计算器: {class_name}")
            return True

        except Exception as e:
            print(f"加载计算器失败: {e}")
            return False

    def get_calculator(self):
        """获取当前加载的计算器"""
        return self.calculator


def main():
    a, b = 8, 2
    # 自动加载基础和高级计算器，分别演示
    from basic_calculator import BasicCalculator
    from advanced_calculator import AdvancedCalculator
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
