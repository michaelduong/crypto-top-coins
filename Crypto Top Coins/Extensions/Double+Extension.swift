//
//  Double+Extension.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

extension Double {
    private var currencyFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.currencyCode = "usd"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var numberFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercentString() -> String {
        return (numberFormatter.string(for: self) ?? "0.00") + "%"
    }
}
