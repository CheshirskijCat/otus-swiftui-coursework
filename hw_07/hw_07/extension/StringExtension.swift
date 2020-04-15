//
//  StringExtension.swift
//  hw_07
//
//  Created by Dmitry Dementyev on 14.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

extension String {
    
    func isNameValid() -> Bool {
        let regex = try? NSRegularExpression(pattern: #"^[A-Za-z]*$"#, options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) == nil
    }
    
    func isEmailValid() -> Bool {
        let regex = try? NSRegularExpression(pattern: #".+@.+\..+"#, options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
    }
    
    func isPhoneValid() -> Bool {
        let regex = try? NSRegularExpression(pattern: #"^\+?[\d\w()]*$"#, options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) == nil
    }
    
    func isPassValid() -> Bool {
        let regex = try? NSRegularExpression(pattern: #"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$"#, options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) == nil
    }
    
    func isDateValid() -> Bool {
        let regex = try? NSRegularExpression(pattern: #"[0-3]\d{1,3}-[0-3]\d{1,3}-[0-3]\d{1,3}"#, options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) == nil
    }
}
