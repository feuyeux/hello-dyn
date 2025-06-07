fun main() {
    val a = 8.0
    val b = 2.0
    val calculators = listOf(
        "BasicCalculator" to BasicCalculator(),
        "AdvancedCalculator" to AdvancedCalculator()
    )
    for ((name, calculator) in calculators) {
        println("[LOG] Using $name")
        println("[LOG] add: $a + $b = ${calculator.addFn(a, b)}")
        println("[LOG] subtract: $a - $b = ${calculator.subFn(a, b)}")
        println("[LOG] multiply: $a * $b = ${calculator.mulFn(a, b)}")
        println("[LOG] divide: $a / $b = ${calculator.divFn(a, b)}")
        if (calculator is AdvancedCalculator) {
            println("[LOG] power: $a ^ $b = ${calculator.powFn(a, b)}")
        }
    }
}
