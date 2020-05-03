//
//  PlayGround.swift
//  hw_14 iOS
//
//  Created by Dmitry Dementyev on 02.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject private (set) var content: PlayViewModel
    @State var time: String = ""
    
    var body: some View {
        VStack{
            Text(String(self.content.player))
                .fontWeight(.bold)
                .font(.system(size: 30))
            
            HStack{
                Spacer()
                Text(String(self.content.countDown))
                Spacer()
                Text(String(self.content.score))
                Spacer()
            }
            
            Text(" ")
                .frame(width: 25)
                .padding(10)
                .background(self.content.currentColor)
                .foregroundColor(Color.white)
                .cornerRadius(25)
                .padding(30)
            
            HStack{
                Button(action: {
                    self.content.checkColor(Color.green)
                }, label: {
                    Text("G")
                        .frame(width: 25)
                        .padding(10)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(25)
                        .padding(30)
                })
                Button(action: {
                    self.content.checkColor(Color.blue)
                }, label: {
                    Text("B")
                        .frame(width: 25)
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(25)
                        .padding(30)
                })
            }
            .padding(30)
            
            Button(action:
                content.startGame, label: {
                    Text("start game")
                        .frame(width: 200)
                        .padding(10)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
            })

        }
        .onAppear(perform: self.content.updateView)
//        .navigationBarTitle(Text("Game"), displayMode: .inline)
//         .navigationBarBackButtonHidden(true)
//         .navigationBarItems(leading:
//             Button(action: {
//                self.presentationMode.wrappedValue.dismiss()
//                self.content.finishGame()
//             }) {
//                 HStack {
//                     Image(systemName: "arrow.left")
//                     Text("Back")
//                 }
//         })
        .onDisappear(perform: self.content.finishGame)
        
    }

}
