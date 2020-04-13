//
//  PromiseError.swift
//  hw_05
//
//  Created by Dmitry Dementyev on 12.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class PromiseError : Error{
    private var message: String;
    
    init(message: String){
        self.message = message
    }
    
    func getMessage() -> String {
        return message
    }
}
