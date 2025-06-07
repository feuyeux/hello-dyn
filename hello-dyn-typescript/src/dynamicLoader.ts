import { Calculator } from './calculator';
import * as path from 'path';
import * as fs from 'fs';

// 计算器构造函数类型
type CalculatorConstructor = new () => Calculator;

// 动态计算器加载器
export class DynamicCalculatorLoader {
    private calculator: Calculator | null = null;

    // 动态加载计算器实现
    async loadCalculator(calculatorType: string): Promise<boolean> {
        try {
            let CalculatorClass: CalculatorConstructor;

            switch (calculatorType) {
                case 'basic':
                    const basicModule = await import('./calculatorImplementations');
                    CalculatorClass = basicModule.BasicCalculator;
                    break;
                case 'advanced':
                    const advancedModule = await import('./calculatorImplementations');
                    CalculatorClass = advancedModule.AdvancedCalculator;
                    break;
                default:
                    console.log(`无效的计算器类型: ${calculatorType}`);
                    return false;
            }

            this.calculator = new CalculatorClass();
            console.log(`成功加载计算器: ${calculatorType}`);
            return true;

        } catch (error) {
            console.log(`加载计算器失败: ${error}`);
            return false;
        }
    }

    // 从外部模块加载计算器
    async loadCalculatorFromModule(modulePath: string, className: string): Promise<boolean> {
        try {
            // 检查模块文件是否存在
            const fullPath = path.resolve(modulePath);
            if (!fs.existsSync(fullPath)) {
                console.log(`模块文件不存在: ${fullPath}`);
                return false;
            }

            // 动态导入模块
            const module = await import(fullPath);

            // 获取类构造函数
            const CalculatorClass = module[className] as CalculatorConstructor;
            if (!CalculatorClass) {
                console.log(`模块中未找到类: ${className}`);
                return false;
            }

            // 创建实例
            this.calculator = new CalculatorClass();
            console.log(`成功从模块加载计算器: ${className}`);
            return true;

        } catch (error) {
            console.log(`从模块加载计算器失败: ${error}`);
            return false;
        }
    }

    // 使用工厂函数动态创建计算器
    loadCalculatorByFactory(factory: () => Calculator, name: string): boolean {
        try {
            this.calculator = factory();
            console.log(`成功通过工厂函数加载计算器: ${name}`);
            return true;
        } catch (error) {
            console.log(`工厂函数加载计算器失败: ${error}`);
            return false;
        }
    }

    // 使用类型动态创建计算器
    loadCalculatorByType<T extends Calculator>(
        CalculatorType: new () => T,
        name: string
    ): boolean {
        try {
            this.calculator = new CalculatorType();
            console.log(`成功通过类型加载计算器: ${name}`);
            return true;
        } catch (error) {
            console.log(`类型加载计算器失败: ${error}`);
            return false;
        }
    }

    // 获取当前加载的计算器
    getCalculator(): Calculator | null {
        return this.calculator;
    }

    // 清理资源
    cleanup(): void {
        this.calculator = null;
    }
}
