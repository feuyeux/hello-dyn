package main

import (
	"fmt"
)

// Calculator 计算器接口
type Calculator interface {
	AddFn(a, b float64) float64
	SubFn(a, b float64) float64
	MulFn(a, b float64) float64
	DivFn(a, b float64) (float64, error)
}

// CalculatorError 计算器错误类型
type CalculatorError struct {
	Message string
}

func (e *CalculatorError) Error() string {
	return e.Message
}

// BasicCalculator 基础计算器实现
type BasicCalculator struct{}

func (c *BasicCalculator) AddFn(a, b float64) float64 {
	return a + b
}

func (c *BasicCalculator) SubFn(a, b float64) float64 {
	return a - b
}

func (c *BasicCalculator) MulFn(a, b float64) float64 {
	return a * b
}

func (c *BasicCalculator) DivFn(a, b float64) (float64, error) {
	if b == 0 {
		return 0, &CalculatorError{Message: "除数不能为零"}
	}
	return a / b, nil
}

// AdvancedCalculator 高级计算器实现
type AdvancedCalculator struct{}

func (c *AdvancedCalculator) AddFn(a, b float64) float64 {
	fmt.Printf("[ADVANCED] 加法: %.2f + %.2f\n", a, b)
	return a + b
}

func (c *AdvancedCalculator) SubFn(a, b float64) float64 {
	fmt.Printf("[ADVANCED] 减法: %.2f - %.2f\n", a, b)
	return a - b
}

func (c *AdvancedCalculator) MulFn(a, b float64) float64 {
	fmt.Printf("[ADVANCED] 乘法: %.2f * %.2f\n", a, b)
	return a * b
}

func (c *AdvancedCalculator) DivFn(a, b float64) (float64, error) {
	if b == 0 {
		return 0, &CalculatorError{Message: "除数不能为零"}
	}
	fmt.Printf("[ADVANCED] 除法: %.2f / %.2f\n", a, b)
	return a / b, nil
}

// PowFn 幂运算
func (c *AdvancedCalculator) PowFn(base, exponent float64) float64 {
	result := 1.0
	for i := 0; i < int(exponent); i++ {
		result *= base
	}
	return result
}
