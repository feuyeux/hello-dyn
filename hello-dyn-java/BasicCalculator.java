// 基础计算器实现
public class BasicCalculator implements Calculator {
    @Override
    public double addFn(double a, double b) {
        return a + b;
    }
    
    @Override
    public double subFn(double a, double b) {
        return a - b;
    }
    
    @Override
    public double mulFn(double a, double b) {
        return a * b;
    }
    
    @Override
    public double divFn(double a, double b) {
        if (b == 0) {
            throw new ArithmeticException("除数不能为零");
        }
        return a / b;
    }
}
