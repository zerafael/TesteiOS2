//
//  ButtonView.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 31/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class ButtonView: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setupView(title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(_ title: String) {
        self.layer.cornerRadius = 25
        self.backgroundColor = UIColor(rgb: Constants.Colors.button)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)

        self.heightAnchor.constraint(equalToConstant: 50).isActive = true

        self.addTarget(self, action: #selector(handleButtonPressed), for: .touchUpInside)
    }

    @objc private func handleButtonPressed() {
        self.pressed()
    }

}
