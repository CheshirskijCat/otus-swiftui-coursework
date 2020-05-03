//
//  PlayViewModel.swift
//  hw_14 iOS
//
//  Created by Dmitry Dementyev on 03.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import SwiftUI

class PlayViewModel : ObservableObject{
    
    @Published var countDown: Int = 0;
    @Published var currentColor: Color = Color.gray;
    @Published var score: Int = 0;
    @Published var player: String = "";
    
    private var checked = false
    
    private var timer: Timer? = nil

    init(){
        updateView()
    }
    
    public func startGame(){
        removeTimer()
        updateView()
        setTimer()
    }
    
    public func finishGame(){
        removeTimer()
        GameState().appendLeaderboard(gameRecord:
            GameRecord(player: self.player, result: self.score))
    }
    
    public func checkColor(_ color: Color){
        if color == currentColor, !checked{
            score += 1
            checked = true
        }
    }
    
    public func updateView(){
        let settings = GameState().retriveSettings()
        countDown =  settings.gameTime
        player = settings.player
        score = 0
        currentColor = Color.gray
    }
    
    private func setTimer(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.timer = timer
            if self.countDown < 0 {
                self.finishGame()
            }
            
            self.countDown -= 1
            self.showColor()
        }
    }
    
    private func showColor(){
        checked = false
        let randomValue = Int.random(in: 0...1)
        currentColor = randomValue == 0 ? Color.green : Color.blue
    }
    
    private func removeTimer(){
        self.timer?.invalidate()
    }
}
