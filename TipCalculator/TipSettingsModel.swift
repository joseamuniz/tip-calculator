//
//  SettingsModel.swift
//  TipCalculator
//
//  Created by Jose Muniz on 7/27/17.
//  Copyright © 2017 Jose Muniz. All rights reserved.
//

import Foundation

class TipSettingsModel {
    
    static let global = TipSettingsModel()

    private let defaults = UserDefaults.standard
    
    var minTip: Double {
        didSet {
            defaults.set(String(minTip), forKey: "minTip")
        }
    }
    
    var medTip: Double {
        didSet {
            defaults.set(String(medTip), forKey: "medTip")
        }
    }
    
    var maxTip: Double {
        didSet {
            defaults.set(String(maxTip), forKey: "maxTip")
        }
    }
    
    func setTips(minTip: Double, medTip: Double, maxTip: Double) {
        print ("Setting tips to \( (minTip, medTip, maxTip) ) ")
        self.minTip = minTip
        self.medTip = medTip
        self.maxTip = maxTip
    }
    
    static func parseFromPercentString(percentString: String) -> Double {
        print ("Parsing \( percentString )")
        if (percentString.isEmpty) {
            return 0.0
        } else {
            let trimmedString = percentString.replacingOccurrences(of: "%", with: "")
            return (Double(trimmedString) ?? 0.0) / 100.0
        }
    }
    
    /*  Transforms one of the many accepted input formats (e.g. 15%, 15, 15 %) into a
        canonical representation (e.g. 15%)
     */
    static func canonicalize(percentString: String) -> String {
        let trimmedString = percentString.replacingOccurrences(of: "%", with: "").replacingOccurrences(of: " ", with: "")
        // Consider any invalid input to be 0.0
        return String(Double(trimmedString) ?? 0.0)
    }
    
    static func toPercentString(double: Double) -> String {
        return String(double * 100) + "%"
    }
    
    init() {
        // Note: We store the values as strings to explicitly provide a default
        //       value if one is not provided
        self.minTip = 1.0
        minTip = Double(defaults.string(forKey: "minTip") ?? "0.15")!
        medTip = Double(defaults.string(forKey: "medTip") ?? "0.20")!
        maxTip = Double(defaults.string(forKey: "maxTip") ?? "0.25")!
    }
}
