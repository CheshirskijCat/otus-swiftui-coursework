//
//  ContentView.swift
//  hw_14 iOS
//
//  Created by Dmitry Dementyev on 02.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private (set) var content: ContentViewModel
    @State var algo: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: PlayView().environmentObject(PlayViewModel())){
                    Text("Play")
                        .frame(width: 200)
                        .padding(10)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                NavigationLink(destination: SettingsView().environmentObject(SettingsViewModel())){
                    Text("Settings")
                        .frame(width: 200)
                        .padding(10)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                NavigationLink(destination: LeaderboardView()){
                    Text("Leaderboard")
                        .frame(width: 200)
                        .padding(10)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
