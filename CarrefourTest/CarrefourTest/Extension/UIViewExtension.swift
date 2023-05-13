//
//  UIViewExtension.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import UIKit

extension UIView {
    func applyCardShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}
