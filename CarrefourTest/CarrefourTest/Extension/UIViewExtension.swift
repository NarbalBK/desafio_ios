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
    
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        activityStopAnimating()
        
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        DispatchQueue.main.async {
            if let background = self.viewWithTag(475647){
                background.removeFromSuperview()
            }
            self.isUserInteractionEnabled = true
        }
    }
}
