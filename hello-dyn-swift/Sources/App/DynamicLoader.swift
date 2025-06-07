import Foundation
import Lib

// 动态计算器加载器
class DynamicCalculatorLoader {
    private var calculator: Calculator?

    // 动态加载计算器实现
    func loadCalculator(_ calculatorType: String) -> Bool {
        switch calculatorType {
        case "basic":
            calculator = BasicCalculator()
        case "advanced":
            calculator = AdvancedCalculator()
        default:
            print("无效的计算器类型: \(calculatorType)")
            return false
        }

        print("成功加载计算器: \(calculatorType)")
        return true
    }

    // 使用反射动态加载计算器（Swift 的反射能力有限）
    func loadCalculatorByReflection(_ className: String) -> Bool {
        // Swift 的反射能力有限，这里使用简单的字符串匹配
        switch className {
        case "BasicCalculator":
            calculator = BasicCalculator()
        case "AdvancedCalculator":
            calculator = AdvancedCalculator()
        default:
            print("无法找到类: \(className)")
            return false
        }
        
        print("成功通过反射加载计算器: \(className)")
        return true
    }

    // 使用类型信息动态创建实例
    func loadCalculatorByType<T: Calculator & DynamicCreatable>(_ type: T.Type) -> Bool {
        calculator = type.init()
        print("成功加载计算器: \(String(describing: type))")
        return true
    }

    // 获取当前加载的计算器
    func getCalculator() -> Calculator? {
        return calculator
    }
}

// 为了支持动态创建，需要让类符合这个协议
protocol DynamicCreatable {
    init()
}

extension BasicCalculator: DynamicCreatable {}
extension AdvancedCalculator: DynamicCreatable {}
