//
//  Double.swift
//  CryptoTracker
//
//  Created by Nemanja Vlahovic on 7.12.23..
//

import Foundation

extension Double {
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /**
     Formats the Double value as currency with up to 6 decimal places.
     
     - Returns: A formatted currency string.
     
     Example Usage:
     ```
     let initialValue1: Double = 12345.6789
     let output1 = initialValue1.asCurrencyWith6Decimals() // Output: "$12,345.678900"
     
     let initialValue2: Double = 0.123456
     let output2 = initialValue2.asCurrencyWith6Decimals() // Output: "$0.123456"
     ```
     **/
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
