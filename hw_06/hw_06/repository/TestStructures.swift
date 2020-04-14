//
//  TestAlgo.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 02/09/2019.
//

import Foundation

struct TestStructures{
    
    var all: [String] {
        var structures: [String] = []
        for structure in Structures.allCases{
            structures.append(structure.rawValue)
        }
        return structures
    }
    
    func getStructure(_ index: Int) -> String{
        return all[index]
    }
    
}

enum Structures: String, CaseIterable{
    case Array
    case Set
    case Dictionary
    case SuffixArray
}
