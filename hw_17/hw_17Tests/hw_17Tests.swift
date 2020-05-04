//
//  hw_17Tests.swift
//  hw_17Tests
//
//  Created by Dmitry Dementyev on 03.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import XCTest
@testable import hw_17

typealias Data = (String, TimeInterval)

class hw_17Tests: XCTestCase {

    var arrayStructure: SwiftArrayManipulator?
    var suffixStructure: SwiftSuffixArrayManipulator?
    var setStructure: SwiftSetManipulator?
    var dictionaryStructure: SwiftDictionaryManipulator?

    override func setUp() {
        super.setUp()
        arrayStructure = SwiftArrayManipulator()
        setStructure = SwiftSetManipulator()
        dictionaryStructure = SwiftDictionaryManipulator()
        suffixStructure = SwiftSuffixArrayManipulator()
    }

    override func tearDown() {
        arrayStructure = nil
        super.tearDown()
    }

    func testSet() {
        _ = setStructure?.setupWithObjectCount(10000)
        let data: [Data] = setStructure?.getTableData() ?? [Data]()
        let testMethods: [String] = data.compactMap{$0.0}
        XCTAssert(testMethods.contains("add1Object"), "contains in output dataset: add1Object")
        XCTAssert(testMethods.contains("add5Objects"), "contains in output dataset: add5Objects")
        XCTAssert(testMethods.contains("add10Objects"), "contains in output dataset: add10Objects")
        XCTAssert(testMethods.contains("remove1Object"), "contains in output dataset: remove1Object")
        XCTAssert(testMethods.contains("remove5Objects"), "contains in output dataset: remove5Objects")
        XCTAssert(testMethods.contains("remove10Objects"), "contains in output dataset: remove10Objects")
        XCTAssert(testMethods.contains("lookup1Object"), "contains in output dataset: lookup1Object")
        XCTAssert(testMethods.contains("lookup10Objects"), "contains in output dataset: lookup10Objects")
    }

    func testArray() {
        _ = arrayStructure?.setupWithObjectCount(10000)
        let data: [Data] = arrayStructure?.getTableData() ?? [Data]()
        let testMethods: [String] = data.compactMap{$0.0}
        XCTAssert(testMethods.contains("insertNewObjectAtBeginning"), "contains in output dataset: insertNewObjectAtBeginning")
        XCTAssert(testMethods.contains("insertNewObjectInMiddle"), "contains in output dataset: insertNewObjectInMiddle")
        XCTAssert(testMethods.contains("insertNewObjectAtEnd"), "contains in output dataset: addNewObjectAtEnd")
        XCTAssert(testMethods.contains("removeFirstObject"), "contains in output dataset: removeFirstObject")
        XCTAssert(testMethods.contains("removeMiddleObject"), "contains in output dataset: removeMiddleObject")
        XCTAssert(testMethods.contains("removeLastObject"), "contains in output dataset: removeLastObject")
        XCTAssert(testMethods.contains("lookupByIndex"), "contains in output dataset: lookupByIndex")
        XCTAssert(testMethods.contains("lookupByObject"), "contains in output dataset: lookupByObject")
    }

    func testDictionary() {
        _ = dictionaryStructure?.setupWithObjectCount(10000)
        let data: [Data] = dictionaryStructure?.getTableData() ?? [Data]()
        let testMethods: [String] = data.compactMap{$0.0}
        XCTAssert(testMethods.contains("add1Entry"), "contains in output dataset: add1Entry")
        XCTAssert(testMethods.contains("add5Entries"), "contains in output dataset: add5Entries")
        XCTAssert(testMethods.contains("add10Entries"), "contains in output dataset: add10Entries")
        XCTAssert(testMethods.contains("remove1Entry"), "contains in output dataset: remove1Entry")
        XCTAssert(testMethods.contains("remove5Entries"), "contains in output dataset: remove5Entries")
        XCTAssert(testMethods.contains("remove10Entries"), "contains in output dataset: remove10Entries")
        XCTAssert(testMethods.contains("lookup1EntryTime"), "contains in output dataset: lookup1EntryTime")
        XCTAssert(testMethods.contains("lookup10EntriesTime"), "contains in output dataset: lookup10EntriesTime")
    }

    func testSuffix() {
        _ = suffixStructure?.setupWithObjectCount(10000)
        let data: [Data] = suffixStructure?.getTableData() ?? [Data]()
        let testMethods: [String] = data.compactMap{$0.0}
        XCTAssert(testMethods.contains("search1equalEntry"), "contains in output dataset: search1equalEntry")
        XCTAssert(testMethods.contains("search5equalEntry"), "contains in output dataset: search5equalEntry")
        XCTAssert(testMethods.contains("search10equalEntry"), "contains in output dataset: search10equalEntry")
        XCTAssert(testMethods.contains("search1startEntry"), "contains in output dataset: search1startEntry")
        XCTAssert(testMethods.contains("search5startEntry"), "contains in output dataset: search5startEntry")
        XCTAssert(testMethods.contains("search10startEntry"), "contains in output dataset: search10startEntry")
    }
    
    func testSetPerformance() {
        _ = setStructure?.setupWithObjectCount(10000)
        measure {
            _ = setStructure?.getTableData()
        }
    }
    
    func testArrayPerformance() {
        _ = arrayStructure?.setupWithObjectCount(10000)
        measure {
            _ = arrayStructure?.getTableData()
        }
    }
    
    func testDictionaryPerformance() {
        _ = dictionaryStructure?.setupWithObjectCount(10000)
        measure {
            _ = dictionaryStructure?.getTableData()
        }
    }
    
    func testSuffixPerformance() {
        _ = suffixStructure?.setupWithObjectCount(10000)
        measure {
            _ = suffixStructure?.getTableData()
        }
    }

}
