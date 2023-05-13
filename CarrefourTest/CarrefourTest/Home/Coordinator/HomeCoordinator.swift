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
        let vc = UserListController()
        let view = UserListView()
        let viewModel = UserListViewModel(view: view, coordinator: self, repository: repository)
        view.viewModelDelegate = viewModel
        vc.addView(view: view)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToUserProfile(data: UserProfileModel) {
        let vc = UserProfileController()
        let view = UserProfileView()
        let viewModel = UserProfileViewModel(view: view, coordinator: self, data: data)
        view.viewModelDelegate = viewModel
        vc.addView(view: view)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToRepositoryList(data: UserProfileModel) {
        let vc = ReposListController()
        let view = ReposListView()
        let viewModel = ReposListViewModel(view: view, coordinator: self, repository: repository, data: data)
        view.viewModelDelegate = viewModel
        vc.addView(view: view)
        navigationController.pushViewController(vc, animated: true)
    }
}
