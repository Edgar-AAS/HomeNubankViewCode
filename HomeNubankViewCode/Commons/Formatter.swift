import Foundation

final class Formatter {
    private let formatter = NumberFormatter()
    
    init() {
        formatter.usesGroupingSeparator = true
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        let doubleValue = formatter.number(from: string)!.doubleValue
        return doubleValue
    }
    
    func getFormattedValue(of value: Double, with currencySymbol: String) -> String {
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = currencySymbol
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
}
