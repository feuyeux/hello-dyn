package main

import (
	"fmt"
	"plugin"
	"reflect"

	lib "github.com/hello-dyn/calculator-lib"
)

// DynamicCalculatorLoader 动态计算器加载器
type DynamicCalculatorLoader struct {
	plugin     *plugin.Plugin
	calculator lib.Calculator
}

// LoadCalculator 加载计算器实现
func (loader *DynamicCalculatorLoader) LoadCalculator(calculatorType string) error {
	var calculator lib.Calculator

	// 在 Go 中，我们可以使用反射来动态创建类型
	// 由于 Go 的 plugin 系统在某些平台上有限制，我们使用反射方式
	switch calculatorType {
	case "basic":
		calculator = &lib.BasicCalculator{}
	case "advanced":
		calculator = &lib.AdvancedCalculator{}
	default:
		return fmt.Errorf("无效的计算器类型: %s", calculatorType)
	}

	loader.calculator = calculator
	fmt.Printf("成功加载计算器: %s\n", calculatorType)
	return nil
}

// LoadCalculatorFromPlugin 从插件加载计算器（示例）
func (loader *DynamicCalculatorLoader) LoadCalculatorFromPlugin(pluginPath, symbolName string) error {
	// 加载插件
	p, err := plugin.Open(pluginPath)
	if err != nil {
		return fmt.Errorf("无法加载插件: %v", err)
	}

	// 查找符号
	symbol, err := p.Lookup(symbolName)
	if err != nil {
		return fmt.Errorf("无法找到符号 %s: %v", symbolName, err)
	}

	// 类型断言
	if calc, ok := symbol.(lib.Calculator); ok {
		loader.plugin = p
		loader.calculator = calc
		fmt.Printf("成功从插件加载计算器: %s\n", symbolName)
		return nil
	}

	return fmt.Errorf("符号 %s 不是有效的计算器类型", symbolName)
}

// LoadCalculatorByReflection 使用反射动态创建计算器
func (loader *DynamicCalculatorLoader) LoadCalculatorByReflection(typeName string) error {
	var calculator lib.Calculator

	switch typeName {
	case "BasicCalculator":
		calculatorType := reflect.TypeOf((*lib.BasicCalculator)(nil)).Elem()
		calculatorValue := reflect.New(calculatorType)
		calculator = calculatorValue.Interface().(lib.Calculator)
	case "AdvancedCalculator":
		calculatorType := reflect.TypeOf((*lib.AdvancedCalculator)(nil)).Elem()
		calculatorValue := reflect.New(calculatorType)
		calculator = calculatorValue.Interface().(lib.Calculator)
	default:
		return fmt.Errorf("无效的计算器类型: %s", typeName)
	}

	loader.calculator = calculator
	fmt.Printf("成功通过反射加载计算器: %s\n", typeName)
	return nil
}

// GetCalculator 获取当前加载的计算器
func (loader *DynamicCalculatorLoader) GetCalculator() lib.Calculator {
	return loader.calculator
}
