//
//  SwiftSuffixArrayManipulator.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 21/07/2019.
//

import Foundation

struct SwiftSuffixArrayStruct: Codable {
    let search1equalEntry: TimeInterval
    let search5equalEntry: TimeInterval
    let search10equalEntry: TimeInterval
    let search1startEntry: TimeInterval
    let search5startEntry: TimeInterval
    let search10startEntry: TimeInterval
}

open class SwiftSuffixArrayManipulator : TestStructureManipulator {

    fileprivate var setToManipulate = Set<String>()
    fileprivate let generator = StringGenerator()
    
    fileprivate var data: SwiftSuffixArrayStruct?
    fileprivate let structFileName = "swiftsuffixarray"
    
    private static let suffixArray: [(String, String)] = {
        var suffixTuples: [(String, String)] = []
        for algo in AlgoProvider().all{
            let trimedAlgo = algo.filter(StringGenerator.alphanumericChars.contains)
            let suffixSequence = SuffixSequence(string: trimedAlgo)
            for subString in suffixSequence{
                suffixTuples.append((String(subString), algo))
            }
        }
        suffixTuples.sort(by: {$0.0 < $1.0})
        return suffixTuples
    }()
    
    open func getTableData() -> [(String, TimeInterval)] {
       data = SwiftSuffixArrayStruct(search1equalEntry: search1equalEntry(),
                                      search5equalEntry: search5equalEntry(),
                                      search10equalEntry: search10equalEntry(),
                                      search1startEntry: search1startEntry(),
                                      search5startEntry: search5startEntry(),
                                      search10startEntry: search10startEntry())
        return[("search1equalEntry", data!.search1equalEntry),
               ("search5equalEntry", data!.search5equalEntry),
               ("search10equalEntry", data!.search10equalEntry),
               ("search1startEntry", data!.search1startEntry),
               ("search5startEntry", data!.search5startEntry),
               ("search10startEntry", data!.search10startEntry)]
    }

    open func getCachedTableData() -> [(String, TimeInterval)]? {
        guard let tableData: SwiftSuffixArrayStruct = StructuresStorage.retrive(from: structFileName) else{ return nil }
        return[("search1equalEntry", tableData.search1equalEntry),
               ("search5equalEntry", tableData.search5equalEntry),
               ("search10equalEntry", tableData.search10equalEntry),
               ("search1startEntry", tableData.search1startEntry),
               ("search5startEntry", tableData.search5startEntry),
               ("search10startEntry", tableData.search10startEntry)]
    }

    open func cacheTableData() {
        if data == nil { return }
        StructuresStorage.store(data, to: structFileName)
    }
    
    func getInitialTest() -> TimeInterval {
        return search10equalEntry()
    }
    
    open func setupWithObjectCount(_ objectCount: Int) -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.setToManipulate = Set<String>(minimumCapacity: objectCount)
            for _ in 0 ..< objectCount {
                self.setToManipulate.insert(self.generator.randomTripleCharacterString())
            }
        }
    }
    
    //MARK: Add tests
    
    fileprivate func searchEqualEntry(_ count: Int) -> TimeInterval {
        var counter = 0
        let timed = Profiler.runClosureForTime() {
            test: for suffix in SwiftSuffixArrayManipulator.suffixArray {
                for gen in self.setToManipulate {
                    if (counter == counter){ break test}
                    if (suffix.0 == gen){
                        counter += 1
                    }
                }
            }
        }
        return timed
    }
    
    open func search1equalEntry() -> TimeInterval {
        return searchEqualEntry(1)
    }
    
    open func search5equalEntry() -> TimeInterval {
        return searchEqualEntry(5)
    }
    
    open func search10equalEntry() -> TimeInterval {
        return searchEqualEntry(10)
    }
    
    //MARK: Remove tests
    
    fileprivate func searchStartEntry(_ count: Int) -> TimeInterval {
        var counter = 0
        let timed = Profiler.runClosureForTime() {
            test: for suffix in SwiftSuffixArrayManipulator.suffixArray {
                for gen in self.setToManipulate {
                    if (counter == counter){ break test}
                    if (suffix.0.starts(with: gen)){
                        counter += 1
                    }
                }
            }
        }
        return timed
    }
    
    open func search1startEntry() -> TimeInterval {
        return searchStartEntry(1)
    }
    
    open func search5startEntry() -> TimeInterval {
        return searchStartEntry(5)
    }
    
    open func search10startEntry() -> TimeInterval {
        return searchStartEntry(10)
    }
    
}
