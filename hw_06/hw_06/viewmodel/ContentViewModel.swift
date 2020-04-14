//
//  ContentViewModel.swift
//  hw_06
//
//  Created by Dmitry Dementyev on 13.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class ContentViewModel : ObservableObject{
    
    @Published var list = [String]()
    
    init() {
        updateList()
    }
    
    public func updateList(search: String = ""){
        if search.isEmpty {
            self.list =  TestStructures().all
        }else{
            self.list = TestStructures().all.filter{ (item) -> Bool in
                    item.lowercased().hasPrefix(search.lowercased())
                }
        }
    }
}
