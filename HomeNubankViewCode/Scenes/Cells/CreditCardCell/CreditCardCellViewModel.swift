//
//  CreditCardCellViewModel.swift
//  HomeNubankViewCode

import Foundation

class CreditCardCellViewModel {
    private let formatter = Formatter()
    
    var getAmountText: String {
        return formatValue(value: "2000")
    }
    
    var getLimitAmountText: String {
        return formatValue(value: "3500")
    }
    
    private func formatValue(value: String) -> String {
        var formattedvalue: String = ""
        
        let doubleValue = formatter.convertToDouble(value)
        formattedvalue = formatter.getFormattedValue(of: doubleValue, with: "R$")
        return formattedvalue
    }
}
