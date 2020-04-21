//
//  ContentView.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 17.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//
import Foundation
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private (set) var content: ContentViewModel
    
    var body: some View {
        NavigationView {
            List(content.items){ item in
                NavigationLink(destination: FilmView()
                    .environmentObject(FilmViewModel(film:item))) {
                        Text(item.title ?? "")
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
