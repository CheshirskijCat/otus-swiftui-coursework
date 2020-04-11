//
//  TodoDTO.swift
//  hw_04
//
//  Created by Dmitry Dementyev on 11.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

struct TodoObject: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
