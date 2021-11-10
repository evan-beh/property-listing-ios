//
//  Utility+Extension.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit

extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}

extension NumberFormatter {
    convenience init(style: Style) {
        self.init()
        self.numberStyle = style
    }
}

extension FloatingPoint {
    var currency: String {
        let formatter = NumberFormatter(style: .currency)
        formatter.maximumFractionDigits = 0
        return formatter.string(for: self) ?? ""
    }
}
