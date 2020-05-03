//
//  Settings.swift
//  hw_14 macOS
//
//  Created by Dmitry Dementyev on 03.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class Settings : Codable{
    
    static let PLAYER_DEFAULT = "UNKNOWN"
    static let GAMETIME_DEFAULT = 60
    
    var gameTime : Int
    var player : String
    
    init(_ player: String = Settings.PLAYER_DEFAULT,
         _ gameTime: Int? = Settings.GAMETIME_DEFAULT){
        
        self.player = player.isEmpty ? Settings.PLAYER_DEFAULT : player
        self.gameTime = gameTime ?? Settings.GAMETIME_DEFAULT
    }
    
}
