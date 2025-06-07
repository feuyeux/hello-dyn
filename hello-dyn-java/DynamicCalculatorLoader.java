import java.io.File;
import java.net.URL;
import java.net.URLClassLoader;

// 动态加载器和主程序
public class DynamicCalculatorLoader {
    
    public static void main(String[] args) {
        double a = 8, b = 2;
        Calculator[] calculators = {new BasicCalculator(), new AdvancedCalculator()};
        String[] names = {"BasicCalculator", "AdvancedCalculator"};
        for (int i = 0; i < calculators.length; i++) {
            Calculator calculator = calculators[i];
            String name = names[i];
            System.out.println("[LOG] Using " + name);
            System.out.println("[LOG] add: " + a + " + " + b + " = " + calculator.addFn(a, b));
            System.out.println("[LOG] subtract: " + a + " - " + b + " = " + calculator.subFn(a, b));
            System.out.println("[LOG] multiply: " + a + " * " + b + " = " + calculator.mulFn(a, b));
            System.out.println("[LOG] divide: " + a + " / " + b + " = " + calculator.divFn(a, b));
            if (calculator instanceof AdvancedCalculator) {
                System.out.println("[LOG] power: " + a + " ^ " + b + " = " + ((AdvancedCalculator)calculator).powFn(a, b));
            }
        }
    }
    
    // 动态加载计算器实现
    private static Calculator loadCalculator(int choice) {
        try {
            String className;
            switch (choice) {
                case 1:
                    className = "BasicCalculator";
                    break;
                case 2:
                    className = "AdvancedCalculator";
                    break;
                default:
                    System.out.println("无效的选择!");
                    return null;
            }
            
            // 获取当前目录
            File currentDir = new File(".");
            URL[] urls = {currentDir.toURI().toURL()};
            URLClassLoader classLoader = new URLClassLoader(urls);
            
            // 动态加载类
            Class<?> calculatorClass = classLoader.loadClass(className);
            
            // 创建实例
            Calculator calculator = (Calculator) calculatorClass.getDeclaredConstructor().newInstance();
            
            System.out.println("成功加载计算器: " + className);
            return calculator;
            
        } catch (Exception e) {
            System.out.println("加载计算器失败: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
