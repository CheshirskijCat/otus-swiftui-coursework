//
//  PieController.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

final class PieViewModel: ObservableObject{
    
    private static var cache = [Double]()
    
    @Published private(set) var data = cache
    @Published private(set) var title = "GitHub"
    @Published private(set) var legend = "number of repos"

    init(){
        if (PieViewModel.cache.isEmpty){
            DispatchQueue.main.async {
                GitHub().getCount(query:"objc"){ count in
                    PieViewModel.cache.append(Double(count))
                }
                GitHub().getCount(query:"swift"){ count in
                    PieViewModel.cache.append(Double(count))
                }
                GitHub().getCount(query:"kotlin"){ count in
                    PieViewModel.cache.append(Double(count))
                }
            }

        }
    }
}
