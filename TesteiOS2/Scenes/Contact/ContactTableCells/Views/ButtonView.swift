//
//  ButtonView.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 31/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class ButtonView: UIButton {
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.layer.cornerRadius = 25
        self.backgroundColor = UIColor(rgb: Constants.Colors.button)
        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightAnchor.constraint(equalToConstant: 50).isActive = true

        self.addTarget(self, action: #selector(handleButtonPressed), for: .touchUpInside)
    }

    @objc private func handleButtonPressed() {
        self.pressed()
    }

}

extension ButtonView: ViewCell {
    func configure(viewModel: ContactCellViewModel) {
        self.setTitle(viewModel.message, for: .normal)
    }
}
