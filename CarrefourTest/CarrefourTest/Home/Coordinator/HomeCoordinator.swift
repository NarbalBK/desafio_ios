//
//  HomeCoordinator.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

final class HomeCoordinator: NSObject, Coordinator {
    var navigationController: UINavigationController
    let repository = HomeRepository()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeController()
        let view = HomeView()
        let viewModel = HomeViewModel(view: view, coordinator: self, repository: repository)
        view.viewModelDelegate = viewModel
        vc.addView(view: view)
        navigationController.pushViewController(vc, animated: true)
    }
}
