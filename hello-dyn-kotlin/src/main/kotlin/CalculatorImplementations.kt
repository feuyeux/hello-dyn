import kotlin.math.pow

// 基础计算器实现
class BasicCalculator : Calculator {
    override fun addFn(a: Double, b: Double): Double = a + b

    override fun subFn(a: Double, b: Double): Double = a - b

    override fun mulFn(a: Double, b: Double): Double = a * b

    override fun divFn(a: Double, b: Double): Double {
        if (b == 0.0) {
            throw CalculatorException("除数不能为零")
        }
        return a / b
    }
}

// 高级计算器实现
class AdvancedCalculator : Calculator {
    override fun addFn(a: Double, b: Double): Double {
        println("[ADVANCED] 加法: ${"%.2f".format(a)} + ${"%.2f".format(b)}")
        return a + b
    }

    override fun subFn(a: Double, b: Double): Double {
        println("[ADVANCED] 减法: ${"%.2f".format(a)} - ${"%.2f".format(b)}")
        return a - b
    }

    override fun mulFn(a: Double, b: Double): Double {
        println("[ADVANCED] 乘法: ${"%.2f".format(a)} * ${"%.2f".format(b)}")
        return a * b
    }

    override fun divFn(a: Double, b: Double): Double {
        println("[ADVANCED] 除法: ${"%.2f".format(a)} / ${"%.2f".format(b)}")
        if (b == 0.0) {
            throw CalculatorException("除数不能为零")
        }
        return a / b
    }

    // 高级功能：幂运算
    fun powFn(base: Double, exponent: Double): Double {
        println("[ADVANCED] 幂运算: ${"%.2f".format(base)} ^ ${"%.2f".format(exponent)}")
        return base.pow(exponent)
    }
}

// 科学计算器实现
class ScientificCalculator : Calculator {
    override fun addFn(a: Double, b: Double): Double {
        println("[SCIENTIFIC] 加法: ${"%.2f".format(a)} + ${"%.2f".format(b)}")
        return a + b
    }

    override fun subFn(a: Double, b: Double): Double {
        println("[SCIENTIFIC] 减法: ${"%.2f".format(a)} - ${"%.2f".format(b)}")
        return a - b
    }

    override fun mulFn(a: Double, b: Double): Double {
        println("[SCIENTIFIC] 乘法: ${"%.2f".format(a)} * ${"%.2f".format(b)}")
        return a * b
    }

    override fun divFn(a: Double, b: Double): Double {
        println("[SCIENTIFIC] 除法: ${"%.2f".format(a)} / ${"%.2f".format(b)}")
        if (b == 0.0) {
            throw CalculatorException("除数不能为零")
        }
        return a / b
    }

    // 科学功能
    fun sin(x: Double): Double = kotlin.math.sin(x)
    fun cos(x: Double): Double = kotlin.math.cos(x)
    fun tan(x: Double): Double = kotlin.math.tan(x)
    fun log(x: Double): Double = kotlin.math.ln(x)
    fun exp(x: Double): Double = kotlin.math.exp(x)
}
