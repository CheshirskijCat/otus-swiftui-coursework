//
//  AlgoTestView.swift
//  hw_06
//
//  Created by Dmitry Dementyev on 13.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct AlgoTestView: View {
    
    @EnvironmentObject private (set) var content: AlgoTestViewModel
    @State private var value: Float = 0.5
    
    var body: some View {
        VStack{
            Text(content.title)
                .font(.system(size: 35))
            Slider(value: $value, in: 0.0001...1, step: 0.0001)
                .padding(.leading, 50)
                .padding(.trailing, 50)

            Text("Number of items: \(self.content.getNumberOfItems(self.value))")
            Button(action: {
                self.content.startTest()
            }){
                Text("Start test")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.orange)
                    .cornerRadius(5)
            }.disabled(!content.ableToStart)
            
            List (content.list, id: \.0){ item in
                AlgoView(title: item.0, time: item.1)
            }

        }
    }
}

struct AlgoTestView_Previews: PreviewProvider {
    static var previews: some View {
        AlgoTestView()
    }
}
