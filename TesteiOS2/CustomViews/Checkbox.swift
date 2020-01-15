//
//  Checkbox.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 14/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class Checkbox: UIButton {

    var checked: Bool = false

    lazy var selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: Constants.Colors.checkboxSelected)
        view.layer.cornerRadius = 3
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.layer.borderColor = UIColor(rgb: Constants.Colors.checkboxBorder).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 3
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(selectedView)

        selectedView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        selectedView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        selectedView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2).isActive = true
        selectedView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true

        shouldHideSelectedView()
    }

    func changeChecked() {
        checked = !checked
        shouldHideSelectedView()
    }

    private func shouldHideSelectedView() {
        selectedView.isHidden = !checked
    }

}
