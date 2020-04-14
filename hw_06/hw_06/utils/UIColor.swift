//
//  UIColor.swift
//  004_collectionView
//
//  Created by Dmitry Dementyev on 21/06/2019.
//  Copyright © 2019 Dmitry Dementyev. All rights reserved.
//

import UIKit

extension UIColor{
    static var random: UIColor{
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)
    }
}
