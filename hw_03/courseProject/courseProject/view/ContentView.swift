//
//  ContentView.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 22.01.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0
    @State private var endpoints = ["Pie", "Bar", "Line"]

    var body: some View {
        VStack {
            Picker(selection: $selection, label: Text("3 source of charts")) {
                ForEach(0 ..< endpoints.count) { i in
                    Text(self.endpoints[i]).tag(i)
                }
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()

            if self.selection == 0 {
                PieView()
            } else if self.selection == 1 {
                BarView()
            } else if self.selection == 2 {
                LineView()
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
