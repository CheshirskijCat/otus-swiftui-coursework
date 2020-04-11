//
//  CacheService.swift
//  hw_04
//
//  Created by Dmitry Dementyev on 11.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class CacheService{
    
    static let TODO_LIST:String = "todolist"
    
    func saveCache(data: [TodoObject]){
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: CacheService.TODO_LIST)
    }
    
    func getCache() -> [TodoObject]? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: CacheService.TODO_LIST) as? [TodoObject]
    }
    
}
