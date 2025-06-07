using System;

namespace DynamicCalculator
{
    // 计算器接口
    public interface ICalculator
    {
        double AddFn(double a, double b);
        double SubFn(double a, double b);
        double MulFn(double a, double b);
        double DivFn(double a, double b);
    }

    // 计算器异常类
    public class CalculatorException : Exception
    {
        public CalculatorException(string message) : base(message) { }
    }
}
