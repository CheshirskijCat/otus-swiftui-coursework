//
//  StructuresStorage.swift
//  hw_12
//
//  Created by Dmitry Dementyev on 20.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class StructuresStorage {

    static let directory = FileManager.SearchPathDirectory.documentDirectory

    static func store<T: Encodable>(_ object: T, to filename: String){
        let url = getUrl(for: directory).appendingPathComponent(filename, isDirectory: false)

        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(object)
            print (data)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            fatalError("Cannot store data")
        }
    }

    static func retrive<T: Decodable>(from filename: String) -> T?{
        let url = getUrl(for: directory).appendingPathComponent(filename, isDirectory: false)

        guard FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }

        if let data = FileManager.default.contents(atPath: url.path){
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(T.self, from: data)
                return model
            } catch {
                fatalError("Cannot retrive data")
            }
        } else {
            fatalError("No data at \(url.path)")
        }
    }

    static private func getUrl(for directory: FileManager.SearchPathDirectory) -> URL {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Cannot create folder")
        }
        return url
    }

}
