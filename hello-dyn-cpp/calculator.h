#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <stdexcept>

// 计算器抽象基类
class Calculator
{
public:
    virtual ~Calculator() = default;
    virtual double addFn(double a, double b) = 0;
    virtual double subFn(double a, double b) = 0;
    virtual double mulFn(double a, double b) = 0;
    virtual double divFn(double a, double b) = 0;
};

// 计算器异常类
class CalculatorException : public std::runtime_error
{
public:
    explicit CalculatorException(const std::string &message)
        : std::runtime_error(message) {}
};

#endif // CALCULATOR_H
