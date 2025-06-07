# Multi-language Dynamic Loading Calculator

This project demonstrates how to implement a dynamic loading mechanism for a four-operations calculator in various programming languages. Each language implementation includes the following core features:

1. **Functionality** - Implements basic arithmetic operations (addition, subtraction, multiplication, division)
2. **Build and Distribute Function Package** - Compiles the calculator as a loadable module/library
3. **Dynamic Loading** - Loads the calculator implementation at runtime
4. **Function Invocation** - Calls the dynamically loaded calculator functions through a unified interface


## Project Structure

```
hello-dyn/
├── README.md
├── hello-dyn-java/        # Java implementation
├── hello-dyn-python/      # Python implementation
├── hello-dyn-rust/        # Rust implementation
├── hello-dyn-cpp/         # C++ implementation
├── hello-dyn-csharp/      # C# implementation
├── hello-dyn-go/          # Go implementation
├── hello-dyn-swift/       # Swift implementation
├── hello-dyn-typescript/  # TypeScript implementation
├── hello-dyn-dart/        # Dart implementation
└── hello-dyn-kotlin/      # Kotlin implementation
```


### Dynamic Loading Mechanism

Each language implements a different dynamic loading strategy:

1. **Java**: Uses `URLClassLoader` to load `.class` files at runtime
2. **Python**: Uses `importlib` for dynamic module import
3. **Rust**: Compiles as a dynamic library (.so/.dylib/.dll), loaded with `libloading`
4. **C++**: Compiles as a dynamic library, loaded with system APIs (dlopen/LoadLibrary)
5. **C#**: Uses reflection and `Assembly.LoadFrom` to load assemblies
6. **Go**: Uses reflection and interfaces for runtime type creation
7. **Swift**: Uses protocols and type system for dynamic instantiation
8. **TypeScript**: Uses dynamic import (`import()`) and factory pattern for module loading
9. **Dart**: Uses factory pattern and reflection for dynamic instance creation
10. **Kotlin**: Uses Kotlin reflection API and factory pattern for dynamic class loading

### Error Handling
- Division by zero detection and handling
- Error handling for dynamic loading failures
- User input validation

## Technical Highlights

- **Cross-language Consistency**: All implementations follow the same interface design pattern
- **Dynamic Loading**: Demonstrates dynamic loading mechanisms in different languages
- **Robust Error Handling**: Comprehensive error handling and user-friendly error messages
- **Extensibility**: Easy to add new calculator implementations and features

## Requirements

- **Java**: JDK 21+
- **Python**: Python 3.8+
- **Rust**: Rust 1.60+
- **C++**: C++11+ compiler (GCC/Clang) and CMake 3.10+
- **C#**: .NET 6+
- **Go**: Go 1.19+
- **Swift**: Swift 5.0+
- **TypeScript**: Node.js 16+ and npm
- **Dart**: Dart 3.0+
- **Kotlin**: Kotlin 1.8+ and Gradle 7.0+

## Usage

1. Choose a language implementation directory
2. Run the corresponding `run.sh` script
3. Follow the prompts to select the calculator type
4. Perform arithmetic operations

## Architecture

### Interface Design
Each language defines a unified calculator interface:
- `add(a, b)` - Addition
- `subtract(a, b)` - Subtraction
- `multiply(a, b)` - Multiplication
- `divide(a, b)` - Division (with zero-division check)

### Implementations
- **BasicCalculator** - Basic implementation with core arithmetic logic
- **AdvancedCalculator** - Advanced implementation with logging and extended features

### Dynamic Loader
Each language implements a dynamic loader responsible for:
- Loading calculator implementations at runtime
- Creating calculator instances
- Providing a unified invocation interface
