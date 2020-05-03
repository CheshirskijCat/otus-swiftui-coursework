//
//  GameRecord.swift
//  hw_14 macOS
//
//  Created by Dmitry Dementyev on 03.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class GameRecord : Codable {
    
    let result : Int
    let player : String
    
    init(player : String, result: Int){
        self.player = player
        self.result = result
    }
    
}
