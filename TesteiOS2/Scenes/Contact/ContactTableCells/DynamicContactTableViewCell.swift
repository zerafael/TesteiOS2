//
//  DynamicContactTableViewCell.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 31/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class DynamicContactTableViewCell: UITableViewCell {
    
    var content: ViewCell?
    
    var id: Int?
    var hiddenCell: Bool?
    var topSpacing: Double?
    var show: Int?
    var required: Bool?
    
    var topConstraint: NSLayoutConstraint!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(cellData: ContactCell) {
        
        switch cellData.type {
        case 1:
            content = TextFieldView()
        case 2:
            content = TextView()
//        case 3:
//            content = ImageView()
        case 4:
            content = CheckboxView()
        case 5:
            content = ButtonView()
        default:
            print("oo")
        }
        
        id = cellData.id
        hiddenCell = cellData.hidden
        topSpacing = cellData.topSpacing
        show = cellData.show
        required = cellData.required
        
        guard let content = content else {
            return
        }
        
        content.configure(viewModel: ContactCellViewModel(message: cellData.message, typefield: cellData.typefield))
        
        setupView()
    }

    private func setupView() {
        guard let content = content else {
            return
        }

        self.addSubview(content)

        topConstraint = content.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(topSpacing!))
        topConstraint.isActive = true

        content.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        content.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
