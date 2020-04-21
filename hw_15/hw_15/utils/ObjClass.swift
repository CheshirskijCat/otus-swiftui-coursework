//
//  ObjClass.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 19.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import RealmSwift

class ObjClass: Object{

    convenience required init(data: JSON){
        self.init()
    }
}
