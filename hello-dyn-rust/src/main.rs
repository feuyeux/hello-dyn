use libloading::{Library, Symbol};
use std::io::{self, Write};

// 定义函数指针类型
type CreateBasicFn = unsafe extern "C" fn() -> *mut std::ffi::c_void;
type CreateAdvancedFn = unsafe extern "C" fn() -> *mut std::ffi::c_void;
type BasicOpFn = unsafe extern "C" fn(*const std::ffi::c_void, f64, f64) -> f64;
type AdvancedOpFn = unsafe extern "C" fn(*const std::ffi::c_void, f64, f64) -> f64;
type DestroyBasicFn = unsafe extern "C" fn(*mut std::ffi::c_void);
type DestroyAdvancedFn = unsafe extern "C" fn(*mut std::ffi::c_void);

struct DynamicCalculator {
    library: Library,
    calculator_ptr: *mut std::ffi::c_void,
    calculator_type: CalculatorType,
}

#[derive(Clone)]
enum CalculatorType {
    Basic,
    Advanced,
}

impl DynamicCalculator {
    fn new(library_path: &str, calculator_type: CalculatorType) -> Result<Self, Box<dyn std::error::Error>> {
        unsafe {
            let library = Library::new(library_path)?;
            
            let calculator_ptr = match calculator_type {
                CalculatorType::Basic => {
                    let create_fn: Symbol<CreateBasicFn> = library.get(b"create_basic_calculator")?;
                    create_fn()
                }
                CalculatorType::Advanced => {
                    let create_fn: Symbol<CreateAdvancedFn> = library.get(b"create_advanced_calculator")?;
                    create_fn()
                }
            };
            
            Ok(DynamicCalculator {
                library,
                calculator_ptr,
                calculator_type,
            })
        }
    }
    
    fn add_fn(&self, a: f64, b: f64) -> Result<f64, Box<dyn std::error::Error>> {
        unsafe {
            match self.calculator_type {
                CalculatorType::Basic => {
                    let add_fn: Symbol<BasicOpFn> = self.library.get(b"basic_add_fn")?;
                    Ok(add_fn(self.calculator_ptr, a, b))
                }
                CalculatorType::Advanced => {
                    let add_fn: Symbol<AdvancedOpFn> = self.library.get(b"advanced_add_fn")?;
                    Ok(add_fn(self.calculator_ptr, a, b))
                }
            }
        }
    }
    
    fn sub_fn(&self, a: f64, b: f64) -> Result<f64, Box<dyn std::error::Error>> {
        unsafe {
            match self.calculator_type {
                CalculatorType::Basic => {
                    let sub_fn: Symbol<BasicOpFn> = self.library.get(b"basic_sub_fn")?;
                    Ok(sub_fn(self.calculator_ptr, a, b))
                }
                CalculatorType::Advanced => {
                    let sub_fn: Symbol<AdvancedOpFn> = self.library.get(b"advanced_sub_fn")?;
                    Ok(sub_fn(self.calculator_ptr, a, b))
                }
            }
        }
    }
    
    fn mul_fn(&self, a: f64, b: f64) -> Result<f64, Box<dyn std::error::Error>> {
        unsafe {
            match self.calculator_type {
                CalculatorType::Basic => {
                    let mul_fn: Symbol<BasicOpFn> = self.library.get(b"basic_mul_fn")?;
                    Ok(mul_fn(self.calculator_ptr, a, b))
                }
                CalculatorType::Advanced => {
                    let mul_fn: Symbol<AdvancedOpFn> = self.library.get(b"advanced_mul_fn")?;
                    Ok(mul_fn(self.calculator_ptr, a, b))
                }
            }
        }
    }
    
    fn div_fn(&self, a: f64, b: f64) -> Result<f64, Box<dyn std::error::Error>> {
        unsafe {
            match self.calculator_type {
                CalculatorType::Basic => {
                    let div_fn: Symbol<BasicOpFn> = self.library.get(b"basic_div_fn")?;
                    let result = div_fn(self.calculator_ptr, a, b);
                    if result.is_nan() {
                        Err("除数不能为零".into())
                    } else {
                        Ok(result)
                    }
                }
                CalculatorType::Advanced => {
                    let div_fn: Symbol<AdvancedOpFn> = self.library.get(b"advanced_div_fn")?;
                    let result = div_fn(self.calculator_ptr, a, b);
                    if result.is_nan() {
                        Err("除数不能为零".into())
                    } else {
                        Ok(result)
                    }
                }
            }
        }
    }
}

impl Drop for DynamicCalculator {
    fn drop(&mut self) {
        unsafe {
            match self.calculator_type {
                CalculatorType::Basic => {
                    if let Ok(destroy_fn) = self.library.get::<Symbol<DestroyBasicFn>>(b"destroy_basic_calculator") {
                        destroy_fn(self.calculator_ptr);
                    }
                }
                CalculatorType::Advanced => {
                    if let Ok(destroy_fn) = self.library.get::<Symbol<DestroyAdvancedFn>>(b"destroy_advanced_calculator") {
                        destroy_fn(self.calculator_ptr);
                    }
                }
            }
        }
    }
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let a = 8.0;
    let b = 2.0;
    let library_path = if cfg!(target_os = "macos") {
        "./target/debug/libcalculator.dylib"
    } else if cfg!(target_os = "windows") {
        "./target/debug/calculator.dll"
    } else {
        "./target/debug/libcalculator.so"
    };
    let types = [("BasicCalculator", CalculatorType::Basic), ("AdvancedCalculator", CalculatorType::Advanced)];
    for (name, calc_type) in types.iter() {
        match DynamicCalculator::new(library_path, calc_type.clone()) {
            Ok(calculator) => {
                println!("[LOG] Using {}", name);
                println!("[LOG] add: {} + {} = {}", a, b, calculator.add_fn(a, b)?);
                println!("[LOG] subtract: {} - {} = {}", a, b, calculator.sub_fn(a, b)?);
                println!("[LOG] multiply: {} * {} = {}", a, b, calculator.mul_fn(a, b)?);
                println!("[LOG] divide: {} / {} = {}", a, b, calculator.div_fn(a, b)?);
                if *name == "AdvancedCalculator" {
                    // 动态库未必有 powFn，直接用 std
                    println!("[LOG] power: {} ^ {} = {}", a, b, a.powf(b));
                }
            }
            Err(e) => println!("加载{}失败: {}", name, e),
        }
    }
    Ok(())
}
