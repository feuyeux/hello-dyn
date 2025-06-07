import { Calculator, CalculatorError } from './calculator';

// 基础计算器实现
export class BasicCalculator implements Calculator {
    addFn(a: number, b: number): number {
        return a + b;
    }

    subFn(a: number, b: number): number {
        return a - b;
    }

    mulFn(a: number, b: number): number {
        return a * b;
    }

    divFn(a: number, b: number): number {
        if (b === 0) {
            throw new CalculatorError('除数不能为零');
        }
        return a / b;
    }
}

// 高级计算器实现
export class AdvancedCalculator implements Calculator {
    addFn(a: number, b: number): number {
        console.log(`[ADVANCED] 加法: ${a.toFixed(2)} + ${b.toFixed(2)}`);
        return a + b;
    }

    subFn(a: number, b: number): number {
        console.log(`[ADVANCED] 减法: ${a.toFixed(2)} - ${b.toFixed(2)}`);
        return a - b;
    }

    mulFn(a: number, b: number): number {
        console.log(`[ADVANCED] 乘法: ${a.toFixed(2)} * ${b.toFixed(2)}`);
        return a * b;
    }

    divFn(a: number, b: number): number {
        if (b === 0) {
            throw new CalculatorError('除数不能为零');
        }
        console.log(`[ADVANCED] 除法: ${a.toFixed(2)} / ${b.toFixed(2)}`);
        return a / b;
    }

    // 额外功能
    powFn(base: number, exponent: number): number {
        return Math.pow(base, exponent);
    }
}
