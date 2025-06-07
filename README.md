# Multi-language Dynamic Loading Calculator

This project demonstrates how to implement a dynamic loading mechanism for a four-operations calculator in various programming languages. Each language implementation includes the following core features:

1. **Functionality** - Implements basic arithmetic operations (addition, subtraction, multiplication, division)
2. **Build and Distribute Function Package** - Compiles the calculator as a loadable module/library
3. **Dynamic Loading** - Loads the calculator implementation at runtime
4. **Function Invocation** - Calls the dynamically loaded calculator functions through a unified interface

## Supported Languages

- **Java** - Uses URLClassLoader for dynamic class loading
- **Python** - Uses importlib for dynamic module import
- **Rust** - Uses libloading for dynamic library loading
- **C++** - Uses dlopen/LoadLibrary for dynamic library loading
- **C#** - Uses Reflection and Assembly.LoadFrom for dynamic assembly loading
- **Go** - Uses reflection and interfaces for dynamic type creation
- **Swift** - Uses protocols and type system for dynamic instance creation
- **TypeScript** - Uses dynamic import and factory pattern for module loading
- **Dart** - Uses factory pattern and reflection for dynamic instance creation
- **Kotlin** - Uses reflection and factory pattern for dynamic class loading

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

## Quick Start

Each language implementation includes a `run.sh` script for quick build and execution:

### Java
```bash
cd hello-dyn-java
chmod +x run.sh
./run.sh
```

### Python
```bash
cd hello-dyn-python
chmod +x run.sh
./run.sh
```

### Rust
```bash
cd hello-dyn-rust
chmod +x run.sh
./run.sh
```

### C++
```bash
cd hello-dyn-cpp
chmod +x run.sh
./run.sh
```

### C#
```bash
cd hello-dyn-csharp
chmod +x run.sh
./run.sh
```

### Go
```bash
cd hello-dyn-go
chmod +x run.sh
./run.sh
```

### Swift
```bash
cd hello-dyn-swift
chmod +x run.sh
./run.sh
```

### TypeScript
```bash
cd hello-dyn-typescript
chmod +x run.sh
./run.sh
```

### Dart
```bash
cd hello-dyn-dart
chmod +x run.sh
./run.sh
```

### Kotlin
```bash
cd hello-dyn-kotlin
chmod +x run.sh
./run.sh
```

## Features

### Calculator Types
- **Basic Calculator** - Provides basic arithmetic operations
- **Advanced Calculator** - Extends the basic calculator with logging and additional math functions

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

- **Java**: JDK 8+
- **Python**: Python 3.6+
- **Rust**: Rust 1.60+
- **C++**: C++11+ compiler (GCC/Clang)
- **C#**: .NET 6+
- **Go**: Go 1.19+
- **Swift**: Swift 5.0+
- **TypeScript**: Node.js 16+ and npm

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

## Contribution

Contributions are welcome! Please submit issues and pull requests to help improve this project.

## License

MIT License