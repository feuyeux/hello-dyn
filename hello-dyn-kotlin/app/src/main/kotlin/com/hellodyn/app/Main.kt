package com.hellodyn.app

import com.hellodyn.calculator.BasicCalculator
import com.hellodyn.calculator.AdvancedCalculator

fun main() {
    println("=== Kotlin 动态加载四则运算器 ===")
    
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
        
        try {
            println("[LOG] divide: $a / $b = ${calculator.divFn(a, b)}")
        } catch (e: Exception) {
            println("[LOG] divide: $a / $b = error: ${e.message}")
        }
        
        if (calculator is AdvancedCalculator) {
            println("[LOG] power: $a ^ $b = ${calculator.powFn(a, b)}")
        }
        
        println()
    }
}
