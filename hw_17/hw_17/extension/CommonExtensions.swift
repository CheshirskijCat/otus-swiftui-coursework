//
//  CommonExtensions.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 07/07/2019.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
}
