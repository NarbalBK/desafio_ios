//
//  HomeCoordinator.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

final class HomeCoordinator: NSObject, Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeController()
        navigationController.pushViewController(vc, animated: true)
    }
}
