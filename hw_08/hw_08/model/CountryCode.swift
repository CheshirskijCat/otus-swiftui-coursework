//
//  CountryCode.swift
//  hw_08
//
//  Created by Dmitry Dementyev on 15.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

enum CountryCode: String {
    
    case us = "USA"
    case zh = "China"
    case fr = "France"
    case ru = "Russia"
    
    var locale: Locale {
        let identifier: String
        
        switch self {
            case .us: identifier = "en_US"
            case .zh: identifier = "zh_CN"
            case .fr: identifier = "fr"
            case .ru: identifier = "ru_RU"
        }
        
        return Locale(identifier: identifier)
    }
    
}
