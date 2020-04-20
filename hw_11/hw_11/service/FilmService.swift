//
//  FilmService.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 19.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class FilmService{

    private let FILMS_UPLOAD_DATE = "film_data_expire"
    private let FILMS_DATA_EXPIRE: Double = 86400.0

    func getFilms(completion: @escaping ([FilmEntity]) -> ()){
        if checkForUpdate() {
            uploadFilmsData(completion: completion)
        } else {
            getPersistenceData(completion: completion)
        }
    }

    private func checkForUpdate() -> Bool {
        let lastData = UserDefaults.standard.double(forKey: FILMS_UPLOAD_DATE)
        return Date().timeIntervalSince1970 - lastData > FILMS_DATA_EXPIRE
    }

    private func uploadFilmsData(completion: @escaping ([FilmEntity]) -> ()) {
        FilmRequest().getFilms{ [weak self] films in
            completion(films)
            DispatchQueue.main.sync {
                FilmPersistence().update(data: films)
            }
            if self != nil {
                UserDefaults.standard.set(Date().timeIntervalSince1970 as Double, forKey: self!.FILMS_UPLOAD_DATE)
            }
        }
    }

    private func getPersistenceData(completion: @escaping ([FilmEntity]) -> ()){
        FilmPersistence().retrive(completion: completion)
    }

}
