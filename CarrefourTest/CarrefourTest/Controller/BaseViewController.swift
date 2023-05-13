//
//  BaseViewController.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 12/05/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    weak var controllerDelegate: ControllerLifeCicleDelegate?
    weak var contentView: UIView?
    
    let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(view: UIView?, delegate: ControllerLifeCicleDelegate? = nil) {
        contentView = view
        controllerDelegate = delegate
        super.init(nibName: nil, bundle: nil)
        
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }
    
    private func commomInit() {
        setupViews()
        setupConstraints()
    }
    
    func addView(view: UIView?) {
        if let view = view {
            contentStackView.addArrangedSubview(view)
        }
    }
    
    private func setupViews() {
        view.addSubview(contentStackView)
        addView(view: contentView)
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

extension BaseViewController {
    override func loadView() {
        super.loadView()
        controllerDelegate?.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controllerDelegate?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        controllerDelegate?.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        controllerDelegate?.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        controllerDelegate?.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        controllerDelegate?.viewDidDisappear(animated)
    }
}
