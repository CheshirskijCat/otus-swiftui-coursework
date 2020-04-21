//
//  SwiftSetManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 4/18/15.
//  Copyright (c) 2015 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

struct SwiftSetStruct: Codable {
    let add1Object: TimeInterval
    let add5Objects: TimeInterval
    let add10Objects: TimeInterval
    let remove1Object: TimeInterval
    let remove5Objects: TimeInterval
    let remove10Objects: TimeInterval
    let lookup1Object: TimeInterval
    let lookup10Objects: TimeInterval
}

open class SwiftSetManipulator : TestStructureManipulator {
    
    fileprivate var setToManipulate = Set<String>()
    fileprivate let generator = StringGenerator()
    
    fileprivate var data: SwiftSetStruct?
    fileprivate let structFileName = "swiftset"
    
    open func getTableData() -> [(String, TimeInterval)] {
       data = SwiftSetStruct(add1Object: add1Object(),
                              add5Objects: add5Objects(),
                              add10Objects: add10Objects(),
                              remove1Object: remove1Object(),
                              remove5Objects: remove5Objects(),
                              remove10Objects: remove10Objects(),
                              lookup1Object: lookup1Object(),
                              lookup10Objects: lookup10Objects())
        return[("add1Object", data!.add1Object),
               ("add5Objects", data!.add5Objects),
               ("add10Objects", data!.add10Objects),
               ("remove1Object", data!.remove1Object),
               ("remove5Objects", data!.remove5Objects),
               ("remove10Objects", data!.remove10Objects),
               ("lookup1Object", data!.lookup1Object),
               ("lookup10Objects", data!.lookup10Objects)]
    }

    open func getCachedTableData() -> [(String, TimeInterval)]? {
        guard let tableData: SwiftSetStruct = StructuresStorage.retrive(from: structFileName) else{ return nil }
        return[("add1Object", tableData.add1Object),
               ("add5Objects", tableData.add5Objects),
               ("add10Objects", tableData.add10Objects),
               ("remove1Object", tableData.remove1Object),
               ("remove5Objects", tableData.remove5Objects),
               ("remove10Objects", tableData.remove10Objects),
               ("lookup1Object", tableData.lookup1Object),
               ("lookup10Objects", tableData.lookup10Objects)]
    }

    open func cacheTableData() {
        if data == nil { return }
        StructuresStorage.store(data, to: structFileName)
    }
    
    func getInitialTest() -> TimeInterval {
        return lookup10Objects()
    }
    
    open func setupWithObjectCount(_ objectCount: Int) -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.setToManipulate = Set<String>(minimumCapacity: objectCount)
            for _ in 0 ..< objectCount {
                self.setToManipulate.insert(self.generator.standardRandomString())
            }
        }
    }
    
    //MARK: Add tests
    
    fileprivate func addObjects(_ count: Int) -> TimeInterval {
        let originalCount = setToManipulate.count
        var objectsArray = [String]()
        for _ in 0 ..< count {
            //Generate the appropriate number of random strings
            objectsArray.append(generator.standardRandomString())
        }
        
        //Add them all to the set, and measure how long it takes.
        let timed = Profiler.runClosureForTime() {
            let _ = self.setToManipulate.union(objectsArray)
        }
        
        for removeMe in objectsArray {
            self.setToManipulate.remove(removeMe)
        }
        
        //Make sure we're back to where we need to be.
        assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
        
        return timed
    }
    
    open func add1Object() -> TimeInterval {
        return addObjects(1)
    }
    
    open func add5Objects() -> TimeInterval {
        return addObjects(5)
    }
    
    open func add10Objects() -> TimeInterval {
        return addObjects(10)
    }
    
    //MARK: Remove tests
    
    fileprivate func removeObjects(_ count: Int) -> TimeInterval {
        let originalCount = setToManipulate.count
        var objectsArray = [String]()
        for _ in 0 ..< count {
            //Generate the appropriate number of random strings
            objectsArray.append(generator.standardRandomString())
        }
        //Add them all to the set
        let _ = self.setToManipulate.union(objectsArray)
        
        //measure how long it takes to remove them.
        let timed =  Profiler.runClosureForTime() {
            for removeMe in objectsArray {
                self.setToManipulate.remove(removeMe)
            }
        }
        
        //Make sure we're back to where we need to be.
        assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
        
        return timed
    }
    
    open func remove1Object() -> TimeInterval {
        return removeObjects(1)
    }
    
    open func remove5Objects() -> TimeInterval {
        return removeObjects(5)
    }
    
    open func remove10Objects() -> TimeInterval {
        return removeObjects(10)
    }
    
    //MARK: Lookup tests
    
    fileprivate func lookupObjects(_ count: Int) -> TimeInterval {
        let originalCount = setToManipulate.count
        var objectsArray = [String]()
        for _ in 0 ..< count {
            //Generate the appropriate number of random strings
            objectsArray.append(generator.standardRandomString())
        }
        //Add them all to the set
        let _ = self.setToManipulate.union(objectsArray)
        
        //measure how long it takes to find them
        let timed =  Profiler.runClosureForTime() {
            for findMe in objectsArray {
                let _ = self.setToManipulate.firstIndex(of: findMe)
            }
        }
        
        //Remove that which was added
        for removeMe in objectsArray {
            self.setToManipulate.remove(removeMe)
        }
        
        //Make sure we're back to where we need to be.
        assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
        
        return timed
    }
    
    open func lookup1Object() -> TimeInterval {
        return lookupObjects(1)
    }
    
    open func lookup10Objects() -> TimeInterval {
        return lookupObjects(10)
    }
}
