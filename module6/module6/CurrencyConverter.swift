//
//  CurrencyConverter.swift
//  module6
//
//  Created by Brandon Robb on 2/21/25.
//

import Foundation

enum CurrencyType {
    case euro
    case mexican_peso
    case cad
    case yen
}

class CurrencyConverter {
    func convert(usd: Int, to currency: CurrencyType) -> Double {
        switch currency {
        case .euro:
            return Double(usd) * 0.96
        case .mexican_peso:
            return Double(usd) * 20.44
        case .cad:
            return Double(usd) * 1.42
        case .yen:
            return Double(usd) * 149.22
        }
    }
}
