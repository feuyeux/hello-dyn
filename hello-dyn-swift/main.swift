import Foundation

// 定义 CalculatorError 枚举
enum CalculatorError: Error {
    case divisionByZero
    case invalidInput
    case calculationFailed
}

// 定义 Calculator 协议
protocol Calculator {
    func addFn(_ a: Double, _ b: Double) -> Double
    func subFn(_ a: Double, _ b: Double) -> Double
    func mulFn(_ a: Double, _ b: Double) -> Double
    func divFn(_ a: Double, _ b: Double) throws -> Double
}

// 定义基础计算器 BasicCalculator
class BasicCalculator: Calculator {
    func addFn(_ a: Double, _ b: Double) -> Double {
        return a + b
    }

    func subFn(_ a: Double, _ b: Double) -> Double {
        return a - b
    }

    func mulFn(_ a: Double, _ b: Double) -> Double {
        return a * b
    }

    func divFn(_ a: Double, _ b: Double) throws -> Double {
        guard b != 0 else {
            throw CalculatorError.divisionByZero
        }
        return a / b
    }
}

// 定义高级计算器 AdvancedCalculator
class AdvancedCalculator: BasicCalculator {
    func powFn(_ a: Double, _ b: Double) -> Double {
        return pow(a, b)
    }
}

// 动态计算器加载器
class DynamicCalculatorLoader {
    private var calculator: Calculator?

    // 根据名称加载计算器
    func loadCalculator(_ name: String) -> Bool {
        switch name {
        case "basic":
            calculator = BasicCalculator()
            return true
        case "advanced":
            calculator = AdvancedCalculator()
            return true
        default:
            return false
        }
    }

    // 根据类型加载计算器
    func loadCalculatorByType<T: Calculator>(_ type: T.Type) -> Bool {
        calculator = type.init()
        return true
    }

    // 获取当前加载的计算器
    func getCalculator() -> Calculator? {
        return calculator
    }
}

// 主程序入口
let a = 8.0, b = 2.0
let calculators: [(String, Calculator)] = [
    ("BasicCalculator", BasicCalculator()),
    ("AdvancedCalculator", AdvancedCalculator())
]
for (name, calculator) in calculators {
    print("[LOG] Using \(name)")
    print("[LOG] add: \(a) + \(b) = \(calculator.addFn(a, b))")
    print("[LOG] subtract: \(a) - \(b) = \(calculator.subFn(a, b))")
    print("[LOG] multiply: \(a) * \(b) = \(calculator.mulFn(a, b))")
    do {
        let divResult = try calculator.divFn(a, b)
        print("[LOG] divide: \(a) / \(b) = \(divResult)")
    } catch {
        print("[LOG] divide: \(a) / \(b) = error: \(error)")
    }
    if let adv = calculator as? AdvancedCalculator {
        print("[LOG] power: \(a) ^ \(b) = \(adv.powFn(a, b))")
    }
}
