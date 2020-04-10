//
//  LineController.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

final class LineViewModel: ObservableObject{
    
    private static var cache = [Double]()
    
    @Published private(set) var data = cache
    @Published private(set) var title = "Histogram"
    @Published private(set) var legend = "synthetic data"

    init(){
        LineViewModel.cache = Histogram().histogram
                                         .sorted(by:{(Int($0.0) ?? 0) < (Int($1.0) ?? 0)})
                                         .map(_:){Double($0.1)}
    }
}
