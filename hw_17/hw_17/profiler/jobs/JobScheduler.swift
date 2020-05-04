//
//  JobSheduler.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 22/09/2019.
//

import Foundation

class JobScheduler{
    
    let jobQueue = JobQueue()
    let testObjectsAmount = 10_000
    var result: ([InitTest])-> () = {_ in}
    
    init(items: [InitTest]){
        jobQueue.prepare()
        items.forEach { item in
            jobQueue.addAsync(name: item.0, amount: self.testObjectsAmount, closure: { item, amount in
                let manipulator = TestStructureFactory().getTestManipulator(item)
                _ = manipulator.setupWithObjectCount(amount)
                return manipulator.getInitialTest()
            })
        }
    }
    
    func execute(){
        jobQueue.start{ data in
            self.result(data)
        }
    }
    
    func onResult(result: @escaping ([InitTest])-> () ){
        self.result = result
    }
    
}
