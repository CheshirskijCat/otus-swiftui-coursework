//
//  SwiftDictionaryManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

struct SwiftDictionaryStruct: Codable {
    let add1Entry: TimeInterval
    let add5Entries: TimeInterval
    let add10Entries: TimeInterval
    let remove1Entry: TimeInterval
    let remove5Entries: TimeInterval
    let remove10Entries: TimeInterval
    let lookup1EntryTime: TimeInterval
    let lookup10EntriesTime: TimeInterval
}

class SwiftDictionaryManipulator: TestStructureManipulator {
    
    fileprivate var data: SwiftDictionaryStruct?
    fileprivate let structFileName = "swiftdictionary"
    
    var intDictionary = [Int: Int]()
    
    open func getTableData() -> [(String, TimeInterval)] {
        data = SwiftDictionaryStruct(add1Entry: add1Entry(),
                                      add5Entries: add5Entries(),
                                      add10Entries: add10Entries(),
                                      remove1Entry: remove1Entry(),
                                      remove5Entries: remove5Entries(),
                                      remove10Entries: remove10Entries(),
                                      lookup1EntryTime: lookup1EntryTime(),
                                      lookup10EntriesTime: lookup10EntriesTime())
         return[("add1Entry", data!.add1Entry),
                ("add5Entries", data!.add5Entries),
                ("add10Entries", data!.add10Entries),
                ("remove1Entry", data!.remove1Entry),
                ("remove5Entries", data!.remove5Entries),
                ("remove10Entries", data!.remove10Entries),
                ("lookup1EntryTime", data!.lookup1EntryTime),
                ("lookup10EntriesTime", data!.lookup10EntriesTime)]
    }

    open func getCachedTableData() -> [(String, TimeInterval)]? {
         guard let tableData: SwiftDictionaryStruct = StructuresStorage.retrive(from: structFileName) else{ return nil }
         return[("add1Entry", tableData.add1Entry),
                ("add5Entries", tableData.add5Entries),
                ("add10Entries", tableData.add10Entries),
                ("remove1Entry", tableData.remove1Entry),
                ("remove5Entries", tableData.remove5Entries),
                ("remove10Entries", tableData.remove10Entries),
                ("lookup1EntryTime", tableData.lookup1EntryTime),
                ("lookup10EntriesTime", tableData.lookup10EntriesTime)]
    }
    
    open func cacheTableData() {
         if data == nil { return }
         StructuresStorage.store(data, to: structFileName)
     }
    
    func getInitialTest() -> TimeInterval {
        return lookup10EntriesTime()
    }
    
    //MARK: Setup
    
    func setupWithObjectCount(_ count: Int) -> TimeInterval {
        return Profiler.runClosureForTime() {
            for i in 0 ..< count {
                self.intDictionary.updateValue(i, forKey: i)
            }
        }
    }
    
    fileprivate func nextElement() -> Int {
        return intDictionary.count + 1
    }
    
    //MARK: Adding entries
    
    func addEntries(_ count: Int) -> TimeInterval {
        var array = [Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            array.append(plusI)
        }
        
        let time = Profiler.runClosureForTime() {
            for key in array {
                self.intDictionary.updateValue(key, forKey: key)
            }
        }
        
        //Restore to original state
        for key in array {
            intDictionary.removeValue(forKey: key)
        }
        
        return time
    }
    
    func add1Entry() -> TimeInterval {
        return addEntries(1)
    }
    func add5Entries() -> TimeInterval {
        return addEntries(5)
    }
    func add10Entries() -> TimeInterval {
        return addEntries(10)
    }
    
    //MARK: Removing entries
    
    func removeEntries(_ count: Int) -> TimeInterval {
        var array = [Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            array.append(plusI)
        }
        
        for key in array {
            intDictionary.updateValue(key, forKey: key)
        }
        
        return Profiler.runClosureForTime() {
            //Restore to original state
            for key in array {
                self.intDictionary.removeValue(forKey: key)
            }
        }
    }
    
    func remove1Entry() -> TimeInterval {
        return removeEntries(1)
    }
    
    func remove5Entries() -> TimeInterval {
        return removeEntries(5)
    }
    
    func remove10Entries() -> TimeInterval {
        return removeEntries(10)
    }
    
    //MARK: Looking up entries
    
    func lookupEntries(_ count: Int) -> TimeInterval {
        var array = [Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            array.append(plusI)
        }
        
        for key in array {
            intDictionary.updateValue(key, forKey: key)
        }
        
        let time = Profiler.runClosureForTime() {
            //Look up by key
            for key in array {
                let _ = self.intDictionary[key]
            }
        }
        
        //Restore to original state
        for key in array {
            intDictionary.removeValue(forKey: key)
        }
        
        return time
    }
    
    func lookup1EntryTime() -> TimeInterval {
        return lookupEntries(1)
    }
    
    func lookup10EntriesTime() -> TimeInterval {
        return lookupEntries(10)
    }
}
