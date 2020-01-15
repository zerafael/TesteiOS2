//
//  UIView+Extension.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 04/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func selected() {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.y")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 1.5
        scaleAnimation.duration = 0.1
        scaleAnimation.autoreverses = true

        self.layer.add(scaleAnimation, forKey: nil)
    }
    
}
