//
//  LiderboardView.swift
//  hw_14 iOS
//
//  Created by Dmitry Dementyev on 02.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct LeaderboardView: View {
    
    @State var algo: String = ""
    
    var body: some View {

        VStack{
            Text("Leaderboard")
                .fontWeight(.bold)
                .font(.system(size: 30))
            List(GameState().retriveLeaderboard(), id:\.result){ it in
                Text(it.player)
                Text(String(it.result))
            }
            Spacer()
        }
    }
}
