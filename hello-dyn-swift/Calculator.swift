import Foundation

// 计算器协议
protocol Calculator {
    func addFn(_ a: Double, _ b: Double) -> Double
    func subFn(_ a: Double, _ b: Double) -> Double
    func mulFn(_ a: Double, _ b: Double) -> Double
    func divFn(_ a: Double, _ b: Double) throws -> Double
}

// 计算器错误枚举
enum CalculatorError: Error {
    case divisionByZero

    var localizedDescription: String {
        switch self {
        case .divisionByZero:
            return "除数不能为零"
        }
    }
}

// 基础计算器实现
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
        if b == 0 {
            throw CalculatorError.divisionByZero
        }
        return a / b
    }
}

// 高级计算器实现
class AdvancedCalculator: Calculator {
    func addFn(_ a: Double, _ b: Double) -> Double {
        print(String(format: "[ADVANCED] 加法: %.2f + %.2f", a, b))
        return a + b
    }

    func subFn(_ a: Double, _ b: Double) -> Double {
        print(String(format: "[ADVANCED] 减法: %.2f - %.2f", a, b))
        return a - b
    }

    func mulFn(_ a: Double, _ b: Double) -> Double {
        print(String(format: "[ADVANCED] 乘法: %.2f * %.2f", a, b))
        return a * b
    }

    func divFn(_ a: Double, _ b: Double) throws -> Double {
        if b == 0 {
            throw CalculatorError.divisionByZero
        }
        print(String(format: "[ADVANCED] 除法: %.2f / %.2f", a, b))
        return a / b
    }

    // 额外功能
    func powFn(_ base: Double, _ exponent: Double) -> Double {
        return pow(base, exponent)
    }
}
