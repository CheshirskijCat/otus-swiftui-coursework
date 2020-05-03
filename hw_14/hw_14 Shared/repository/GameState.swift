//
//  gameState.swift
//  hw_14 iOS
//
//  Created by Dmitry Dementyev on 03.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class GameState{

    func retriveSettings() -> Settings {
        if let data = UserDefaults.standard.data(forKey: "settings"){
            if let decoded = try? JSONDecoder().decode(Settings.self, from: data) {
                return decoded
            }
        }
        return Settings()
    }

    func saveSettings(settings: Settings){
        if let encoded = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(encoded, forKey: "settings")
        }
    }

    func appendLeaderboard(gameRecord: GameRecord){
        var records = retriveLeaderboard()
        records.append(gameRecord)
        saveLeaderboard(records: records)
    }
    
    func retriveLeaderboard() -> [GameRecord] {
        if let data = UserDefaults.standard.data(forKey: "leaderboard"){
            if let decoded = try? JSONDecoder().decode([GameRecord].self, from: data) {
                return decoded
            }
        }
        return [GameRecord]()
    }

    func saveLeaderboard(records: [GameRecord]){
        let results = Array(records.sorted(by: {$0.result > $1.result}).prefix(10))
        if let encoded = try? JSONEncoder().encode(results) {
            UserDefaults.standard.set(encoded, forKey: "leaderboard")
        }
    }

}
