//
//  SuffixIterator.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 03/09/2019.
//

import Foundation

struct SuffixIterator: IteratorProtocol {
    
    let string: String
    let last: String.Index
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        self.last = string.endIndex
        self.offset = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < last else {
            return nil
        }
        let sub: Substring = string[offset..<last]
        string.formIndex(after: &offset)
        return sub
    }
}
