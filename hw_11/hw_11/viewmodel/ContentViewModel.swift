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
        FilmService().getFilms{ films in
            DispatchQueue.main.async {
                self.items = films
            }
         }
    }
}
