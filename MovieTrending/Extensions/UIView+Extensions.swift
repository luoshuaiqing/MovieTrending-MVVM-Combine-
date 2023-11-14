//
//  UIView+Extensions.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/14/23.
//

import Foundation
import UIKit

extension UIView {
    
    func round(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
