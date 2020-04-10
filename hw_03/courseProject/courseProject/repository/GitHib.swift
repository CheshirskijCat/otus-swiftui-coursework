//
//  GitHibModel.swift
//  courseProject
//
//  Created by Dmitry Dementyev on 10.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import GithubAPIpackage

class GitHub{
    
    func getCount(query: String, complition: @escaping (Int) -> ()){
        request(query: query, order: .desc) { body in
            complition(body?.totalCount ?? 0)
        }
    }
    
    private func request(query: String, order: Order, complition: @escaping (RepositoryList?) -> ()) {
        SearchAPI.searchReposGet(q: query, order: order) { body, error in
            complition(body)
        }
    }

}
