//
//  ContentView.swift
//  hw_06
//
//  Created by Dmitry Dementyev on 13.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private (set) var content: ContentViewModel
    @State var algo: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Algorithms")
                    .fontWeight(.bold)
                    .font(.system(size: 30))

                TextField("", text: Binding<String>(get: {
                    self.algo
                }, set: {
                    self.algo = $0
                    self.content.updateList(search: $0)
                }))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .padding(10)
            
                List (content.list, id: \.0){ item in
                    NavigationLink(destination: AlgoTestView()
                        .environmentObject(AlgoTestViewModel(structure:item.0))) {
                        HStack{
                            Text(item.0)
                            Spacer()
                            Text(Formatter.formattedTime(item.1) ?? "")
                        }
                    }
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
