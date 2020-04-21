//
//  ContentViewModel.swift
//  hw_06
//
//  Created by Dmitry Dementyev on 13.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class ContentViewModel : ObservableObject{
    
    @Published var list = [(String, Double)]()
    private var algoList = [(String, Double)]()
    
    init() {
        algoList = TestStructures().all.map{ it -> (String, Double) in
            (it, 0)
        }
        
        let scheduler = JobScheduler(items: algoList)
        scheduler.onResult{ items in
            print("all done | items count : \(items.count)")
            self.algoList = items
            self.list = items
        }
        scheduler.execute()
    }
    
    public func updateList(search: String = ""){
        if search.isEmpty {
            self.list =  self.algoList
        }else{
            self.list = self.algoList.filter{ (item) -> Bool in
                    item.0.lowercased().hasPrefix(search.lowercased())
                }
        }
    }
}
