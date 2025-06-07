package main

import (
	"fmt"

	calculator "github.com/hello-dyn/calculator-lib"
)

func main() {
	fmt.Println("=== Go 动态加载四则运算器 ===")
	a, b := 8.0, 2.0
	calculators := []struct {
		name string
		calc calculator.Calculator
		pow  func(float64, float64) float64
	}{
		{"BasicCalculator", &calculator.BasicCalculator{}, nil},
		{"AdvancedCalculator", &calculator.AdvancedCalculator{}, func(x, y float64) float64 { return (&calculator.AdvancedCalculator{}).PowFn(x, y) }},
	}
	for _, entry := range calculators {
		fmt.Printf("[LOG] Using %s\n", entry.name)
		fmt.Printf("[LOG] add: %.0f + %.0f = %.0f\n", a, b, entry.calc.AddFn(a, b))
		fmt.Printf("[LOG] subtract: %.0f - %.0f = %.0f\n", a, b, entry.calc.SubFn(a, b))
		fmt.Printf("[LOG] multiply: %.0f * %.0f = %.0f\n", a, b, entry.calc.MulFn(a, b))
		if res, err := entry.calc.DivFn(a, b); err == nil {
			fmt.Printf("[LOG] divide: %.0f / %.0f = %.0f\n", a, b, res)
		} else {
			fmt.Printf("[LOG] divide: %.0f / %.0f = error: %v\n", a, b, err)
		}
		if entry.pow != nil {
			fmt.Printf("[LOG] power: %.0f ^ %.0f = %.0f\n", a, b, entry.pow(a, b))
		}
	}
}
