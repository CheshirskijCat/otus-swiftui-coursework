//
//  classObj.swift
//  hw_14 macOS
//
//  Created by Dmitry Dementyev on 03.05.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import RealmSwift

class ObjClass: Object{

    convenience required init(data: JSON){
        self.init()
    }
}
