//
//  ActivityIndicatorView.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 13/05/23.
//

import UIKit

final class ActivityIndicatorView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var cardActivityView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    private func commomInit() {
        Bundle.main.loadNibNamed("ActivityIndicatorView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        setupView()
    }
    
    private func setupView() {
        cardActivityView.layer.cornerRadius = 20
        cardActivityView.applyCardShadow()
        activityView.startAnimating()
    }
    
    func addActivity() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.addSubview(self)
        }
    }
    
    func removeActivy() {
        DispatchQueue.main.async {
            self.removeFromSuperview()
        }
    }
    
    deinit {
        activityView.stopAnimating()
    }
}
