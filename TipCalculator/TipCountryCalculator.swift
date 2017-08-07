//
//  TipCountryCalculator.swift
//  TipCalculator
//
//  Created by Jose Muniz on 8/3/17.
//  Copyright © 2017 Jose Muniz. All rights reserved.
//

import Foundation

class TipCountryCalculator {
    static let global: TipCountryCalculator = TipCountryCalculator()
    
    func tipForCountry(country: String) -> (Double, Double, Double) {
        switch country {
            case "United States":
                return (0.15, 0.2, 0.25)
            case "Mexico":
                return (0.10, 0.15, 0.20)
            case "France":
                return (0.0, 0.05, 0.10)
            case "UK":
                return (0.10, 0.125, 0.15)
            default:
                return (0.15, 0.2, 0.25)
        }
    }
}
