import * as readlineSync from 'readline-sync';
import { Calculator, CalculatorError } from './calculator';
import { DynamicCalculatorLoader } from './dynamicLoader';
import { BasicCalculator, AdvancedCalculator } from './calculatorImplementations';

class CalculatorApp {
    private loader: DynamicCalculatorLoader;

    constructor() {
        this.loader = new DynamicCalculatorLoader();
    }

    async run(): Promise<void> {
        console.log('=== TypeScript 动态加载四则运算器 ===');

        while (true) {
            console.log('\n选择计算器类型:');
            console.log('1. 基础计算器');
            console.log('2. 高级计算器');
            console.log('3. 动态导入基础计算器');
            console.log('4. 动态导入高级计算器');
            console.log('5. 工厂函数加载基础计算器');
            console.log('6. 类型方式加载高级计算器');
            console.log('0. 退出');

            const choice = readlineSync.question('请输入选择: ').trim();

            if (choice === '0') {
                break;
            }

            let success = false;

            switch (choice) {
                case '1':
                    success = await this.loader.loadCalculator('basic');
                    break;
                case '2':
                    success = await this.loader.loadCalculator('advanced');
                    break;
                case '3':
                    success = await this.loader.loadCalculatorFromModule(
                        './calculatorImplementations',
                        'BasicCalculator'
                    );
                    break;
                case '4':
                    success = await this.loader.loadCalculatorFromModule(
                        './calculatorImplementations',
                        'AdvancedCalculator'
                    );
                    break;
                case '5':
                    success = this.loader.loadCalculatorByFactory(
                        () => new BasicCalculator(),
                        'BasicCalculator (Factory)'
                    );
                    break;
                case '6':
                    success = this.loader.loadCalculatorByType(
                        AdvancedCalculator,
                        'AdvancedCalculator (Type)'
                    );
                    break;
                default:
                    console.log('无效的选择!');
                    continue;
            }

            if (success) {
                const calculator = this.loader.getCalculator();
                if (calculator) {
                    this.runCalculator(calculator);
                }
            }
        }

        // 清理资源
        this.loader.cleanup();
    }

    private runCalculator(calculator: Calculator): void {
        while (true) {
            console.log('\n选择操作:');
            console.log('1. 加法');
            console.log('2. 减法');
            console.log('3. 乘法');
            console.log('4. 除法');
            console.log('0. 返回上级菜单');

            const operation = readlineSync.question('请输入选择: ').trim();

            if (operation === '0') {
                break;
            }

            if (!['1', '2', '3', '4'].includes(operation)) {
                console.log('无效的操作!');
                continue;
            }

            try {
                const aString = readlineSync.question('请输入第一个数: ');
                const a = parseFloat(aString);
                if (isNaN(a)) {
                    console.log('无效的数字格式!');
                    continue;
                }

                const bString = readlineSync.question('请输入第二个数: ');
                const b = parseFloat(bString);
                if (isNaN(b)) {
                    console.log('无效的数字格式!');
                    continue;
                }

                let result: number;
                let opSymbol: string;

                switch (operation) {
                    case '1':
                        result = calculator.addFn(a, b);
                        opSymbol = '+';
                        break;
                    case '2':
                        result = calculator.subFn(a, b);
                        opSymbol = '-';
                        break;
                    case '3':
                        result = calculator.mulFn(a, b);
                        opSymbol = '*';
                        break;
                    case '4':
                        result = calculator.divFn(a, b);
                        opSymbol = '/';
                        break;
                    default:
                        continue;
                }

                console.log(`结果: ${a.toFixed(2)} ${opSymbol} ${b.toFixed(2)} = ${result.toFixed(2)}`);

            } catch (error) {
                if (error instanceof CalculatorError) {
                    console.log(`错误: ${error.message}`);
                } else {
                    console.log(`错误: ${error}`);
                }
            }
        }
    }
}

// 简化主程序入口
async function main(): Promise<void> {
    const a = 8, b = 2;
    const calculators: [string, Calculator][] = [
        ["BasicCalculator", new BasicCalculator()],
        ["AdvancedCalculator", new AdvancedCalculator()]
    ];
    for (const [name, calculator] of calculators) {
        console.log(`[LOG] Using ${name}`);
        console.log(`[LOG] add: ${a} + ${b} = ${calculator.addFn(a, b)}`);
        console.log(`[LOG] subtract: ${a} - ${b} = ${calculator.subFn(a, b)}`);
        console.log(`[LOG] multiply: ${a} * ${b} = ${calculator.mulFn(a, b)}`);
        console.log(`[LOG] divide: ${a} / ${b} = ${calculator.divFn(a, b)}`);
        // 幂运算只在高级计算器
        if (typeof (calculator as any).powFn === 'function') {
            console.log(`[LOG] power: ${a} ^ ${b} = ${(calculator as any).powFn(a, b)}`);
        }
    }
}

main().catch((error) => {
    console.error('程序发生未处理的错误:', error);
    process.exit(1);
});
