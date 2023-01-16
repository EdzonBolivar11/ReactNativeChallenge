//
//  UIViewExtensions.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 13/01/23.
//

import Foundation
import UIKit

extension UIView {
    func round(_ radious: CGFloat = 10) {
        self.layer.cornerRadius = radious
        self.clipsToBounds = true
    }

    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
