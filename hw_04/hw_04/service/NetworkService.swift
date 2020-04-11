//
//  NetworkService.swift
//  hw_04
//
//  Created by Dmitry Dementyev on 11.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class NetworkService{
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


