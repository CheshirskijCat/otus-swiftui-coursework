//
//  FilmEntity.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 19.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class FilmEntity: ObjClass, Identifiable{
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var title: String?
    @objc dynamic var filmDescription: String?
    @objc dynamic var director: String?
    @objc dynamic var producer: String?
    @objc dynamic var releaseDate: String?
    @objc dynamic var rtScore: String?

    convenience required init(data: JSON){
        self.init()
        self.id = data["id"].string ?? UUID().uuidString
        self.title = data["title"].string
        self.filmDescription = data["description"].string
        self.director = data["director"].string
        self.producer = data["producer"].string
        self.releaseDate = data["release_date"].string
        self.rtScore = data["rt_score"].string

    }
}
