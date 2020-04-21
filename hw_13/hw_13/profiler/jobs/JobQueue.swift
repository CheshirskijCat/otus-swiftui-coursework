//
//  JobQueue.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 22/09/2019.
//

import Foundation

class JobQueue {
    
    var group: DispatchGroup = DispatchGroup()
    var jobQueue: DispatchQueue = DispatchQueue.global(qos: .background)
    var jobs: [(String, Int, (String, Int) -> ())] = [(String, Int, (String, Int) -> ())]()
    var results: [InitTest] = [InitTest]()
    
    func prepare() {
        results.removeAll()
    }
    
    func addAsync(name: String, amount: Int, closure: @escaping (String, Int)->(TimeInterval)) {
        self.group.enter()
        jobs.append((name, amount, { name, amount in
            self.jobQueue.async {
                let value:InitTest = (name, closure(name, amount))
                self.jobQueue.sync{
                    self.results.append(value)
                }
                self.group.leave()
            }
        }))
    }

    func start(result: @escaping ([InitTest])->()) {
        group.notify(queue: .main) {
            result(self.results)
        }
        for job in jobs {
            job.2(job.0, job.1)
        }
    }
}
