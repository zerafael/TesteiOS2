//
//  UIButton+Extension.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 30/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    func pressed() {
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = UIColor(rgb: Constants.Colors.button).cgColor
        colorAnimation.toValue = UIColor(rgb: Constants.Colors.buttonPressed).cgColor
        colorAnimation.duration = 0.1
        colorAnimation.autoreverses = true

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 0.9
        scaleAnimation.duration = 0.1
        scaleAnimation.autoreverses = true

        self.layer.add(colorAnimation, forKey: nil)
        self.layer.add(scaleAnimation, forKey: nil)
    }

}
