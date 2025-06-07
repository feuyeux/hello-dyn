// 计算器抽象基类
abstract class Calculator {
  double addFn(double a, double b);
  double subFn(double a, double b);
  double mulFn(double a, double b);
  double divFn(double a, double b);
}

// 计算器异常类
class CalculatorException implements Exception {
  final String message;
  
  const CalculatorException(this.message);
  
  @override
  String toString() => 'CalculatorException: $message';
}
