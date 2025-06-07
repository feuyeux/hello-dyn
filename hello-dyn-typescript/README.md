# TypeScript 动态加载四则运算器

这是一个使用 TypeScript 实现的动态加载四则运算器，展示了 TypeScript 中的多种动态加载机制。

## 功能特性

- **基础计算器**: 提供基本的四则运算功能
- **高级计算器**: 增加了日志输出和扩展数学功能
- **多种动态加载方式**:
  - 动态导入 (`import()`)
  - 工厂函数模式
  - 类型构造函数
  - 外部模块加载

## 安装和运行

### 前置要求

- Node.js 16+
- npm 或 yarn

### 安装依赖

```bash
npm install
```

### 运行方式

1. **编译后运行**:
```bash
npm run build
npm start
```

2. **开发模式运行**:
```bash
npm run dev
```

3. **使用脚本运行**:
```bash
chmod +x run.sh
./run.sh
```

4. **开发模式脚本**:
```bash
chmod +x run-dev.sh
./run-dev.sh
```

## 项目结构

```
src/
├── calculator.ts                 # 计算器接口和错误定义
├── calculatorImplementations.ts  # 计算器实现类
├── dynamicLoader.ts              # 动态加载器
└── main.ts                       # 主程序入口
```

## 动态加载机制

### 1. 动态导入 (Dynamic Import)

使用 ES2020 的 `import()` 语法在运行时加载模块：

```typescript
const module = await import('./calculatorImplementations');
const CalculatorClass = module.BasicCalculator;
```

### 2. 工厂函数模式

通过工厂函数动态创建实例：

```typescript
loadCalculatorByFactory(() => new BasicCalculator(), 'BasicCalculator')
```

### 3. 类型构造函数

直接传递类型构造函数：

```typescript
loadCalculatorByType(AdvancedCalculator, 'AdvancedCalculator')
```

### 4. 外部模块加载

从文件系统动态加载外部模块：

```typescript
await loadCalculatorFromModule('./external-calculator', 'CustomCalculator')
```

## 技术特点

- **类型安全**: 完整的 TypeScript 类型定义
- **异步支持**: 使用 async/await 处理动态导入
- **错误处理**: 完善的错误处理和类型安全的异常
- **模块化设计**: 清晰的模块分离和接口定义
- **多种加载策略**: 展示不同的动态加载模式

## 开发

- `npm run build` - 编译 TypeScript
- `npm run start` - 运行编译后的 JavaScript
- `npm run dev` - 开发模式运行 (ts-node)
- `npm run clean` - 清理编译文件
