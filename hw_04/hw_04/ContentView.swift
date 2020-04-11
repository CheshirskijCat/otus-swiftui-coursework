//
//  ContentView.swift
//  hw_04
//
//  Created by Dmitry Dementyev on 11.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var contentViewModel: ContentViewModel

    var body: some View {
        List(self.contentViewModel.data){ todo in
            Text(todo.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContentViewModel())
    }
}
