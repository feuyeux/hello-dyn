import { Calculator, BasicCalculator, AdvancedCalculator } from '@hello-dyn/calculator-lib';

function main() {
    console.log('=== TypeScript 动态加载四则运算器 ===');
    
    const a = 8;
    const b = 2;
    
    const calculators: Array<{ name: string, calculator: Calculator }> = [
        { name: 'BasicCalculator', calculator: new BasicCalculator() },
        { name: 'AdvancedCalculator', calculator: new AdvancedCalculator() }
    ];
    
    for (const { name, calculator } of calculators) {
        console.log(`[LOG] Using ${name}`);
        console.log(`[LOG] add: ${a} + ${b} = ${calculator.addFn(a, b)}`);
        console.log(`[LOG] subtract: ${a} - ${b} = ${calculator.subFn(a, b)}`);
        console.log(`[LOG] multiply: ${a} * ${b} = ${calculator.mulFn(a, b)}`);
        
        try {
            console.log(`[LOG] divide: ${a} / ${b} = ${calculator.divFn(a, b)}`);
        } catch (error) {
            const message = error instanceof Error ? error.message : String(error);
            console.log(`[LOG] divide: ${a} / ${b} = error: ${message}`);
        }
        
        if (calculator instanceof AdvancedCalculator) {
            console.log(`[LOG] power: ${a} ^ ${b} = ${calculator.powFn(a, b)}`);
        }
        
        console.log();
    }
}

main();
