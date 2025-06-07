// 计算器接口
export interface Calculator {
    addFn(a: number, b: number): number;
    subFn(a: number, b: number): number;
    mulFn(a: number, b: number): number;
    divFn(a: number, b: number): number;
}

// 计算器错误类
export class CalculatorError extends Error {
    constructor(message: string) {
        super(message);
        this.name = 'CalculatorError';
    }
}
