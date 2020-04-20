//
//  FilmViewModel.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 20.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class FilmViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var filmDescription = ""
    @Published var director = ""
    @Published var producer = ""
    @Published var releaseDate = ""
    @Published var rtScore = ""
    
    init(film: FilmEntity){
        self.title = film.title ?? ""
        self.filmDescription = film.filmDescription ?? ""
        self.director = film.director ?? ""
        self.producer = film.producer ?? ""
        self.releaseDate = film.releaseDate ?? ""
        self.rtScore = film.rtScore ?? ""
    }
    
}
