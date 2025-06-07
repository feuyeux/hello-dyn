use std::fmt;

// 计算器特质 (Trait)
pub trait Calculator {
    fn add_fn(&self, a: f64, b: f64) -> f64;
    fn sub_fn(&self, a: f64, b: f64) -> f64;
    fn mul_fn(&self, a: f64, b: f64) -> f64;
    fn div_fn(&self, a: f64, b: f64) -> Result<f64, CalculatorError>;
}

// 错误类型
#[derive(Debug)]
pub enum CalculatorError {
    DivisionByZero,
}

impl fmt::Display for CalculatorError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            CalculatorError::DivisionByZero => write!(f, "除数不能为零"),
        }
    }
}

impl std::error::Error for CalculatorError {}

// 基础计算器实现
pub struct BasicCalculator;

impl Calculator for BasicCalculator {
    fn add_fn(&self, a: f64, b: f64) -> f64 {
        a + b
    }
    
    fn sub_fn(&self, a: f64, b: f64) -> f64 {
        a - b
    }
    
    fn mul_fn(&self, a: f64, b: f64) -> f64 {
        a * b
    }
    
    fn div_fn(&self, a: f64, b: f64) -> Result<f64, CalculatorError> {
        if b == 0.0 {
            Err(CalculatorError::DivisionByZero)
        } else {
            Ok(a / b)
        }
    }
}

// 高级计算器实现
pub struct AdvancedCalculator;

impl Calculator for AdvancedCalculator {
    fn add_fn(&self, a: f64, b: f64) -> f64 {
        println!("[ADVANCED] 加法: {:.2} + {:.2}", a, b);
        a + b
    }
    
    fn sub_fn(&self, a: f64, b: f64) -> f64 {
        println!("[ADVANCED] 减法: {:.2} - {:.2}", a, b);
        a - b
    }
    
    fn mul_fn(&self, a: f64, b: f64) -> f64 {
        println!("[ADVANCED] 乘法: {:.2} * {:.2}", a, b);
        a * b
    }
    
    fn div_fn(&self, a: f64, b: f64) -> Result<f64, CalculatorError> {
        if b == 0.0 {
            Err(CalculatorError::DivisionByZero)
        } else {
            println!("[ADVANCED] 除法: {:.2} / {:.2}", a, b);
            Ok(a / b)
        }
    }
}

impl AdvancedCalculator {
    pub fn pow_fn(&self, base: f64, exponent: f64) -> f64 {
        base.powf(exponent)
    }
}

// C ABI 兼容的函数，用于动态加载
#[no_mangle]
pub extern "C" fn create_basic_calculator() -> *mut BasicCalculator {
    Box::into_raw(Box::new(BasicCalculator))
}

#[no_mangle]
pub extern "C" fn create_advanced_calculator() -> *mut AdvancedCalculator {
    Box::into_raw(Box::new(AdvancedCalculator))
}

#[no_mangle]
pub extern "C" fn basic_add_fn(calc: *const BasicCalculator, a: f64, b: f64) -> f64 {
    unsafe { (*calc).add_fn(a, b) }
}

#[no_mangle]
pub extern "C" fn basic_sub_fn(calc: *const BasicCalculator, a: f64, b: f64) -> f64 {
    unsafe { (*calc).sub_fn(a, b) }
}

#[no_mangle]
pub extern "C" fn basic_mul_fn(calc: *const BasicCalculator, a: f64, b: f64) -> f64 {
    unsafe { (*calc).mul_fn(a, b) }
}

#[no_mangle]
pub extern "C" fn basic_div_fn(calc: *const BasicCalculator, a: f64, b: f64) -> f64 {
    unsafe { 
        match (*calc).div_fn(a, b) {
            Ok(result) => result,
            Err(_) => f64::NAN,
        }
    }
}

#[no_mangle]
pub extern "C" fn advanced_add_fn(calc: *const AdvancedCalculator, a: f64, b: f64) -> f64 {
    unsafe { (*calc).add_fn(a, b) }
}

#[no_mangle]
pub extern "C" fn advanced_sub_fn(calc: *const AdvancedCalculator, a: f64, b: f64) -> f64 {
    unsafe { (*calc).sub_fn(a, b) }
}

#[no_mangle]
pub extern "C" fn advanced_mul_fn(calc: *const AdvancedCalculator, a: f64, b: f64) -> f64 {
    unsafe { (*calc).mul_fn(a, b) }
}

#[no_mangle]
pub extern "C" fn advanced_div_fn(calc: *const AdvancedCalculator, a: f64, b: f64) -> f64 {
    unsafe { 
        match (*calc).div_fn(a, b) {
            Ok(result) => result,
            Err(_) => f64::NAN,
        }
    }
}

#[no_mangle]
pub extern "C" fn destroy_basic_calculator(calc: *mut BasicCalculator) {
    unsafe { drop(Box::from_raw(calc)) };
}

#[no_mangle]
pub extern "C" fn destroy_advanced_calculator(calc: *mut AdvancedCalculator) {
    unsafe { drop(Box::from_raw(calc)) };
}
