using System;
using HelloDyn.Calculator.Lib;

namespace HelloDyn.Calculator.App
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("=== C# 动态加载四则运算器 ===");
            
            double a = 8, b = 2;
            var calculators = new (string Name, ICalculator Calculator, Func<double, double, double>? PowFn)[]
            {
                ("BasicCalculator", new BasicCalculator(), null),
                ("AdvancedCalculator", new AdvancedCalculator(), (x, y) => new AdvancedCalculator().PowFn(x, y))
            };
            
            foreach (var entry in calculators)
            {
                Console.WriteLine($"[LOG] Using {entry.Name}");
                Console.WriteLine($"[LOG] add: {a} + {b} = {entry.Calculator.AddFn(a, b)}");
                Console.WriteLine($"[LOG] subtract: {a} - {b} = {entry.Calculator.SubFn(a, b)}");
                Console.WriteLine($"[LOG] multiply: {a} * {b} = {entry.Calculator.MulFn(a, b)}");
                Console.WriteLine($"[LOG] divide: {a} / {b} = {entry.Calculator.DivFn(a, b)}");
                if (entry.PowFn != null)
                {
                    Console.WriteLine($"[LOG] power: {a} ^ {b} = {entry.PowFn(a, b)}");
                }
                Console.WriteLine();
            }
        }
    }
}
