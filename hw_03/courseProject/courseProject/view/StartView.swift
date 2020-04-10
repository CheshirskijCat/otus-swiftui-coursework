//
//  StartView.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct StartView: View {

    @State private var selection = 0
    @State private var endpoints = ["Pie", "Bar", "Line"]

    var body: some View {
        VStack {
            Spacer()

            Button(action: {
                AppState.shared.toggleOverlay()
            }){
                Text("Toggle Overlay")
            }

            Spacer()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
