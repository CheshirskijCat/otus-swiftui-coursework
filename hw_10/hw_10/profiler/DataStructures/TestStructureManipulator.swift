//
//  TestAlgoProtocol.swift
//  courseApp
//
//  Created by Dmitry Dementyev on 02/09/2019.
//

import Foundation

protocol TestStructureManipulator {
    func setupWithObjectCount(_ objectCount: Int) -> TimeInterval
    func getTableData() -> [(String, TimeInterval)]
    func getInitialTest() -> TimeInterval
}
