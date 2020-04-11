//
//  File.swift
//  hw_04
//
//  Created by Dmitry Dementyev on 11.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

//
//  JsonPlaceholderProvider.swift
//  007_generics
//
//  Created by Dmitry Dementyev on 13/07/2019.
//  Copyright © 2019 Dmitry Dementyev. All rights reserved.
//

import Foundation

struct PlaceHolder: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

final class JsonPlaceholderProvider{
    private let baseURL = URL(string: "https://jsonplaceholder.typicode.com")
    
    func fetch<T: Codable>(url: String, completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = baseURL?.appendingPathComponent(url) else{
            print("bad URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            do {
                if let data = data{
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(response))
                }
            } catch let err{
                completion(.failure(err))
            }
        }.resume()
    }
}
