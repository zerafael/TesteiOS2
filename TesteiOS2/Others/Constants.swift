//
//  Constants.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 30/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

struct Constants {
    struct Colors {
        static let button = "#DA0101"
        static let buttonPressed = "#EB7676"
        
        static let checkboxSelected = "#DA0101"
        static let checkboxBorder = "#979797"
        static let checkboxLabel = "#ACACAC"

        static let labelTextField = "#ACACAC"
        static let text = "#7E7E7E"
        static let lineTextField = "#EFEEED"
        static let lineSelectedTextField = "#ACACAC"
        static let invalidInputTextField = "#FF1F1F"
        static let validInputTextField = "#65BE30"

    }
    
    struct API {
        static let formCells = "https://floating-mountain-50292.herokuapp.com/cells.json"
        static let investmentInfo = "http://floating-mountain-50292.herokuapp.com/fund.json"
    }
}
