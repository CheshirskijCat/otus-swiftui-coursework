//
//  BarView.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct BarView: View {
    
    @State private var barViewModel = BarViewModel()
    
    var body: some View {
        VStack(spacing: 10){
            BarChartView(data: ChartData(values: barViewModel.data),
                         title: barViewModel.title,
                         legend: barViewModel.legend)
        }
        .transition(.scale)
        .animation(.easeInOut(duration: 0.5))
        
    }
    
}
