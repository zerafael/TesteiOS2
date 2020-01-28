//
//  ContactViewController.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 30/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class ContactViewController: UITableViewController {
    
    var interactor: ContactInteractor?
    
    var contactCells: [ContactCell] = []
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        setupView()
        
        setup()
        getContactCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        registerCells()
        let presenter = ContactPresenter()
        self.interactor = ContactInteractor()
        presenter.viewController = self
        interactor?.presenter = presenter
    }

    private func setupView() {
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    func getContactCells() {
        let request = ContactModel.Request()
        interactor?.getContactCells(request: request)
    }
    
    func displayCells(viewModel: ContactModel.ViewModel) {
        
        guard let cells = viewModel.cells else {
            return
        }
        
        contactCells = cells
        tableView.reloadData()
    }
}

// MARK: - Table view methods

extension ContactViewController {
    private func registerCells() {
        tableView.register(DynamicContactTableViewCell.self)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactCells.count
    }

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as DynamicContactTableViewCell
        cell.configure(cellData: contactCells[indexPath.row])

        return cell
    }

}
