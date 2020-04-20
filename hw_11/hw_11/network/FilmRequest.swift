//
//  FilmRequest.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 19.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class FilmRequest{

    private let FILM_URL = "https://ghibliapi.herokuapp.com/films"

    func getFilms(completion: @escaping ([FilmEntity]) -> () ) {
        BaseRequest().getRequest(url: FILM_URL) { (json, data) in
            var films = [FilmEntity]()
            let filmData = JSON(json).array
            if (filmData != nil) {
                for item in filmData! {
                    films.append(FilmEntity.init(data: item))
                }
            }
            completion(films)
        }
    }
}
