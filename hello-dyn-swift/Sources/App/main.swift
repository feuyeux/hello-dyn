import Foundation
import Lib

let a = 8.0
let b = 2.0
let calculators: [(String, Any)] = [
    ("BasicCalculator", BasicCalculator()),
    ("AdvancedCalculator", AdvancedCalculator())
]
for (name, calculator) in calculators {
    print("[LOG] Using \(name)")
    if let calc = calculator as? BasicCalculator {
        print("[LOG] add: \(a) + \(b) = \(calc.addFn(a, b))")
        print("[LOG] subtract: \(a) - \(b) = \(calc.subFn(a, b))")
        print("[LOG] multiply: \(a) * \(b) = \(calc.mulFn(a, b))")
        do {
            print("[LOG] divide: \(a) / \(b) = \(try calc.divFn(a, b))")
        } catch {
            print("[ERROR] divide: \(error)")
        }
    }
    if let adv = calculator as? AdvancedCalculator {
        print("[LOG] power: \(a) ^ \(b) = \(adv.powFn(a, b))")
    }
}
