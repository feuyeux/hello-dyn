import 'calculator.dart';
import 'dart:math' as math;

// 基础计算器实现
class BasicCalculator implements Calculator {
  @override
  double addFn(double a, double b) {
    return a + b;
  }

  @override
  double subFn(double a, double b) {
    return a - b;
  }

  @override
  double mulFn(double a, double b) {
    return a * b;
  }

  @override
  double divFn(double a, double b) {
    if (b == 0) {
      throw const CalculatorException('除数不能为零');
    }
    return a / b;
  }
}

// 高级计算器实现
class AdvancedCalculator implements Calculator {
  @override
  double addFn(double a, double b) {
    print('[ADVANCED] 加法: ${a.toStringAsFixed(2)} + ${b.toStringAsFixed(2)}');
    return a + b;
  }

  @override
  double subFn(double a, double b) {
    print('[ADVANCED] 减法: ${a.toStringAsFixed(2)} - ${b.toStringAsFixed(2)}');
    return a - b;
  }

  @override
  double mulFn(double a, double b) {
    print('[ADVANCED] 乘法: ${a.toStringAsFixed(2)} * ${b.toStringAsFixed(2)}');
    return a * b;
  }

  @override
  double divFn(double a, double b) {
    if (b == 0) {
      throw const CalculatorException('除数不能为零');
    }
    print('[ADVANCED] 除法: ${a.toStringAsFixed(2)} / ${b.toStringAsFixed(2)}');
    return a / b;
  }

  // 额外功能
  double powFn(double base, double exponent) {
    return math.pow(base, exponent).toDouble();
  }
}
