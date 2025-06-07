using System;
using System.Reflection;
using System.IO;

namespace DynamicCalculator
{
    // 动态加载器
    public class DynamicCalculatorLoader
    {
        private Assembly? assembly;

        public ICalculator? LoadCalculator(string calculatorType)
        {
            try
            {
                // 获取当前程序集
                assembly = Assembly.GetExecutingAssembly();

                string typeName = calculatorType switch
                {
                    "basic" => "DynamicCalculator.BasicCalculator",
                    "advanced" => "DynamicCalculator.AdvancedCalculator",
                    _ => throw new ArgumentException("无效的计算器类型")
                };

                // 动态获取类型
                Type? calculatorType_ = assembly.GetType(typeName);
                if (calculatorType_ == null)
                {
                    Console.WriteLine($"无法找到类型: {typeName}");
                    return null;
                }

                // 创建实例
                object? instance = Activator.CreateInstance(calculatorType_);
                if (instance is ICalculator calculator)
                {
                    Console.WriteLine($"成功加载计算器: {calculatorType}");
                    return calculator;
                }
                else
                {
                    Console.WriteLine("创建的实例不是有效的计算器");
                    return null;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"加载计算器失败: {ex.Message}");
                return null;
            }
        }

        // 也可以从外部程序集加载
        public ICalculator? LoadCalculatorFromAssembly(string assemblyPath, string typeName)
        {
            try
            {
                if (!File.Exists(assemblyPath))
                {
                    Console.WriteLine($"程序集文件不存在: {assemblyPath}");
                    return null;
                }

                // 加载程序集
                assembly = Assembly.LoadFrom(assemblyPath);

                // 动态获取类型
                Type? calculatorType = assembly.GetType(typeName);
                if (calculatorType == null)
                {
                    Console.WriteLine($"无法找到类型: {typeName}");
                    return null;
                }

                // 创建实例
                object? instance = Activator.CreateInstance(calculatorType);
                if (instance is ICalculator calculator)
                {
                    Console.WriteLine($"成功从程序集加载计算器: {typeName}");
                    return calculator;
                }
                else
                {
                    Console.WriteLine("创建的实例不是有效的计算器");
                    return null;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"从程序集加载计算器失败: {ex.Message}");
                return null;
            }
        }
    }
}
