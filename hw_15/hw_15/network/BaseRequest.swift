//
//  BaseRequest.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 19.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

struct BaseRequest {

    let session = URLSession.shared

    func getRequest(url: String, complition: @escaping (_ json: Any, _ data: Data) -> Void){
        request(url: url, method: "GET", complition: complition)
    }

    func request(url: String,
                 method: String,
                 complition: @escaping (_ json: Any, _ data: Data) -> Void) {

        guard let url = URL(string: url) else { return print("ERROR") }
        var request = URLRequest(url: url)
        request.httpMethod = method

        let task = session.dataTask(with: url) { data, response, error in
            if error != nil || data == nil || response == nil {
                print("Request error: \(error as? String ?? "Unknown")")
                return
            }

            guard let urlResponse = response as? HTTPURLResponse else {
                return
            }

            print("Server response code \(urlResponse.statusCode)")
            if !(200...299).contains(urlResponse.statusCode) {
                return
            }

            let mi = urlResponse.mimeType
            guard let mime = urlResponse.mimeType, mime == "application/json" else {
                print("Wrong MIME type! \(String(describing: mi))")
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                complition(json, data!)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
}
