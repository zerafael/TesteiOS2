//
//  CheckboxView.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 14/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class CheckboxView: UIView {

    lazy var checkbox: Checkbox = {
        let checkbox = Checkbox()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        return checkbox
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DINPro-Regular", size: 16)
        label.textColor = UIColor(rgb: Constants.Colors.checkboxLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(checkbox)
        self.addSubview(label)

        self.heightAnchor.constraint(equalToConstant: 21).isActive = true

        checkbox.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        checkbox.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkbox.widthAnchor.constraint(equalToConstant: 19).isActive = true
        checkbox.heightAnchor.constraint(equalToConstant: 19).isActive = true

        label.leftAnchor.constraint(equalTo: checkbox.rightAnchor, constant: 10).isActive = true
        label.centerYAnchor.constraint(equalTo: checkbox.centerYAnchor).isActive = true

        checkbox.addTarget(self, action: #selector(handleClearButton), for: .touchUpInside)
    }

    @objc private func handleClearButton() {
        checkbox.changeChecked()
    }

}

extension CheckboxView: ViewCell {
    
    func configure(viewModel: ContactCellViewModel) {
        label.text = viewModel.message
    }
    
}
