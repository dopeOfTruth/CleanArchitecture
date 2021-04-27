//
//  UIStackView + Extension.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
    
    }
}
