//
//  ReusableCell.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 30/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

protocol ReusableCell {

    static var reuseIdentifier: String { get }

}

extension ReusableCell {

    static var reuseIdentifier: String {
        return String(describing: self)
    }

}
