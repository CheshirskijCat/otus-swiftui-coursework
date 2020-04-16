//
//  AlgoView.swift
//  hw_06
//
//  Created by Dmitry Dementyev on 14.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct AlgoView: View {
    
    private var title: String = ""
    private var time: String = ""
    
    init(title: String, time: TimeInterval){
        self.title = title
        self.time = String(ceil(time * 10000) / 10000)
    }
    
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Text(time)
        }
    }
}
