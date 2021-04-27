//
//  UIButton + Extension.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit

extension UIButton {
    
    convenience init(title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor,
                     fontSize: CGFloat,
                     cornerRadius: CGFloat) {
        self.init(type: .system )
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
    

}
