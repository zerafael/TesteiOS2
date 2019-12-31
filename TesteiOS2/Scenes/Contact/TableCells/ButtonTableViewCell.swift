//
//  ButtonTableViewCell.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 30/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(rgb: Constants.Colors.button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.addSubview(button)

        button.heightAnchor.constraint(equalToConstant: 50).isActive = true

        button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        button.addTarget(self, action: #selector(handleButtonPressed), for: .touchUpInside)
    }

    @objc private func handleButtonPressed() {
        button.pressed()
    }

}
