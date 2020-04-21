//
//  FilmPersistence.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 19.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class FilmPersistence{

    let realm = try? Realm()

    func retrive(observer: AnyObserver<Any>){
         DispatchQueue.main.async {
             let films = self.realm?.objects(FilmEntity.self)
             if films == nil {
                 // observer.onError()
             }else{
                 observer.onNext(Array(films!))
             }
             observer.onCompleted()
         }
     }
    
    func update(data: [FilmEntity]){
        DispatchQueue.main.async {
            do {
                let result = self.realm?.objects(FilmEntity.self)
                guard (result != nil) else { return }
                self.realm?.beginWrite()
                self.realm?.delete(result!)
                self.realm?.add(data)
                try self.realm?.commitWrite()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}
