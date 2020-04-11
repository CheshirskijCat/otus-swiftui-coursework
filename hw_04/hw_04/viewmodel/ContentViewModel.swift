//
//  ContentViewModel.swift
//  hw_04
//
//  Created by Dmitry Dementyev on 11.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject{
    
    @Published private(set) var data = [TodoObject]()
    var network: NetworkService?
    var cache: CacheService?
    
    init(){
        network = ServiceLocator.shared.getService()
        cache = ServiceLocator.shared.getService()
        getTodoList()
    }
    
    func getTodoList(){
        if let localCache = cache?.getCache(){
            data = localCache
        } else {
            network?.fetch(url: "/todos") { (result: Result<[TodoObject], Error>) in
                switch result{
                case .failure(let error):
                    print(error)
                case .success(let response):
                    DispatchQueue.main.async {
                        self.data.append(contentsOf: response.enumerated().map{ r in
                                            TodoObject(userId: r.element.userId,
                                                       id: r.element.id,
                                                       title: r.element.title,
                                                       completed: r.element.completed)
                        })
                    }

                }
            }
        }

    }
}
