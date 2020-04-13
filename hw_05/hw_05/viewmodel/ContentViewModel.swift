//
//  ContentViewModel.swift
//  hw_05
//
//  Created by Dmitry Dementyev on 12.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject{
    
    @Published private(set) var randomCat: Data?
    @Published private(set) var randomDog: Data?
    
    private let catUrl = "https://aws.random.cat/meow"
    private let dogUrl = "https://random.dog/woof.json"

    func getPictures(){
        let randomCatFeature = Future<String,Error> { promise in
            guard let randomUrl = URL(string: self.catUrl) else {
                promise(.failure(PromiseError(message: "Wrong URL")))
                return
            }
            DispatchQueue.main.async {
                NetworkService().fetch(url: randomUrl){ (result: Result<Cat, Error>) in
                    do {
                        let data = try result.get() as Cat
                        print("file \(data.file)")
                        promise(.success(data.file))
                    } catch {
                        promise(.failure(PromiseError(message: "Wrong Response")))
                    }
                }
            }
        }.flatMap { url in
            Future<Data,Error> { promise in
                guard let catUrl = URL(string: url) else {
                    promise(.failure(PromiseError(message: "Wrong URL")))
                    return
                }
                DispatchQueue.main.async {
                    NetworkService().fetchData(url: catUrl){ (result: Result<Data, Error>) in
                        do {
                            let data = try result.get() as Data
                            promise(.success(data))
                        } catch {
                            promise(.failure(PromiseError(message: "Wrong Response")))
                        }
                    }
                }
            }
        }
        .receive(on: DispatchQueue.main)

        let randomDogFeature = Future<String,Error> { promise in
            guard let randomUrl = URL(string: self.dogUrl) else {
                promise(.failure(PromiseError(message: "Wrong URL")))
                return
            }
            DispatchQueue.main.async {
                NetworkService().fetch(url: randomUrl){ (result: Result<Dog, Error>) in
                    do {
                        let data = try result.get() as Dog
                        promise(.success(data.url))
                    } catch {
                        promise(.failure(PromiseError(message: "Wrong Response")))
                    }
                }
            }
        }.flatMap { url in
            Future<Data,Error> { promise in
                guard let catUrl = URL(string: url) else {
                    promise(.failure(PromiseError(message: "Wrong URL")))
                    return
                }
                DispatchQueue.main.async {
                    NetworkService().fetchData(url: catUrl){ (result: Result<Data, Error>) in
                        do {
                            let data = try result.get() as Data
                            promise(.success(data))
                        } catch {
                            promise(.failure(PromiseError(message: "Wrong Response")))
                        }
                    }
                }
            }
        }
        .receive(on: DispatchQueue.main)

        Publishers.Zip(randomCatFeature, randomDogFeature)
        .sink(receiveCompletion: { (error) in
            print("Complition result: \(String(describing: error))")
        }, receiveValue: { (result) in
            self.randomCat = result.0
            self.randomDog = result.1
        })
    }
}
