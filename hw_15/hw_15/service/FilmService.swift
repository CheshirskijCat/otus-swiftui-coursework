//
//  FilmService.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 19.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import RxSwift

class FilmService{

    private static let FILMS_UPLOAD_DATE = "film_data_expire"
    private static let FILMS_DATA_EXPIRE: Double = 86400.0

    func getFilms() -> Observable<Any>{
        return Observable.create{ observer in
            if self.checkForUpdate() {
                self.uploadFilmsData(observer: observer)
            } else {
                self.getPersistenceData(observer: observer)
            }
            return Disposables.create()
        }
    }

    private func checkForUpdate() -> Bool {
        let lastData = UserDefaults.standard.double(forKey: FilmService.FILMS_UPLOAD_DATE)
        return Date().timeIntervalSince1970 - lastData > FilmService.FILMS_DATA_EXPIRE
    }

    func uploadFilmsData(observer: AnyObserver<Any>) {
        FilmRequest().getFilms{ films in
            DispatchQueue.main.sync {
                FilmPersistence().update(data: films)
                observer.onNext(films)
                observer.onCompleted()
            }

            UserDefaults.standard.set(Date().timeIntervalSince1970 as Double, forKey: FilmService.FILMS_UPLOAD_DATE)
        }
    }

    func getPersistenceData(observer: AnyObserver<Any>){
        FilmPersistence().retrive(observer: observer)
    }

}
