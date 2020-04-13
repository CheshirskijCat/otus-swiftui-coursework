//
//  ContentView.swift
//  hw_05
//
//  Created by Dmitry Dementyev on 11.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image(uiImage: (contentViewModel.randomCat != nil ? UIImage(data:contentViewModel.randomCat!)! : UIImage(systemName: "heart.fill")) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:200, height:300)

                Image(uiImage: (contentViewModel.randomDog != nil ? UIImage(data:contentViewModel.randomDog!)! : UIImage(systemName: "heart.fill")) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:200, height:300)
            }
            Button(action: {
                self.contentViewModel.getPictures()
            }){
                Text("Show random pets")
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
