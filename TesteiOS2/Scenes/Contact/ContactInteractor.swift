//
//  ContactInteractor.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 21/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation

class ContactInteractor {
    
    var presenter: ContactPresenter?
    
    func getContactCells(request: ContactModel.Request) {
        let contactService = ContactService()
        contactService.fetch { (result) in
            switch result {
            case .success(let data):
                let cells = data["cells"]
                var response = ContactModel.Response()
                response.cells = cells
                self.presenter?.presentContactCells(response: response)
            case .failure:
                print("Falhou")
            }
        }
    }
    
}
