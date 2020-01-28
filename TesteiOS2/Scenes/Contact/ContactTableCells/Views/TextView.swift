//
//  TextView.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 24/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class TextView: UIView {

    lazy var text: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DINPro-Light", size: 16)
        label.textColor = UIColor(rgb: Constants.Colors.text)
        label.numberOfLines = 0
        label.textAlignment = .center
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
        
        self.addSubview(text)
        
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        text.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        text.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        text.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor).isActive = true
    }

}

extension TextView: ViewCell {
    
    func configure(viewModel: ContactCellViewModel) {
        self.text.text = viewModel.message
    }
    
}
