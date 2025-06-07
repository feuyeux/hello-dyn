#include <iostream>
#include <string>
#include <memory>
#include <limits>
#include <cmath>

#ifdef __APPLE__
#include <dlfcn.h>
#define LIBRARY_EXTENSION ".dylib"
#elif _WIN32
#include <windows.h>
#define LIBRARY_EXTENSION ".dll"
#else
#include <dlfcn.h>
#define LIBRARY_EXTENSION ".so"
#endif

#include "calculator.h"

// 函数指针类型定义
typedef Calculator *(*CreateCalculatorFunc)();
typedef void (*DestroyCalculatorFunc)(Calculator *);
typedef double (*CalculatorOpFunc)(Calculator *, double, double);

class DynamicCalculatorLoader
{
private:
#ifdef _WIN32
    HMODULE library;
#else
    void *library;
#endif
    Calculator *calculator;
    DestroyCalculatorFunc destroy_func;
    CalculatorOpFunc add_func;
    CalculatorOpFunc subtract_func;
    CalculatorOpFunc multiply_func;
    CalculatorOpFunc divide_func;

public:
    DynamicCalculatorLoader() : library(nullptr), calculator(nullptr) {}

    ~DynamicCalculatorLoader()
    {
        cleanup();
    }

    bool loadCalculator(const std::string &calculator_type)
    {
        // 构建库文件路径
        std::string library_path = "./libcalculator" + std::string(LIBRARY_EXTENSION);

#ifdef _WIN32
        library = LoadLibrary(library_path.c_str());
        if (!library)
        {
            std::cerr << "无法加载库文件: " << library_path << std::endl;
            return false;
        }

        // 获取函数指针
        CreateCalculatorFunc create_func;
        if (calculator_type == "basic")
        {
            create_func = (CreateCalculatorFunc)GetProcAddress(library, "create_basic_calculator");
        }
        else
        {
            create_func = (CreateCalculatorFunc)GetProcAddress(library, "create_advanced_calculator");
        }

        destroy_func = (DestroyCalculatorFunc)GetProcAddress(library, "destroy_calculator");
        add_func = (CalculatorOpFunc)GetProcAddress(library, "calculator_add_fn");
        subtract_func = (CalculatorOpFunc)GetProcAddress(library, "calculator_sub_fn");
        multiply_func = (CalculatorOpFunc)GetProcAddress(library, "calculator_mul_fn");
        divide_func = (CalculatorOpFunc)GetProcAddress(library, "calculator_div_fn");
#else
        library = dlopen(library_path.c_str(), RTLD_LAZY);
        if (!library)
        {
            std::cerr << "无法加载库文件: " << dlerror() << std::endl;
            return false;
        }

        // 获取函数指针
        CreateCalculatorFunc create_func;
        if (calculator_type == "basic")
        {
            create_func = (CreateCalculatorFunc)dlsym(library, "create_basic_calculator");
        }
        else
        {
            create_func = (CreateCalculatorFunc)dlsym(library, "create_advanced_calculator");
        }

        destroy_func = (DestroyCalculatorFunc)dlsym(library, "destroy_calculator");
        add_func = (CalculatorOpFunc)dlsym(library, "calculator_add_fn");
        subtract_func = (CalculatorOpFunc)dlsym(library, "calculator_sub_fn");
        multiply_func = (CalculatorOpFunc)dlsym(library, "calculator_mul_fn");
        divide_func = (CalculatorOpFunc)dlsym(library, "calculator_div_fn");
#endif

        if (!create_func || !destroy_func || !add_func || !subtract_func || !multiply_func || !divide_func)
        {
            std::cerr << "无法获取函数指针" << std::endl;
            cleanup();
            return false;
        }

        // 创建计算器实例
        calculator = create_func();
        if (!calculator)
        {
            std::cerr << "无法创建计算器实例" << std::endl;
            cleanup();
            return false;
        }

        std::cout << "成功加载计算器: " << calculator_type << std::endl;
        return true;
    }

    double addFn(double a, double b)
    {
        return add_func ? add_func(calculator, a, b) : 0.0;
    }

    double subFn(double a, double b)
    {
        return subtract_func ? subtract_func(calculator, a, b) : 0.0;
    }

    double mulFn(double a, double b)
    {
        return multiply_func ? multiply_func(calculator, a, b) : 0.0;
    }

    double divFn(double a, double b)
    {
        if (divide_func)
        {
            double result = divide_func(calculator, a, b);
            if (std::isnan(result))
            {
                throw CalculatorException("除数不能为零");
            }
            return result;
        }
        return 0.0;
    }

private:
    void cleanup()
    {
        if (calculator && destroy_func)
        {
            destroy_func(calculator);
            calculator = nullptr;
        }

        if (library)
        {
#ifdef _WIN32
            FreeLibrary(library);
#else
            dlclose(library);
#endif
            library = nullptr;
        }
    }
};

void runCalculator(DynamicCalculatorLoader &loader)
{
    std::string input;

    while (true)
    {
        std::cout << "\n选择操作:" << std::endl;
        std::cout << "1. 加法" << std::endl;
        std::cout << "2. 减法" << std::endl;
        std::cout << "3. 乘法" << std::endl;
        std::cout << "4. 除法" << std::endl;
        std::cout << "0. 返回上级菜单" << std::endl;
        std::cout << "请输入选择: ";

        std::getline(std::cin, input);

        if (input == "0")
        {
            break;
        }

        if (input != "1" && input != "2" && input != "3" && input != "4")
        {
            std::cout << "无效的操作!" << std::endl;
            continue;
        }

        double a, b;
        std::cout << "请输入第一个数: ";
        std::cin >> a;
        std::cout << "请输入第二个数: ";
        std::cin >> b;
        std::cin.ignore(); // 忽略换行符

        try
        {
            double result = 0.0;
            std::string op_symbol;

            if (input == "1")
            {
                result = loader.addFn(a, b);
                op_symbol = "+";
            }
            else if (input == "2")
            {
                result = loader.subFn(a, b);
                op_symbol = "-";
            }
            else if (input == "3")
            {
                result = loader.mulFn(a, b);
                op_symbol = "*";
            }
            else if (input == "4")
            {
                result = loader.divFn(a, b);
                op_symbol = "/";
            }

            printf("结果: %.2f %s %.2f = %.2f\n", a, op_symbol.c_str(), b, result);
        }
        catch (const CalculatorException &e)
        {
            std::cout << "错误: " << e.what() << std::endl;
        }
    }
}

int main()
{
    double a = 8, b = 2;
    // 自动加载基础和高级计算器，分别演示
    const char *types[] = {"basic", "advanced"};
    for (const char *type : types)
    {
        DynamicCalculatorLoader loader;
        if (loader.loadCalculator(type))
        {
            std::cout << "[LOG] Using " << type << " calculator" << std::endl;
            std::cout << "[LOG] add: " << a << " + " << b << " = " << loader.addFn(a, b) << std::endl;
            std::cout << "[LOG] subtract: " << a << " - " << b << " = " << loader.subFn(a, b) << std::endl;
            std::cout << "[LOG] multiply: " << a << " * " << b << " = " << loader.mulFn(a, b) << std::endl;
            std::cout << "[LOG] divide: " << a << " / " << b << " = " << loader.divFn(a, b) << std::endl;
            // 幂运算只在高级计算器
            if (std::string(type) == "advanced")
            {
                // 直接调用动态库的 powFn 不方便，这里直接用 std::pow
                std::cout << "[LOG] power: " << a << " ^ " << b << " = " << std::pow(a, b) << std::endl;
            }
        }
    }
    return 0;
}
