//
//  FormService.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 15/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import Alamofire

class ContactService: ApiService<[ContactCell]> {
    
    override init() {
        super.init()
        baseUrl = Constants.API.formCells
    }
        
}
