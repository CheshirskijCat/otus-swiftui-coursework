//
//  LineView.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct LineView: View {
    
    @State private var lineViewModel = LineViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            LineChartView(data: lineViewModel.data,
                          title: lineViewModel.title,
                          legend: lineViewModel.legend)
        }
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.5))

    }
}
