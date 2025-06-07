# 计算器基类
class Calculator:
    def addFn(self, a, b):
        raise NotImplementedError("子类必须实现加法")

    def subFn(self, a, b):
        raise NotImplementedError("子类必须实现减法")

    def mulFn(self, a, b):
        raise NotImplementedError("子类必须实现乘法")

    def divFn(self, a, b):
        raise NotImplementedError("子类必须实现除法")
