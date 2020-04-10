//
//  BarController.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

final class BarViewModel: ObservableObject{
    
    private static var cache = [(String, Double)]()
    @Published private(set) var data = cache
    @Published private(set) var title = "News api"
    @Published private(set) var legend = "number of articles"

    init(){
        if (BarViewModel.cache.isEmpty){
            DispatchQueue.main.async {
                ApiNews().getCount(query:"apple", from: "2020-3-10"){ count in
                    BarViewModel.cache.append(("apple", Double(count)))
                }
                ApiNews().getCount(query:"bitcoin", from: "2020-3-10"){ count in
                    BarViewModel.cache.append(("bitcoin", Double(count)))
                }
                ApiNews().getCount(query:"nginx", from: "2020-3-10"){ count in
                    BarViewModel.cache.append(("nginx", Double(count)))
                }
            }
        }
    }
}
