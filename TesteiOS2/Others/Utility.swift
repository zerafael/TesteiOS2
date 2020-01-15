//
//  Utility.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 31/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class Utility {
    
    static func allAvailableFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
}
