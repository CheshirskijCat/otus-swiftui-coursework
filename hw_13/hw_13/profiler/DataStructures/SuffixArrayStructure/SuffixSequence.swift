//
//  SuffixArray.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 03/09/2019.
//

import Foundation

struct SuffixSequence: Sequence {
    let string: String
    
    func makeIterator() -> SuffixIterator{
        return SuffixIterator(string: string)
    }
}
