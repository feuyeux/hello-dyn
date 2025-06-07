from calculator_base import Calculator
import math


class AdvancedCalculator(Calculator):
    """高级计算器实现"""

    def addFn(self, a, b):
        print(f"[ADVANCED] 加法: {a:.2f} + {b:.2f}")
        return a + b

    def subFn(self, a, b):
        print(f"[ADVANCED] 减法: {a:.2f} - {b:.2f}")
        return a - b

    def mulFn(self, a, b):
        print(f"[ADVANCED] 乘法: {a:.2f} * {b:.2f}")
        return a * b

    def divFn(self, a, b):
        if b == 0:
            raise ValueError("除数不能为零")
        print(f"[ADVANCED] 除法: {a:.2f} / {b:.2f}")
        return a / b

    def powFn(self, base, exponent):
        """幂运算"""
        return math.pow(base, exponent)
