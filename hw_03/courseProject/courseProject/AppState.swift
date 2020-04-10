//
//  AppState.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import UIKit

class AppState {
    
    static var shared = AppState()
    
    var mainWindow: UIWindow?
    var secondWindow: UIWindow?
    
    private init(){ }
    
    func toggleOverlay(){
        if let secondWin = secondWindow{
            if secondWin.isKeyWindow {
                mainWindow?.makeKeyAndVisible()
                secondWin.isHidden = true
            } else {
                secondWin.isHidden = false
                secondWin.makeKeyAndVisible()
            }
        }
    }
}
