// 高级计算器实现
public class AdvancedCalculator implements Calculator {
    @Override
    public double addFn(double a, double b) {
        System.out.printf("[ADVANCED] 加法: %.2f + %.2f%n", a, b);
        return a + b;
    }
    
    @Override
    public double subFn(double a, double b) {
        System.out.printf("[ADVANCED] 减法: %.2f - %.2f%n", a, b);
        return a - b;
    }
    
    @Override
    public double mulFn(double a, double b) {
        System.out.printf("[ADVANCED] 乘法: %.2f * %.2f%n", a, b);
        return a * b;
    }
    
    @Override
    public double divFn(double a, double b) {
        if (b == 0) {
            throw new ArithmeticException("除数不能为零");
        }
        System.out.printf("[ADVANCED] 除法: %.2f / %.2f%n", a, b);
        return a / b;
    }
    
    // 额外功能
    public double powFn(double base, double exponent) {
        return Math.pow(base, exponent);
    }
}
