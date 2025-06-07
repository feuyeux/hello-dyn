// 动态加载器
import 'calculator.dart';
import 'calculator_implementations.dart';

// 动态加载器类
class DynamicCalculatorLoader {
  static final Map<String, Function> _calculatorFactory = {
    'basic': () => BasicCalculator(),
    'advanced': () => AdvancedCalculator(),
  };

  // 使用工厂模式动态创建计算器
  static Calculator? createCalculator(String type) {
    try {
      final factory = _calculatorFactory[type.toLowerCase()];
      if (factory != null) {
        return factory() as Calculator;
      }
      return null;
    } catch (e) {
      print('创建计算器失败: $e');
      return null;
    }
  }

  // 获取可用的计算器类型
  static List<String> getAvailableTypes() {
    return _calculatorFactory.keys.toList();
  }

  // 注册新的计算器类型
  static void registerCalculator(String type, Function factory) {
    _calculatorFactory[type] = factory;
  }
}

// 计算器插件接口
abstract class CalculatorPlugin {
  String get name;
  Calculator createCalculator();
}

// 示例插件
class ScientificCalculatorPlugin implements CalculatorPlugin {
  @override
  String get name => 'scientific';

  @override
  Calculator createCalculator() {
    return AdvancedCalculator(); // 可以返回更复杂的科学计算器
  }
}
