//
//  PieView.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct PieView: View {
    
    @State private var pieViewModel = PieViewModel()

    var body: some View {
        VStack(spacing: 10){
            PieChartView(data: pieViewModel.data,
                          title: pieViewModel.title,
                          legend: pieViewModel.legend)
        }
        .offset()
        .transition(.slide)
        .animation(.easeInOut(duration: 0.5))
    }
}
