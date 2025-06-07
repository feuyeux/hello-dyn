using System;

namespace DynamicCalculator
{
    // 基础计算器实现
    public class BasicCalculator : ICalculator
    {
        public double AddFn(double a, double b)
        {
            return a + b;
        }

        public double SubFn(double a, double b)
        {
            return a - b;
        }

        public double MulFn(double a, double b)
        {
            return a * b;
        }

        public double DivFn(double a, double b)
        {
            if (b == 0)
            {
                throw new CalculatorException("除数不能为零");
            }
            return a / b;
        }
    }

    // 高级计算器实现
    public class AdvancedCalculator : ICalculator
    {
        public double AddFn(double a, double b)
        {
            Console.WriteLine($"[ADVANCED] 加法: {a:F2} + {b:F2}");
            return a + b;
        }

        public double SubFn(double a, double b)
        {
            Console.WriteLine($"[ADVANCED] 减法: {a:F2} - {b:F2}");
            return a - b;
        }

        public double MulFn(double a, double b)
        {
            Console.WriteLine($"[ADVANCED] 乘法: {a:F2} * {b:F2}");
            return a * b;
        }

        public double DivFn(double a, double b)
        {
            if (b == 0)
            {
                throw new CalculatorException("除数不能为零");
            }
            Console.WriteLine($"[ADVANCED] 除法: {a:F2} / {b:F2}");
            return a / b;
        }

        // 额外功能
        public double PowFn(double baseValue, double exponent)
        {
            return Math.Pow(baseValue, exponent);
        }
    }
}
