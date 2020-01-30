//
//  ContactSendViewController.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 29/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class ContactSendViewController: UIViewController {
    
    lazy var thankLabel: UILabel = {
        let label = UILabel()
        label.text = "Obrigado!"
        label.font = UIFont(name: "DINPro-Medium", size: 14)
        label.textColor = UIColor(rgb: Constants.Colors.text)
        return label
    }()
    
    lazy var successMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Mensagem enviada com sucesso :)"
        label.numberOfLines = 0
        label.font = UIFont(name: "DINPro-Medium", size: 28)
        label.textColor = UIColor(rgb: Constants.Colors.contactSendLabel)
        return label
    }()
    
    lazy var sendNewContactButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar nova mensagem", for: .normal)
        button.tintColor = UIColor(rgb: Constants.Colors.button)
        button.layer.borderWidth = 0
        return button
    }()
    
    lazy var labelsStackview: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.thankLabel, self.successMessageLabel])
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.labelsStackview, self.sendNewContactButton])
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        view.addSubview(labelsStackview)
    }

}
