//
//  SettingsViewModel.swift
//  hw_14 macOS
//
//  Created by Dmitry Dementyev on 03.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class SettingsViewModel : ObservableObject{
    
    @Published var gametime: String = "";
    @Published var player: String = "";

    func updateSettings(){
        GameState().saveSettings(settings: Settings(self.player, Int(self.gametime)))
    }
    
}
