//
//  AlgoTestViewModel.swift
//  hw_06
//
//  Created by Dmitry Dementyev on 13.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class AlgoTestViewModel: ObservableObject{
   
    @Published var title: String
    @Published var list = [(String, TimeInterval)]()
    @Published var ableToStart = true
    private var number = 1
    
    init(structure: String){
        self.title = structure
    }
    
    func startTest(){
        self.ableToStart = false
        let manipulator = TestStructureFactory().getTestManipulator(self.title)
        DispatchQueue.global(qos: .background).async {
            _ = manipulator.setupWithObjectCount(self.number)
            DispatchQueue.main.async {
                self.list = manipulator.getTableData()
                self.ableToStart = true
            }
        }
    }
    
    func getNumberOfItems(_ value: Float) -> Int{
        var numberOfItems = Int(ceil(powf(value * 100.0, 4)))
        if (numberOfItems > 100000){
            numberOfItems = Int(ceil(Float(numberOfItems) / 1000)) * 1000
        }
        self.number = numberOfItems
        return numberOfItems
    }

}
