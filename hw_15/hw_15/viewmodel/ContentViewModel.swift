//
//  ContentViewModel.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 19.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class ContentViewModel: ObservableObject{
    
    @Published var items = [FilmEntity]()
    
    init(){
        var arr = [1,8,9,5,9,6,4,7,5,1]
        let n = arr.count

        for i in 0..<n {
            if arr[abs(arr[i]) - 1] >= 0{
                arr[abs(arr[i]) - 1] = -arr[abs(arr[i]) - 1]
            }else{
                print(abs(arr[i]))
            }
        }
        
        _ = FilmService().getFilms().subscribe({ event in
             switch event {
             case .next(let films):
                self.items = films as! [FilmEntity]
                 print("next : \(films)")
                 break
             case .error(let error):
                 print("error : \(error)")
                 break
             case .completed:
                 print("completed")
                 break
             }
         })
    }
}
