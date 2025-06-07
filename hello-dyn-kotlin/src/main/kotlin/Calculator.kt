// 计算器接口
interface Calculator {
    fun addFn(a: Double, b: Double): Double
    fun subFn(a: Double, b: Double): Double
    fun mulFn(a: Double, b: Double): Double
    fun divFn(a: Double, b: Double): Double
}

// 计算器异常类
class CalculatorException(message: String) : Exception(message)
