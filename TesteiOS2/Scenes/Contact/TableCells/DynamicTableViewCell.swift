//
//  DynamicTableViewCell.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 31/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {
    
    var content = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
//        content = ButtonView(title: "Enviar")
//        content = TextFieldView()
        content = CheckboxView()

        self.addSubview(content)

        // Temp
        content.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true

        content.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        content.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }

}
