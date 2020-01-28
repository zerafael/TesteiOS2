//
//  TextFieldView.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 31/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class TextFieldView: UIView {

    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DINPro-Regular", size: 16)
        label.textColor = UIColor(rgb: Constants.Colors.labelTextField)
        label.text = "Nome"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "limpar"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()

    lazy var bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(rgb: Constants.Colors.lineTextField)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    var labelTopConstraint: NSLayoutConstraint!
    var labelLeftConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(label)
        self.addSubview(textField)
        self.addSubview(clearButton)
        self.addSubview(bottomLine)

        self.heightAnchor.constraint(equalToConstant: 55).isActive = true

        labelTopConstraint = label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        labelTopConstraint.isActive = true
        labelLeftConstraint = label.leftAnchor.constraint(equalTo: self.leftAnchor)
        labelLeftConstraint.isActive = true

        textField.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomLine.topAnchor, constant: -10).isActive = true
        textField.rightAnchor.constraint(equalTo: clearButton.leftAnchor, constant: -5).isActive = true
        
        clearButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        clearButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomLine.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bottomLine.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        textField.addTarget(self, action: #selector(handleTextFieldSelected), for: UIControl.Event.editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(handleClearButton), for: .touchUpInside)
    }

    @objc private func handleClearButton() {
        textField.text = ""
        self.resignFirstResponder()
        clearButton.isHidden = true
    }

}

// MARK: - Animations
extension TextFieldView {

    @objc func handleTextFieldSelected() {

        self.labelTopConstraint.isActive = false
        self.labelTopConstraint = self.label.topAnchor.constraint(equalTo: self.topAnchor)
        self.labelTopConstraint.isActive = true

        self.labelLeftConstraint.isActive = false
        self.labelLeftConstraint = self.label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -6.5)
        self.labelLeftConstraint.isActive = true

        UIView.animate(withDuration: 0.1) {

            self.label.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)

            self.label.layoutIfNeeded()
            self.layoutIfNeeded()

        }
    }

    func animateTextFieldDeselected() {
        self.labelTopConstraint.isActive = false
        self.labelTopConstraint = self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        self.labelTopConstraint.isActive = true

        self.labelLeftConstraint.isActive = false
        self.labelLeftConstraint = self.label.leftAnchor.constraint(equalTo: self.leftAnchor)
        self.labelLeftConstraint.isActive = true

        UIView.animate(withDuration: 0.1) {

            self.label.transform = CGAffineTransform(scaleX: 1, y: 1)

            self.label.layoutIfNeeded()
            self.layoutIfNeeded()

        }
    }

}

extension TextFieldView: UITextFieldDelegate {

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }

        if !text.isEmpty {
            clearButton.isHidden = false
        } else {
            clearButton.isHidden = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Teste")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Teste")
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Teste")
    }

    override func resignFirstResponder() -> Bool {
        textField.resignFirstResponder()
        guard let text = textField.text else {
            clearButton.isHidden = true
            animateTextFieldDeselected()
            return true
        }

        if text.isEmpty {
            clearButton.isHidden = true
            animateTextFieldDeselected()
        }

        return true
    }

}

extension TextFieldView: ViewCell {
    func configure(viewModel: ContactCellViewModel) {
        label.text = viewModel.message
    }
}
