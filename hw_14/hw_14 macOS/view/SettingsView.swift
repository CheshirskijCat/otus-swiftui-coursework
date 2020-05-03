//
//  SettingsView.swift
//  hw_14 iOS
//
//  Created by Dmitry Dementyev on 02.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private (set) var content: SettingsViewModel
    
    var body: some View {

        VStack{
            Text("Settings")
                .fontWeight(.bold)
                .font(.system(size: 30))

            HStack{
                Spacer()
                Text("game time")
                    .frame(width: 100)
                    .padding(10)
                
                TextField("", text: Binding(get: {
                    self.content.gametime
                }, set: {
                    self.content.gametime = $0.filter { "0123456789".contains($0) }
                    
                }))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                    .padding(10)
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("player name")
                    .frame(width: 100)
                    .padding(10)
                
                TextField("", text: Binding<String>(get: {
                    self.content.player
                }, set: {
                    self.content.player = $0
                }))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                    .padding(10)
                Spacer()
            }
            
            Button(action:
                content.updateSettings, label: {
                    Text("update")
                        .frame(width: 200)
                        .padding(10)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
            })
            Spacer()
        }
    }
}
