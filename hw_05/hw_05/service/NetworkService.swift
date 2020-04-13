//
//  NetworkService.swift
//  hw_05
//
//  Created by Dmitry Dementyev on 12.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class NetworkService{
    
    func fetch<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> ()){
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
    
    func fetchData(url: URL, completion: @escaping (Result<Data, Error>) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error, data == nil{
                completion(.failure(error))
            }
            completion(.success(data!))
        }.resume()
    }
}
