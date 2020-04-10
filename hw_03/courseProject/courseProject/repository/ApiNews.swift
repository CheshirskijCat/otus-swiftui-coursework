//
//  ApiNewsModel.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import NewsAPIpackage

class ApiNews{
    
    private static let API_KEY = "22459a847e55437ab63acdc00d158f8b"
    
    func getCount(query: String, from: String, complition: @escaping (Int) -> ()){
        request(query: query, from: from, sort: "publishedAt") { body in
            complition(body?.totalResults ?? 0)
        }
    }
    
    private func request(query: String, from: String, sort: String, complition: @escaping ((ArticleList?) -> ())) {
        ArticlesAPI.everythingGet(q: query, from: from, sortBy: sort, apiKey: ApiNews.API_KEY) { (list, error) in
            complition(list)
        }
    }
}
