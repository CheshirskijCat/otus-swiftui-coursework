//
//  TestAlgoFactory.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 02/09/2019.
//

import Foundation

struct TestStructureFactory{
    public func getTestManipulator(_ structureName: String) -> TestStructureManipulator {
        let structure = Structures(rawValue: structureName) ?? Structures.Array
        switch structure {
            case .Array:
                return SwiftArrayManipulator()
            case .Set:
                return SwiftSetManipulator()
            case .Dictionary:
                return SwiftDictionaryManipulator()
            case .SuffixArray:
                return SwiftSuffixArrayManipulator()
            default:
                return SwiftArrayManipulator()
        }
    }
}
