//
//  ContactViewModel.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 20/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

enum ContactModel {
    
    struct Request {
    }
    
    struct Response {
        var cells: [ContactCell]?
    }
    
    struct ViewModel {
        var cells: [ContactCell]?
    }
    
}
