//
//  ViewCell.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 23/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import UIKit

protocol ViewCell: UIView {
    func configure(viewModel: ContactCellViewModel)
}
