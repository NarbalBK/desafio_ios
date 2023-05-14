//
//  HomeCoordinator.swift
//  CarrefourTest
//
//  Created by Péricles Narbal on 11/05/23.
//

import UIKit

protocol HomeCoordinatorDelegate: NSObject {
    func goToUserProfile(data: UserProfileModel)
    func goToRepositoryList(data: UserProfileModel)
}

final class HomeCoordinator: NSObject, Coordinator {
    var navigationController: UINavigationController
    let repository = HomeRepository()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let view = UserListView()
        let _ = UserListViewModel(view: view, coordinator: self, repository: repository)
        let vc = UserListController(view: view)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func goToUserProfile(data: UserProfileModel) {
        let view = UserProfileView()
        let _ = UserProfileViewModel(view: view, coordinator: self, data: data)
        let vc = UserProfileController(view: view)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToRepositoryList(data: UserProfileModel) {
        let view = ReposListView()
        let viewModel = ReposListViewModel(view: view, coordinator: self, repository: repository, data: data)
        let vc = ReposListController(view: view, delegate: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
