//
//  UserListController.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

final class UserListController: UIViewController {
    
    let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    func addView(view: UIView) {
        contentStackView.addArrangedSubview(view)
    }
    
    private func commomInit() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

