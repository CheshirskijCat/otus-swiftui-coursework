//
//  ContentViewModel.swift
//  hw_14 iOS
//
//  Created by Dmitry Dementyev on 02.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class ContentViewModel : ObservableObject{
    
    @Published var list = [(String, Double)]()
    private var algoList = [(String, Double)]()

}
