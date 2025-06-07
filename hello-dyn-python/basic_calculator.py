from calculator_base import Calculator


class BasicCalculator(Calculator):
    """基础计算器实现"""

    def addFn(self, a, b):
        return a + b

    def subFn(self, a, b):
        return a - b

    def mulFn(self, a, b):
        return a * b

    def divFn(self, a, b):
        if b == 0:
            raise ValueError("除数不能为零")
        return a / b
