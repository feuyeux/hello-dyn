import kotlin.reflect.KClass
import kotlin.reflect.full.createInstance
import kotlin.reflect.full.isSubclassOf

// 动态加载器类
object DynamicCalculatorLoader {
    // 工厂方法映射
    private val calculatorFactory = mutableMapOf<String, () -> Calculator>(
        "basic" to { BasicCalculator() },
        "advanced" to { AdvancedCalculator() },
        "scientific" to { ScientificCalculator() }
    )

    // 类型映射
    private val calculatorClasses = mapOf(
        "basic" to BasicCalculator::class,
        "advanced" to AdvancedCalculator::class,
        "scientific" to ScientificCalculator::class
    )

    /**
     * 使用工厂模式创建计算器
     */
    fun createCalculator(type: String): Calculator? {
        return try {
            val factory = calculatorFactory[type.lowercase()]
            factory?.invoke()
        } catch (e: Exception) {
            println("创建计算器失败: ${e.message}")
            null
        }
    }

    /**
     * 使用反射动态创建计算器
     */
    fun createCalculatorByReflection(type: String): Calculator? {
        return try {
            val clazz = calculatorClasses[type.lowercase()]
            if (clazz != null && clazz.isSubclassOf(Calculator::class)) {
                clazz.createInstance()
            } else {
                null
            }
        } catch (e: Exception) {
            println("反射创建计算器失败: ${e.message}")
            null
        }
    }

    /**
     * 通过类名动态创建计算器
     */
    fun createCalculatorByClassName(className: String): Calculator? {
        return try {
            val clazz = Class.forName(className).kotlin as KClass<out Calculator>
            if (clazz.isSubclassOf(Calculator::class)) {
                clazz.createInstance()
            } else {
                null
            }
        } catch (e: Exception) {
            println("通过类名创建计算器失败: ${e.message}")
            null
        }
    }

    /**
     * 获取可用的计算器类型
     */
    fun getAvailableTypes(): List<String> = calculatorFactory.keys.toList()

    /**
     * 注册新的计算器类型
     */
    fun registerCalculator(type: String, factory: () -> Calculator) {
        calculatorFactory[type] = factory
    }

    /**
     * 注册新的计算器类
     */
    fun registerCalculatorClass(type: String, clazz: KClass<out Calculator>) {
        calculatorClasses.toMutableMap()[type] = clazz
        calculatorFactory[type] = { clazz.createInstance() }
    }
}

// 计算器插件接口
interface CalculatorPlugin {
    val name: String
    fun createCalculator(): Calculator
}

// 示例插件实现
class DefaultCalculatorPlugin : CalculatorPlugin {
    override val name: String = "default"
    
    override fun createCalculator(): Calculator = BasicCalculator()
}

// 插件管理器
object PluginManager {
    private val plugins = mutableMapOf<String, CalculatorPlugin>()

    fun registerPlugin(plugin: CalculatorPlugin) {
        plugins[plugin.name] = plugin
        DynamicCalculatorLoader.registerCalculator(plugin.name) { 
            plugin.createCalculator() 
        }
    }

    fun getPlugin(name: String): CalculatorPlugin? = plugins[name]
    
    fun getAllPlugins(): List<CalculatorPlugin> = plugins.values.toList()
}
