//
//  InvestmentService.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 27/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import Alamofire

class InvestmentService: ApiService<Investment> {
    
    override init() {
        super.init()
        baseUrl = Constants.API.investmentInfo
    }
    
}
