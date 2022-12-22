import Foundation

class BalanceCellViewModel {
    private let formatter = Formatter()
    
    func getFormattedBalance() -> String {
        var value: Double
        var formattedvalue: String = ""
        
        value = formatter.convertToDouble("35500")
        formattedvalue = formatter.getFormattedValue(of: value, with: "R$ ")
        return formattedvalue
    }
}
