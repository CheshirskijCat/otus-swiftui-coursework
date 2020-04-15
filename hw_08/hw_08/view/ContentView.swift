//
//  ContentView.swift
//  hw_08
//
//  Created by Dmitry Dementyev on 15.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var state = CountryCode.us
    @State private var text = ShareExtension()
    
    var body: some View {
        VStack {
            Picker(selection: $state, label: Text("")) {
                Text("USA").tag(CountryCode.us)
                Text("China").tag(CountryCode.zh)
                Text("France").tag(CountryCode.fr)
                Text("Russia").tag(CountryCode.ru)
            }.pickerStyle(SegmentedPickerStyle())

            Text(self.text.convert(self.state.locale))
                .frame(height:150, alignment: .center)
                .lineLimit(nil)
            
        }
        .padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
