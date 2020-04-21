//
//  Formater.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 28/09/2019.
//

import Foundation

class Formatter{
    lazy fileprivate var numberFormatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }()

    static fileprivate var timeNumberFormatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let digits = 6
        formatter.minimumFractionDigits = digits
        formatter.maximumFractionDigits = digits
        return formatter
    }()

    static func formattedTime(_ time: TimeInterval) -> String? {
        return timeNumberFormatter.string(from: time as NSNumber)
    }
}
