package com.hellodyn.app;

import com.hellodyn.calculator.Calculator;
import com.hellodyn.calculator.BasicCalculator;
import com.hellodyn.calculator.AdvancedCalculator;

// 动态加载器和主程序
public class DynamicCalculatorLoader {
    
    public static void main(String[] args) {
        System.out.println("=== Java 动态加载四则运算器 ===");
        
        double a = 8, b = 2;
        
        // 直接实例化计算器实现
        Calculator[] calculators = new Calculator[2];
        calculators[0] = new BasicCalculator();
        calculators[1] = new AdvancedCalculator();
        
        String[] names = {"BasicCalculator", "AdvancedCalculator"};
        
        for (int i = 0; i < calculators.length; i++) {
            Calculator calculator = calculators[i];
            String name = names[i];
            
            System.out.println("[LOG] Using " + name);
            System.out.println("[LOG] add: " + a + " + " + b + " = " + calculator.addFn(a, b));
            System.out.println("[LOG] subtract: " + a + " - " + b + " = " + calculator.subFn(a, b));
            System.out.println("[LOG] multiply: " + a + " * " + b + " = " + calculator.mulFn(a, b));
            
            try {
                System.out.println("[LOG] divide: " + a + " / " + b + " = " + calculator.divFn(a, b));
            } catch (ArithmeticException e) {
                System.out.println("[LOG] divide: " + a + " / " + b + " = error: " + e.getMessage());
            }
            
            if (calculator instanceof AdvancedCalculator) {
                System.out.println("[LOG] power: " + a + " ^ " + b + " = " + ((AdvancedCalculator)calculator).powFn(a, b));
            }
            
            System.out.println();
        }
    }
}
