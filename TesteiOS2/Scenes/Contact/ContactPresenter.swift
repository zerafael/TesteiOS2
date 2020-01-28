//
//  ContactPresenter.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 22/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

class ContactPresenter {
    
    weak var viewController: ContactViewController?
    
    func presentContactCells(response: ContactModel.Response) {
        var viewModel = ContactModel.ViewModel()
        viewModel.cells = response.cells
        
        viewController?.displayCells(viewModel: viewModel)
    }
    
}
