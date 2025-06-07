#include "calculator.h"
#include <iostream>
#include <cmath>

// 基础计算器实现
class BasicCalculator : public Calculator
{
public:
    double addFn(double a, double b) override
    {
        return a + b;
    }

    double subFn(double a, double b) override
    {
        return a - b;
    }

    double mulFn(double a, double b) override
    {
        return a * b;
    }

    double divFn(double a, double b) override
    {
        if (b == 0)
        {
            throw CalculatorException("除数不能为零");
        }
        return a / b;
    }
};

// 高级计算器实现
class AdvancedCalculator : public Calculator
{
public:
    double addFn(double a, double b) override
    {
        printf("[ADVANCED] 加法: %.2f + %.2f\n", a, b);
        return a + b;
    }

    double subFn(double a, double b) override
    {
        printf("[ADVANCED] 减法: %.2f - %.2f\n", a, b);
        return a - b;
    }

    double mulFn(double a, double b) override
    {
        printf("[ADVANCED] 乘法: %.2f * %.2f\n", a, b);
        return a * b;
    }

    double divFn(double a, double b) override
    {
        if (b == 0)
        {
            throw CalculatorException("除数不能为零");
        }
        printf("[ADVANCED] 除法: %.2f / %.2f\n", a, b);
        return a / b;
    }

    // 额外功能
    double powFn(double base, double exponent)
    {
        return std::pow(base, exponent);
    }
};

// C 接口，用于动态加载
extern "C"
{
    Calculator *create_basic_calculator()
    {
        return new BasicCalculator();
    }

    Calculator *create_advanced_calculator()
    {
        return new AdvancedCalculator();
    }

    void destroy_calculator(Calculator *calc)
    {
        delete calc;
    }

    double calculator_add_fn(Calculator *calc, double a, double b)
    {
        return calc->addFn(a, b);
    }

    double calculator_sub_fn(Calculator *calc, double a, double b)
    {
        return calc->subFn(a, b);
    }

    double calculator_mul_fn(Calculator *calc, double a, double b)
    {
        return calc->mulFn(a, b);
    }

    double calculator_div_fn(Calculator *calc, double a, double b)
    {
        try
        {
            return calc->divFn(a, b);
        }
        catch (const CalculatorException &)
        {
            return std::numeric_limits<double>::quiet_NaN();
        }
    }
}
